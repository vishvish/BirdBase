package org.birdbase.framework.controller.assets
{
	import org.as3commons.logging.ILogger;
	import org.assetloader.core.IAssetLoader;
	import org.assetloader.signals.ErrorSignal;
	import org.assetloader.signals.LoaderSignal;
	import org.birdbase.framework.controller.AppConfigStateConstants;
	import org.birdbase.framework.model.PreferencesModel;
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
	public class LoadAssetsCommand extends SignalCommand
	{
		[Inject]
		public var logger:ILogger;
		
		[Inject(name="bootstrapLoader")]
		public var assetLoader:IAssetLoader;
		
		[Inject]
		public var pm:PreferencesModel;
		
		/**
		 *	// TODO execute 
		 *	
		 *	@return void	
		 */
		override public function execute():void
		{
			logger.error( "LoadAssetsCommand::execute" );
			logger.debug( "Loading from: " + pm.assetBasePath + pm.getProperty( "assetsFile" ) );

			assetLoader.addConfig( pm.assetBasePath + pm.getProperty( "assetsFile" ) );
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
			logger.debug( "LoadAssetsCommand::handleprogress " + signal.loader.data );
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
			eventDispatcher.dispatchEvent( new StateEvent( StateEvent.ACTION, AppConfigStateConstants.LOAD_ASSETS_COMPLETE ) );
		}
	}
}