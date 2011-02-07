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
	import org.birdbase.framework.model.AssetModel;
	import org.birdbase.framework.model.BootstrapModel;
	import org.birdbase.framework.utils.FlashVarsManager;
	import org.robotlegs.mvcs.Actor;
	import org.robotlegs.utilities.statemachine.StateEvent;

	/**
	 *	BootstrapService 
	 *	
	 *	@author 	Vish Vishvanath
	 *	@email 		vish.vishvanath@gmail.com
	 *	@since 		11 January 2011
	 */
	public class BootstrapService extends Actor
	{
		[Inject]
		public var fm:FlashVarsManager;
		
		[Inject]
		public var model:BootstrapModel;
		
		[Inject]
		public var assetModel:AssetModel;
		
		[Inject]
		public var logger:ILogger;

		public function BootstrapService()
		{
			super();
		}
		
		[PostConstruct]
		public function init():void
		{
			model.locale = 
				fm.vars( "locale" ) 
				? fm.vars( "locale" ) : "en_GB";
			
			model.bootstrap = 
				fm.vars( "bootstrapFilename" ) 
				? fm.vars( "bootstrapFilename" ) : "bootstrap.yml";

			var preferences:URLRequest = new URLRequest( model.assetBasePath + model.bootstrap );
			var loader:URLLoader = new URLLoader();
			
			loader.addEventListener( Event.COMPLETE, handleComplete );
			loader.addEventListener( IOErrorEvent.IO_ERROR, handleError );
			loader.load( preferences );
		}

		private function handleError(event:IOErrorEvent):void
		{
			logger.error( event.text );
		}

		private function handleComplete(event:Event):void
		{
			var map:Dictionary = YAML.decode( event.target.data ) as Dictionary;
			model.load( map );
			logger.debug( "BootstrapService::loaded" );
			eventDispatcher.dispatchEvent( new StateEvent( StateEvent.ACTION, ConfigureStateMachineCommand.CONFIGURE_PREFERENCES_COMPLETE ) );
		}
	}
}