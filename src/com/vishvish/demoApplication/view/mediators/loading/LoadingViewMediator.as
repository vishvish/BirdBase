package com.vishvish.demoApplication.view.mediators.loading
{
	import org.birdbase.framework.view.BootstrapLoaderProgressView;
	import com.vishvish.demoApplication.view.mediators.abstract.ApplicationMediator;
	
	import org.assetloader.signals.LoaderSignal;
	import org.birdbase.framework.model.AssetModel;
	import org.birdbase.framework.service.AssetService;
	import org.osflash.signals.Signal;

	public class LoadingViewMediator extends ApplicationMediator
	{
		[Inject]
		public var view:BootstrapLoaderProgressView;
		
		[Inject]
		public var assetService:AssetService;

		public function LoadingViewMediator()
		{
			//
		}
		
		override public function onRegister():void
		{
			super.onRegister();

			view.main();
			assetService.assetLoader.onOpen.add( onOpen );
			assetService.assetLoader.onProgress.add( onProgress );

		}

		private function onOpen( signal:LoaderSignal ):void
		{
			view.start();
		}

		private function onProgress( signal:LoaderSignal ):void
		{
			view.update( signal.loader.stats.progress );
		}

		private function onComplete( signal:LoaderSignal, data:* ):void
		{
			view.stop();
		}
		
		
	}
}