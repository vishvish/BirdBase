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
	import org.birdbase.framework.model.L10nModel;
	import org.birdbase.framework.utils.FlashVarsManager;
	import org.robotlegs.mvcs.Actor;
	import org.robotlegs.utilities.statemachine.StateEvent;
	
	/**
	 *	// TODO L10nService 
	 *	
	 *	// TODO @example 
	 *	
	 *	// TODO @exampleText 
	 *	
	 *	@author 	Vish Vishvanath
	 *	@email 		vish.vishvanath@gmail.com
	 *	@since 		11 January 2011
	 */
	public class L10nService extends Actor
	{
		[Inject]
		public var fm:FlashVarsManager;
		
		[Inject]
		public var model:org.birdbase.framework.model.L10nModel;
		
		[Inject]
		/**
		 *	// TODO logger 
		 */
		public var logger:ILogger;
		
		/**
		 *	// TODO L10nService 
		 */
		public function L10nService()
		{
			super();
		}
		
		[PostConstruct]
		/**
		 *	// TODO init 
		 *	
		 *	@return void	
		 */
		public function init():void
		{
			model.locale = 
				fm.vars( "locale" ) 
				? fm.vars( "locale" ) : model.locale;
			
			model.l10nFilename = 
				fm.vars( "l10nFilename" ) 
				? fm.vars( "l10nFilename" ) : model.l10nFilename;
			
			var preferences:URLRequest = new URLRequest( "assets/" + model.locale + "/" + model.l10nFilename );
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
			model.map = map;
			logger.debug( "L10nService::loaded YAML" );
			eventDispatcher.dispatchEvent( new StateEvent( StateEvent.ACTION, ConfigureStateMachineCommand.CONFIGURE_LOCALIZATION_COMPLETE ) );
		}
	}
}