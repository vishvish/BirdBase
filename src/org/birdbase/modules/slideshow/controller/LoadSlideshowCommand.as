package org.birdbase.modules.slideshow.controller
{
	import org.as3commons.collections.ArrayList;
	import org.as3commons.logging.ILogger;
	import org.assetloader.AssetLoader;
	import org.assetloader.core.IAssetLoader;
	import org.assetloader.signals.ErrorSignal;
	import org.assetloader.signals.LoaderSignal;
	import org.birdbase.framework.model.PreferencesModel;
	import org.birdbase.modules.slideshow.ISlideshowModule;
	import org.birdbase.modules.slideshow.signals.SlideshowLoaded;
	import org.birdbase.modules.slideshow.view.SlideshowView;
	import org.osflash.signals.Signal;
	import org.robotlegs.mvcs.SignalCommand;
	
	public class LoadSlideshowCommand extends SignalCommand
	{
		[Inject]
		public var logger:ILogger;
		
		[Inject]
		public var pm:PreferencesModel;
		
		[Inject]
		public var assetLoader:IAssetLoader;

		[Inject]
		public var list:ArrayList;
		
		// ideally inject this from the dependency name defined in the injector
		public var name:String = "slideshow";

		public function LoadSlideshowCommand()
		{
			super();
		}

		override public function execute():void
		{
			assetLoader.addConfig( pm.assetBasePath + "modules/" + name + ".xml" );
			assetLoader.onConfigLoaded.add( handleConfigLoaded );
			assetLoader.onComplete.add( handleComplete );
			assetLoader.onProgress.add( handleProgress );
			//signalCommandMap.mapSignal( assetLoader.onComplete, SlideshowLoadedCommand, true );
		}
		
		private function handleConfigLoaded( signal:LoaderSignal ):void
		{
			logger.debug( "LoadSlideshowCommand::handleConfigLoaded " + signal.loader.id );
			logger.debug( "LoadSlideshowCommand::loadingAssets" );
			
			signal.loader.onProgress.add( handleProgress );
			signal.loader.onComplete.add( handleComplete );
			signal.loader.onError.add( handleError );
			signal.loader.start();
		}
		
		private function handleError( signal:ErrorSignal ):void
		{
			
		}
		
		private function handleComplete( signal:LoaderSignal, data:* ):void
		{
			for( var o:Object in data )
			{
				logger.debug( "LoadSlideshowCommand::loaded: " + o );
				list.add( assetLoader.getAsset( o ) );
			}
			logger.debug( "LoadSlideshowCommand::handleComplete()" );
			var ss:SlideshowLoaded = new SlideshowLoaded( list );
			ss.dispatch();

			var view:SlideshowView = new SlideshowView();
			contextView.addChild( view );
			var s:Signal = new Signal();
			view.show( s );	
		}
		
		private function handleProgress( signal:LoaderSignal ):void
		{
//			logger.debug( "handleprogress " + signal.loader.data );
		}
	}
}