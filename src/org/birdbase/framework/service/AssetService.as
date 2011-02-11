package org.birdbase.framework.service
{
	import org.as3commons.logging.ILogger;
	import org.assetloader.core.IAssetLoader;
	import org.assetloader.signals.ErrorSignal;
	import org.assetloader.signals.LoaderSignal;
	import org.birdbase.framework.controller.configuration.ConfigureStateMachineCommand;
	import org.birdbase.framework.model.AssetModel;
	import org.birdbase.framework.model.BootstrapModel;
	import org.birdbase.framework.utils.FlashVarsManager;
	import org.robotlegs.mvcs.Actor;
	import org.robotlegs.utilities.statemachine.StateEvent;

	public class AssetService extends Actor
	{
		[Inject]
		public var fm:FlashVarsManager;
		
		[Inject]
		public var bm:BootstrapModel;
		
		[Inject]
		public var model:AssetModel;
		
		[Inject]
		public var assetLoader:IAssetLoader;
		
		[Inject(name="birdbase")]
		public var logger:ILogger;

		public function init():void
		{
			assetLoader.addConfig( bm.assetBasePath + bm.getPreference( "assetsFile" ) );
			assetLoader.onComplete.add( onComplete );
		}

		private function onError( signal:ErrorSignal ):void
		{
			logger.error( signal.message );
		}
		
		private function onComplete( signal:LoaderSignal, data:* ):void
		{
			eventDispatcher.dispatchEvent( new StateEvent( StateEvent.ACTION, ConfigureStateMachineCommand.LOAD_ASSETS_COMPLETE ) );
		}
	}
}