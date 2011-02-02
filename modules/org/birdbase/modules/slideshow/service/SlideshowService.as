package org.birdbase.modules.slideshow.service
{
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	import org.as3commons.logging.ILogger;
	import org.birdbase.framework.controller.configuration.ConfigureStateMachineCommand;
	import org.birdbase.framework.utils.FlashVarsManager;
	import org.birdbase.framework.utils.PropertiesParser;
	import org.birdbase.modules.slideshow.model.SlideshowModel;
	import org.robotlegs.mvcs.Actor;
	import org.robotlegs.utilities.statemachine.StateEvent;
	
	public class SlideshowService extends Actor
	{
		[Inject]
		public var fm:FlashVarsManager;
		
		[Inject]
		public var model:SlideshowModel;
		
		[Inject]
		public var logger:ILogger;
		
		public function SlideshowService()
		{
			super();
		}
		
		[PostConstruct]
		public function init():void
		{
			model.locale = 
				fm.vars( "locale" ) 
				? fm.vars( "locale" ) : "en_GB";
			
			model.slideshowFilename = "l10n.properties";
			
			var preferences:URLRequest = new URLRequest( "assets/" + model.locale + "/" + model.slideshowFilename );
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
			model.props = PropertiesParser.parse( URLLoader( event.target ).data );
			logger.debug( "L10nService::loaded" );
			eventDispatcher.dispatchEvent( new StateEvent( StateEvent.ACTION, ConfigureStateMachineCommand.CONFIGURE_LOCALIZATION_COMPLETE ) );
		}
	}
}