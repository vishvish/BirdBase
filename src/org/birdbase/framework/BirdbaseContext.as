package org.birdbase.framework
{
	import flash.display.Sprite;
	import flash.events.*;
	
	import org.assetloader.AssetLoader;
	import org.assetloader.core.IAssetLoader;
	import org.assetloader.signals.*;
	import org.birdbase.framework.controller.boot.BootManagement;
	import org.birdbase.framework.model.*;
	import org.birdbase.framework.service.*;
	import org.birdbase.support.loading.*;
	import org.birdbase.support.utils.FlashVarsManager;
	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.mvcs.SignalContext;
	
	/**
	 *	Root context of the BirdBase framework.
	 *	
	 *	@author 	Vish Vishvanath
	 *	@email 		vish.vishvanath@gmail.com
	 *	@since 		22 February 2011
	 */
	public class BirdbaseContext extends SignalContext implements ISteppedLoad
	{
		public var assetLoader:IAssetLoader = new AssetLoader();
		
		public static const LOAD_STARTED:String = "LoadStarted"; 
		public static const LOAD_PROGRESS:String = "LoadProgress"; 
		public static const LOAD_COMPLETED:String = "LoadCompleted"; 
		
		public function BirdbaseContext( contextView:Sprite )
		{
			super( contextView, false );
		}
		
		/**
		 * Connects the logger to this context view, creates an assetloader instance and initializes the bootstrap
		 * management. 
		 */
		override public function startup():void
		{
			var fm:FlashVarsManager = new FlashVarsManager( contextView );
			injector.mapValue( FlashVarsManager, fm );
			
			injector.mapValue( IAssetLoader, assetLoader, "loaded" );
			
			assetLoader.onError.add( handleError );
			assetLoader.onChildError.add( handleError );
			
			assetLoader.onStart.add( handleLoadStarted );
			assetLoader.onProgress.add( handleLoadProgress );
			assetLoader.onChildComplete.add( handleStepCompleted );
			assetLoader.onComplete.add( handleLoadCompleted );
			
			// once RobotLegs is ready, we can start booting up the framework.
			commandMap.mapEvent( ContextEvent.STARTUP_COMPLETE, BootManagement, ContextEvent, true );
			
			info();
			super.startup();
		}

		/**
		 * @inheritDoc
		 */
		public function handleError( signal:ErrorSignal, data:* = null ):void
		{
			var e:ErrorEvent = new ErrorEvent( ErrorEvent.ERROR, false, false, signal.message );
			dispatchEvent( e );
		}
		
		/**
		 * @inheritDoc
		 */
		public function handleLoadStarted( signal:LoaderSignal ):void
		{
			var e:Event = new Event( BirdbaseContext.LOAD_STARTED );
			dispatchEvent( e );
			
			var se:StepEvent = new StepEvent( StepEvent.NUMBER_STEPS, assetLoader.numLoaders );
			dispatchEvent( se );
		}
		
		/**
		 * @inheritDoc
		 */
		public function handleLoadProgress( signal:ProgressSignal ):void
		{
			var e:ProgressEvent 
				= new ProgressEvent( ProgressEvent.PROGRESS, false, false, signal.bytesLoaded, signal.bytesTotal );
			dispatchEvent( e );
		}
		
		/**
		 * @inheritDoc
		 */
		public function handleStepCompleted( signal:LoaderSignal, data:* = null ):void
		{
			var e:StepEvent = new StepEvent( StepEvent.STEP, assetLoader.numLoaders );
			dispatchEvent( e );
		}

		/**
		 * @inheritDoc
		 */
		public function handleLoadCompleted( signal:LoaderSignal, data:* = null ):void
		{
			var e:Event = new Event( BirdbaseContext.LOAD_COMPLETED );
			dispatchEvent( e );
		}
	}
}