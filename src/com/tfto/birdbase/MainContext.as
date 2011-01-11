package com.tfto.birdbase
{
	import com.tfto.birdbase.controller.configuration.ConfigureStateMachineCommand;
	import com.tfto.birdbase.controller.state.ChangeApplicationStateCommand;
	import com.tfto.birdbase.model.ApplicationModel;
	import com.tfto.birdbase.model.L10nModel;
	import com.tfto.birdbase.model.PreferencesModel;
	import com.tfto.birdbase.model.ViewStateModel;
	import com.tfto.birdbase.service.L10nService;
	import com.tfto.birdbase.service.PreferencesService;
	import com.tfto.birdbase.signals.ModifyApplicationState;
	import com.tfto.birdbase.signals.ViewStateChanged;
	
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
			var logger:ILogger = LoggerFactory.getLogger( "application-logger" );
			logger.debug( "MainContext::startup" );

			injector.mapValue( ILogger, logger );
			
			injector.mapSingletonOf( IAssetLoader, AssetLoader );
			
        	injector.mapSingleton( SWFAddress );

			injector.mapSingleton( ApplicationModel );
        	injector.mapSingleton( ViewStateModel );
        	injector.mapSingleton( ViewStateChanged );

			injector.mapSingleton( PreferencesModel );
			injector.mapSingleton( PreferencesService );
			
			injector.mapSingleton( L10nModel );
			injector.mapSingleton( L10nService );
			
			// maps a signal for SWFAddress
			signalCommandMap.mapSignalClass( ModifyApplicationState, ChangeApplicationStateCommand );

			commandMap.mapEvent( ContextEvent.STARTUP, ConfigureStateMachineCommand, ContextEvent, true );

			dispatchEvent( new ContextEvent(ContextEvent.STARTUP ) );

        	super.startup();
        }
	}
}