package org.birdbase.framework
{
	import flash.display.DisplayObjectContainer;
	
	import org.as3commons.logging.ILogger;
	import org.as3commons.logging.LoggerFactory;
	import org.assetloader.AssetLoader;
	import org.assetloader.core.IAssetLoader;
	import org.birdbase.framework.controller.configuration.ConfigureStateMachineCommand;
	import org.birdbase.framework.model.*;
	import org.birdbase.framework.service.*;
	import org.birdbase.framework.signals.ViewStateChanged;
	import org.birdbase.framework.utils.FlashVarsManager;
	import org.birdbase.framework.utils.swfaddress.SWFAddress;
	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.utilities.modular.mvcs.ModuleContext;
	
	public class BirdbaseContext extends ModuleContext
	{
		public var logger:ILogger;
		
		public function BirdbaseContext( contextView:DisplayObjectContainer )
		{
			super( contextView );
		}
		
		override public function startup():void
		{
			logger = LoggerFactory.getLogger( "org.birdbase.framework" );
			injector.mapValue( ILogger, logger );

			var fm:FlashVarsManager = new FlashVarsManager( contextView );
			injector.mapValue( FlashVarsManager, fm );
			
			injector.mapSingletonOf( IAssetLoader, AssetLoader, "bootstrapLoader" );
			injector.mapClass( IAssetLoader, AssetLoader );
			
			// view state
			injector.mapSingleton( SWFAddress );
			injector.mapSingleton( ViewStateModel );
			injector.mapSingleton( ViewStateChanged );
			
			// services
			injector.mapSingleton( PreferencesModel );
			injector.mapSingleton( PreferencesService );
			injector.mapSingleton( L10nModel );
			injector.mapSingleton( L10nService );
			
			commandMap.mapEvent( ContextEvent.STARTUP_COMPLETE, ConfigureStateMachineCommand, ContextEvent, true );
			
			logger.debug( "BirdbaseContext::startup" );
			super.startup();
		}
	}
}