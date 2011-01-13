package com.tfto.application
{
	import com.tfto.application.view.*;
	import com.tfto.application.view.mediators.*;
	import com.tfto.birdbase.controller.configuration.ConfigureStateMachineCommand;
	import com.tfto.birdbase.model.*;
	import com.tfto.birdbase.service.*;
	import com.tfto.birdbase.signals.*;
	import com.tfto.utils.FlashVarsManager;
	
	import flash.display.DisplayObjectContainer;
	
	import org.as3commons.logging.ILogger;
	import org.as3commons.logging.LoggerFactory;
	import org.assetloader.AssetLoader;
	import org.assetloader.core.IAssetLoader;
	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.mvcs.SignalContext;
	
	import swfaddress.SWFAddress;
	
	/**
	 *	// TODO MainContext 
	 *	
	 *	// TODO @example 
	 *	
	 *	// TODO @exampleText 
	 *	
	 *	@author 	Vish Vishvanath
	 *	@email 		vish.vishvanath@gmail.com
	 *	@since 		11 January 2011
	 */
	public class MainContext extends SignalContext
	{
		/**
		 *	// TODO MainContext 
		 *	
		 *	@param contextView 
		 *	
		 *	@return 	
		 */
		public function MainContext( contextView:DisplayObjectContainer )
		{
			super( contextView );
		}
		
		/**
		 *	// TODO startup 
		 *	
		 *	@return void	
		 */
		override public function startup():void
        {
			var logger:ILogger = LoggerFactory.getLogger( "com.tfto.birdbase" );
			logger.debug( "MainContext::startup" );

			injector.mapValue( ILogger, logger );
			
			injector.mapSingletonOf( IAssetLoader, AssetLoader );
			
			injector.mapSingleton( SWFAddress );
			
			var fm:FlashVarsManager = new FlashVarsManager( contextView );

			injector.mapValue( FlashVarsManager, fm );
			
			// basic models
			
			injector.mapSingleton( ApplicationModel );
        	injector.mapSingleton( ViewStateModel );
			
			// signals
			injector.mapSingleton( ViewStateChanged );

			// services
			injector.mapSingleton( PreferencesModel );
			injector.mapSingleton( PreferencesService );
			injector.mapSingleton( L10nModel );
			injector.mapSingleton( L10nService );
			
			commandMap.mapEvent( ContextEvent.STARTUP_COMPLETE, ConfigureStateMachineCommand, ContextEvent, true );

			mediatorMap.mapView( MainContainerView, MainContainerViewMediator );
			mediatorMap.mapView( FirstView, FirstViewMediator );
			mediatorMap.mapView( SecondView, SecondViewMediator );
			mediatorMap.mapView( ThirdView, ThirdViewMediator );

			super.startup();
        }
	}
}