package org.birdbase.framework.controller.assets
{
	import org.as3commons.logging.ILogger;
	import org.assetloader.core.IAssetLoader;
	import org.assetloader.signals.ErrorSignal;
	import org.assetloader.signals.LoaderSignal;
	import org.birdbase.framework.controller.configuration.ConfigureStateMachineCommand;
	import org.birdbase.framework.model.BootstrapModel;
	import org.robotlegs.mvcs.SignalCommand;
	import org.robotlegs.utilities.statemachine.StateEvent;
	
	/**
	 *	// TODO LoadAssetsCommand 
	 *	
	 *	// TODO @example 
	 *	
	 *	// TODO @exampleText 
	 *	
	 *	@author 	Vish Vishvanath
	 *	@email 		vish.vishvanath@gmail.com
	 *	@since 		11 January 2011
	 */
	public class LoadDesignAssetsCommand extends SignalCommand
	{
		[Inject]
		public var logger:ILogger;
		
		[Inject(name="bootstrapLoader")]
		public var assetLoader:IAssetLoader;
		
		[Inject]
		public var bm:BootstrapModel;
		
		override public function execute():void
		{
			logger.error( "LoadAssetsCommand::execute" );
			logger.debug( "Loading from: " + bm.assetBasePath + bm.getPreference( "assetsFile" ) );

			assetLoader.addConfig( bm.assetBasePath + bm.getPreference( "assetsFile" ) );
			assetLoader.onConfigLoaded.add( handleConfigLoaded );
			
			signalCommandMap.mapSignal( assetLoader.onComplete, RegisterDynamicLibraryCommand, true );
		}
		
		private function handleConfigLoaded( signal:LoaderSignal ):void
		{
			logger.debug( "LoadAssetsCommand::handleConfigLoaded " + signal.loader.id );
			logger.debug( "LoadAssetsCommand::loadingAssets" );
			
			signal.loader.onProgress.add( handleProgress );
			signal.loader.onComplete.add( handleComplete );
			signal.loader.onError.add( handleError );
			signal.loader.start();
		}

		private function handleProgress( signal:LoaderSignal ):void
		{
			logger.debug( "LoadAssetsCommand::handleprogress " + IAssetLoader( signal.loader ).stats.bytesLoaded );
		}

		private function handleError( signal:ErrorSignal ):void
		{
			logger.error( signal.message );
		}

		private function handleComplete( signal:LoaderSignal, data:* ):void
		{
			for( var o:Object in data )
			{
				logger.debug( "LoadAssetsCommand::loaded: " + o );
			}
			logger.debug( "LoadAssetsCommand::handleComplete()" );
			eventDispatcher.dispatchEvent( new StateEvent( StateEvent.ACTION, ConfigureStateMachineCommand.LOAD_ASSETS_COMPLETE ) );
		}
	}
}