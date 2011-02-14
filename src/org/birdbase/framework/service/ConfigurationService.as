package org.birdbase.framework.service
{
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.utils.Dictionary;
	
	import org.as3commons.logging.ILogger;
	import org.as3yaml.YAML;
	import org.birdbase.framework.controller.configuration.ConfigureStateMachineCommand;
	import org.birdbase.framework.model.BootstrapModel;
	import org.birdbase.framework.model.ConfigurationModel;
	import org.birdbase.framework.model.NavigationModel;
	import org.birdbase.framework.utils.FlashVarsManager;
	import org.robotlegs.mvcs.Actor;
	import org.robotlegs.utilities.statemachine.StateEvent;
	
	/**
	 *	The ConfigurationService loads the data and structural information for the site from a YAML file.
	 *	
	 *	@author 	Vish Vishvanath
	 *	@email 		vish.vishvanath@gmail.com
	 *	@since 		11 January 2011
	 */
	public class ConfigurationService extends Actor
	{
		[Inject]
		public var fm:FlashVarsManager;
		
		[Inject]
		public var bm:BootstrapModel;
		
		[Inject]
		public var bootstrapModel:ConfigurationModel;
		
		[Inject]
		public var navigationModel:NavigationModel;
		
		[Inject]
		public var textService:TextService;
		
		[Inject(name="birdbase")]
		public var logger:ILogger;
		
		/**
		 * Constructor 
		 */
		public function ConfigurationService()
		{
			super();
		}
		
		/**
		 * Triggered after construction. Finds the locale, finds the configuration and loads it.
		 */
		[PostConstruct]
		public function init():void
		{
			bootstrapModel.configurationFilename = 
				fm.vars( "configurationFilename" ) 
				? fm.vars( "configurationFilename" ) : bootstrapModel.configurationFilename;
			
			var preferences:URLRequest = new URLRequest( "assets/" + bm.locale + "/" + bootstrapModel.configurationFilename );
			var loader:URLLoader = new URLLoader();
			
			loader.addEventListener( Event.COMPLETE, handleComplete );
			loader.addEventListener( IOErrorEvent.IO_ERROR, handleError );
			loader.load( preferences );
		}
		
		private function handleError( e:IOErrorEvent ):void
		{
			logger.error( e.text );
		}
		
		private function handleComplete( e:Event ) : void
		{
			try
			{
				var map:Dictionary = YAML.decode( e.target.data ) as Dictionary;
				bootstrapModel.conf = map;
				navigationModel.navigation = map.nav;
				textService.strings = map.strings;
				
				logger.debug( "L10nService::loaded YAML" );
				eventDispatcher.dispatchEvent( new StateEvent( StateEvent.ACTION, ConfigureStateMachineCommand.CONFIGURE_LOCALIZATION_COMPLETE ) );
			}
			catch( e:Error )
			{
				logger.error( e.message );
			}
		}
	}
}