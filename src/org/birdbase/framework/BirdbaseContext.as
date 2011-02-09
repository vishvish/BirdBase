package org.birdbase.framework
{
	import flash.display.DisplayObjectContainer;
	
	import org.as3commons.logging.ILogger;
	import org.as3commons.logging.LoggerFactory;
	import org.assetloader.AssetLoader;
	import org.assetloader.core.IAssetLoader;
	import org.assetloader.signals.LoaderSignal;
	import org.birdbase.framework.controller.configuration.ConfigureStateMachineCommand;
	import org.birdbase.framework.model.*;
	import org.birdbase.framework.service.*;
	import org.birdbase.framework.signals.ViewStateChanged;
	import org.birdbase.framework.utils.FlashVarsManager;
	import org.birdbase.framework.utils.swfaddress.SWFAddress;
	import org.birdbase.framework.view.BootstrapLoaderProgressView;
	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.utilities.modular.mvcs.ModuleContext;
	
	public class BirdbaseContext extends ModuleContext
	{
		protected var _loaderProgressView:BootstrapLoaderProgressView;
		
		public var logger:ILogger;
		
		public function BirdbaseContext( contextView:DisplayObjectContainer )
		{
			super( contextView );
			
			_loaderProgressView = new BootstrapLoaderProgressView();
			
			this.contextView.addChild( _loaderProgressView );
			
		}
		
		override public function startup():void
		{
			logger = LoggerFactory.getLogger( "org.birdbase.framework" );
			injector.mapValue( ILogger, logger );

			var fm:FlashVarsManager = new FlashVarsManager( contextView );
			injector.mapValue( FlashVarsManager, fm );
			
			var bootstrapLoader:IAssetLoader = new AssetLoader();
			bootstrapLoader.onOpen.add( onOpen );
			bootstrapLoader.onProgress.add( onProgress );
			bootstrapLoader.onComplete.add( onComplete );
			
			injector.mapValue( IAssetLoader, bootstrapLoader, "bootstrapLoader" );
			injector.mapClass( IAssetLoader, AssetLoader );
			
			// view state
			injector.mapSingleton( SWFAddress );
			injector.mapSingleton( ViewStateModel );
			injector.mapSingleton( ViewStateChanged );
			
			// services
			injector.mapSingleton( BootstrapModel );
			injector.mapSingleton( BootstrapService );
			injector.mapSingleton( AssetModel );
			injector.mapSingleton( AssetService );
			injector.mapSingleton( ConfigurationModel );
			injector.mapSingleton( ConfigurationService );
			
			commandMap.mapEvent( ContextEvent.STARTUP_COMPLETE, ConfigureStateMachineCommand, ContextEvent, true );
			
			logger.debug( "BirdbaseContext::startup" );
			super.startup();
		}

		private function onOpen( signal:LoaderSignal ):void
		{
			_loaderProgressView.start();
		}
		
		private function onProgress( signal:LoaderSignal ):void
		{
			_loaderProgressView.update( signal.loader.stats.progress );
		}
		
		private function onComplete( signal:LoaderSignal, data:* ):void
		{
			_loaderProgressView.update( signal.loader.stats.progress );
			var callback:Function = function():void
			{
				if( contextView.contains( _loaderProgressView ) )
				{
					contextView.removeChild( _loaderProgressView );
					_loaderProgressView = null;
				}
			}
			_loaderProgressView.stop( callback );
		}
	}
}