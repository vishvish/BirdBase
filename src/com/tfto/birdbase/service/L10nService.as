package com.tfto.birdbase.service
{
	import com.tfto.birdbase.controller.AppConfigStateConstants;
	import com.tfto.birdbase.model.L10nModel;
	import com.tfto.utils.FlashVarsManager;
	import com.tfto.utils.PropertiesParser;
	
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	import org.as3commons.logging.ILogger;
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
		/**
		 *	// TODO model 
		 */
		public var model:L10nModel;
		
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
				FlashVarsManager.getInstance().vars( "locale" ) 
				? FlashVarsManager.getInstance().vars( "locale" ) : "en_GB";
			
			model.l10nFilename = 
				FlashVarsManager.getInstance().vars( "l10nFilename" ) 
				? FlashVarsManager.getInstance().vars( "l10nFilename" ) : "l10n.properties";
			
			var preferences:URLRequest = new URLRequest( "assets/" + model.locale + "/" + model.l10nFilename );
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
			logger.debug( "L10nService::loaded" );
			eventDispatcher.dispatchEvent( new StateEvent( StateEvent.ACTION, AppConfigStateConstants.CONFIGURE_LOCALIZATION_COMPLETE ) );
		}
	}
}