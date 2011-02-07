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
		public var model:ConfigurationModel;
		
		[Inject]
		public var logger:ILogger;
		
		/**
		 * Constructor 
		 */
		public function ConfigurationService()
		{
			super();
		}
		
		[PostConstruct]
		/**
		 * Triggered after construction. Finds the locale, finds the configuration and loads it.
		 */
		public function init():void
		{
			model.configurationFilename = 
				fm.vars( "configurationFilename" ) 
				? fm.vars( "configurationFilename" ) : model.configurationFilename;
			
			var preferences:URLRequest = new URLRequest( "assets/" + bm.locale + "/" + model.configurationFilename );
			var loader:URLLoader = new URLLoader();
			
			loader.addEventListener( Event.COMPLETE, handleComplete );
			loader.addEventListener( IOErrorEvent.IO_ERROR, handleError );
			loader.load( preferences );
		}
		
		private function handleError( event:IOErrorEvent ):void
		{
			logger.error( event.text );
		}
		
		private function handleComplete( event:Event ) : void
		{
			var map:Dictionary = YAML.decode( event.target.data ) as Dictionary;
			model.conf = map;
			logger.debug( "L10nService::loaded YAML" );
			eventDispatcher.dispatchEvent( new StateEvent( StateEvent.ACTION, ConfigureStateMachineCommand.CONFIGURE_LOCALIZATION_COMPLETE ) );
		}
	}
}