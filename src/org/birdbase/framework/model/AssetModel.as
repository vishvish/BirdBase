package org.birdbase.framework.model
{
	import flash.display.MovieClip;
	
	import org.as3commons.logging.ILogger;
	import org.assetloader.core.IAssetLoader;
	import org.assetloader.signals.LoaderSignal;
	import org.birdbase.framework.controller.configuration.ConfigureStateMachineCommand;
	import org.birdbase.framework.utils.DynamicSprite;
	import org.robotlegs.mvcs.Actor;
	import org.robotlegs.utilities.statemachine.StateEvent;
	
	public class AssetModel extends Actor
	{
		[Inject]
		public var logger:ILogger;

		[Inject(name="bootstrapLoader")]
		public var assetLoader:IAssetLoader;
		
		public function AssetModel()
		{
			super();
		}
		
		[PostConstruct]
		public function init():void
		{
			assetLoader.onConfigLoaded.add( onConfigLoaded );
			assetLoader.onProgress.add( onProgress );
			assetLoader.onOpen.add( onOpen );
			assetLoader.onComplete.add( onComplete );
		}
		
		private function onConfigLoaded( signal:LoaderSignal ):void
		{
			signal.loader.start();
		}

		private function onProgress( signal:LoaderSignal ):void
		{
			trace( "onProgress", signal.loader.stats.progress );
		}

		private function onOpen( signal:LoaderSignal ):void
		{
			trace( "onOpen", signal.loader.stats.progress );
		}

		private function onComplete( signal:LoaderSignal, data:* ):void
		{
			// prints out all assets as they are loaded - might be useful during testing.
			/*for( var o:Object in data )
			{
				logger.debug( "AssetModel::loaded: " + o );
			}*/
			logger.debug( "AssetModel::onComplete()" );

			if( assetLoader.getAsset( "dynamicLibrary" ) )
			{
				DynamicSprite.update( "dynamicLibrary", assetLoader.getAsset( "dynamicLibrary" ) as MovieClip );
				logger.debug( "DynamicSprite successfully updated with dynamic library" );
			}
			else
			{
				logger.error( "Dynamic Library not found" );
				throw new Error( "Dynamic Library not found" );
			}
			eventDispatcher.dispatchEvent( new StateEvent( StateEvent.ACTION, ConfigureStateMachineCommand.LOAD_ASSETS_COMPLETE ) );
		}

	}
}