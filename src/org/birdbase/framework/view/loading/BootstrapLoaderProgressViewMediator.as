package org.birdbase.framework.view.loading
{
	import com.vishvish.demoApplication.view.mediators.abstract.ApplicationMediator;
	
	import org.assetloader.signals.LoaderSignal;
	import org.birdbase.framework.service.AssetService;

	public class BootstrapLoaderProgressViewMediator extends ApplicationMediator
	{
		[Inject]
		public var view:BootstrapLoaderProgressView;
		
		[Inject]
		public var assetService:AssetService;

		public function BootstrapLoaderProgressViewMediator()
		{
			//
		}
		
		override public function onRegister():void
		{
			super.onRegister();

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