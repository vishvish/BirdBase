package com.tfto.birdbase.service
{
	import com.tfto.birdbase.controller.AppConfigStateConstants;
	import com.tfto.birdbase.model.PreferencesModel;
	import com.tfto.birdbase.utils.FlashVarsManager;
	import com.tfto.birdbase.utils.PropertiesParser;
	
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	import org.as3commons.logging.ILogger;
	import org.robotlegs.mvcs.Actor;
	import org.robotlegs.utilities.statemachine.StateEvent;

	/**
	 *	// TODO PreferencesService 
	 *	
	 *	// TODO @example 
	 *	
	 *	// TODO @exampleText 
	 *	
	 *	@author 	Vish Vishvanath
	 *	@email 		vish.vishvanath@gmail.com
	 *	@since 		11 January 2011
	 */
	public class PreferencesService extends Actor
	{
		[Inject]
		public var fm:FlashVarsManager;
		
		[Inject]
		/**
		 *	// TODO model 
		 */
		public var model:PreferencesModel;
		
		[Inject]
		/**
		 *	// TODO logger 
		 */
		public var logger:ILogger;

		/**
		 *	// TODO PreferencesService 
		 */
		public function PreferencesService()
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
				? fm.vars( "locale" ) : "en_GB";
			
			model.preferencesFileName = 
				fm.vars( "preferencesFileName" ) 
				? fm.vars( "preferencesFileName" ) : "preferences.properties";

			var preferences:URLRequest = new URLRequest( model.assetBasePath + model.preferencesFileName );
			var loader:URLLoader = new URLLoader();
			
			loader.addEventListener( Event.COMPLETE, handleComplete );
			loader.addEventListener( IOErrorEvent.IO_ERROR, handleError );
			loader.load( preferences );
		}

		/**
		 *	// TODO handleError 
		 *	
		 *	@param event 
		 *	
		 *	@return void	
		 */
		private function handleError(event:IOErrorEvent):void
		{
			logger.error( event.text );
		}

		/**
		 *	// TODO handleComplete 
		 *	
		 *	@param event 
		 *	
		 *	@return void	
		 */
		private function handleComplete(event:Event):void
		{
			model.props = PropertiesParser.parse( URLLoader( event.target ).data );
			logger.debug( "PreferencesService::loaded" );
			eventDispatcher.dispatchEvent( new StateEvent( StateEvent.ACTION, AppConfigStateConstants.CONFIGURE_PREFERENCES_COMPLETE ) );
		}
	}
}