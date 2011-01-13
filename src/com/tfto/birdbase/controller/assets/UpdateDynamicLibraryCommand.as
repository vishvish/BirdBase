package com.tfto.birdbase.controller.assets
{
	import com.tfto.birdbase.model.PreferencesModel;
	
	import org.as3commons.logging.ILogger;
	import org.assetloader.core.IAssetLoader;
	import org.assetloader.signals.ErrorSignal;
	import org.robotlegs.mvcs.SignalCommand;
	
	public class UpdateDynamicLibraryCommand extends SignalCommand
	{
		[Inject]
		public var logger:ILogger;
		
		[Inject]
		public var assetLoader:IAssetLoader;
		
		[Inject]
		public var pm:PreferencesModel;

		public function UpdateDynamicLibraryCommand()
		{
			super();
		}
		
		override public function execute():void
		{
			logger.debug( "UpdateDynamicLibraryCommand::execute" );
			
			var newLibrary:String = pm.getProperty( "dynamic-library" ) ? pm.getProperty( "dynamic-library" ) : null;
			
			if( !newLibrary )
			{
				logger.error( "The name of the Dynamic Library is not defined in the PreferencesModel. " +
					"Add its name to the Model before triggering this Signal. " +
					"e.g. pm.setProperty( 'dynamic-library', 'assets2.swf' )" );
			}
			else
			{
				var newLibraryPath:String = pm.assetBasePath + newLibrary;
				if( assetLoader.hasAsset( "dynamic-library" ) )
				{
					assetLoader.remove( "dynamic-library" );
				}
				assetLoader.addLazy( "dynamic-library", newLibraryPath );
				assetLoader.onError.add( handleError );
				signalCommandMap.mapSignal( assetLoader.onComplete, RegisterDynamicLibraryCommand, true );
				assetLoader.start();
			}
		}

		private function handleError( signal:ErrorSignal ):void
		{
			logger.error( signal.message );
		}
	}
}