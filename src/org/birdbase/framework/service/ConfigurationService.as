package org.birdbase.framework.service
{
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.utils.Dictionary;
	
	import org.as3yaml.YAML;
	import org.birdbase.framework.controller.boot.BootManagement;
	import org.birdbase.framework.model.*;
	import org.birdbase.support.utils.FlashVarsManager;
	import org.robotlegs.mvcs.Actor;
	import org.robotlegs.utilities.statemachine.StateEvent;
	import org.birdbase.framework.service.text.ITextService;
	
	/**
	 *	The ConfigurationService loads the data and structural information for the site from a YAML file.
	 *	
	 *	@author 	Vish Vishvanath
	 *	@since 		11 January 2011
	 */
	public class ConfigurationService extends Actor implements IConfigurationService
	{
		[Inject]
		public var fm:FlashVarsManager;
		
		[Inject]
		public var configurationModel:IConfigurationModel;
		
		[Inject]
		public var navigationModel:INavigationModel;
		
		[Inject]
		public var textService:ITextService;
		
		public function ConfigurationService()
		{
			super();
		}
		
		/**
		 * Loads the required configuration file in the right locale.
		 */
		[PostConstruct]
		public function init():void
		{
			if( fm.locale == null )
			{
				fm.locale = "en_GB";
			}			
			
			configurationModel.configurationFilename = 
				fm.configuration != null
				? fm.configuration
				: configurationModel.configurationFilename;
			
			var configURL:String;
			
			if( configurationModel.configurationFilename.indexOf( "http://" ) != -1
			|| configurationModel.configurationFilename.indexOf( "https://" ) != -1 )
			{
				configURL = configurationModel.configurationFilename;
			}
			else
			{
				configURL = "assets/" + fm.locale + "/" + configurationModel.configurationFilename;
			}
			
			var loader:URLLoader = new URLLoader();
			loader.addEventListener( Event.COMPLETE, handleComplete );
			loader.addEventListener( IOErrorEvent.IO_ERROR, handleError );
			loader.load( new URLRequest( configURL ) );
		}
		
		private function setConfiguration( d:Dictionary ):void
		{
			configurationModel.conf = d;
		}
		
		private function setStrings( d:Dictionary ):void
		{
			textService.strings = d.strings;
		}
		
		private function setPreferences( d:Dictionary ):void
		{
			Settings.restricted.setValues( d.restricted );
			Settings.unrestricted.setValues( d.unrestricted );
		}
		
		private function setNavigation( d:Dictionary ):void
		{
			navigationModel.navigationArray = d.nav;
		}
		
		private function handleError( e:IOErrorEvent ):void
		{
			fatal( e.text );
			eventDispatcher.dispatchEvent( new StateEvent( StateEvent.ACTION, BootManagement.CONFIGURING_SERVICES_FAILED ) );
		}
		
		private function handleComplete( e:Event ) : void
		{
			try
			{
				var d:Dictionary = YAML.decode( e.target.data ) as Dictionary;
				
				setConfiguration( d )
				setStrings( d );
				setPreferences( d );
				setNavigation( d );

				eventDispatcher.dispatchEvent( new StateEvent( StateEvent.ACTION, BootManagement.CONFIGURING_SERVICES_COMPLETE ) );
			}
			catch( e:Error )
			{
				fatal( e.message );
				eventDispatcher.dispatchEvent( new StateEvent( StateEvent.ACTION, BootManagement.CONFIGURING_SERVICES_FAILED ) );
			}
		}
	}
}