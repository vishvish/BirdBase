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
			assetLoader.onComplete.add( onComplete );
		}
		
		private function onConfigLoaded( signal:LoaderSignal ):void
		{
			signal.loader.start();
		}

		private function onComplete( signal:LoaderSignal, data:* ):void
		{
			// prints out all assets as they are loaded - might be useful during testing.
			/*for( var o:Object in data )
			{
				logger.debug( "AssetModel::loaded: " + o );
			}*/
//			assetLoader.onComplete.loader.stats.progress
//			signal.dispatch();
			try {
//				logger.debug( "AssetModel::onComplete --> " + assetLoader.onComplete.loader.stats.progress );
				if( assetLoader.getAsset( "dynamicLibrary" ) )
				{
					DynamicSprite.update( "dynamicLibrary", assetLoader.getAsset( "dynamicLibrary" ) as MovieClip );
					logger.debug( "AssetModel::onComplete --> DynamicSprite updated" );
				}
				else
				{
					throw new Error( "AssetModel::onComplete --> Dynamic Library not found" );
				}
				
			}
			catch( e:Error )
			{
					logger.error( e.message );
			}
			finally
			{
				eventDispatcher.dispatchEvent( new StateEvent( StateEvent.ACTION, ConfigureStateMachineCommand.LOAD_ASSETS_COMPLETE ) );
			}
		}

	}
}