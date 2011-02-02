package org.birdbase.framework.controller.assets
{
	import org.as3commons.logging.ILogger;
	import org.assetloader.core.IAssetLoader;
	import org.assetloader.signals.ErrorSignal;
	import org.birdbase.framework.model.PreferencesModel;
	import org.birdbase.framework.model.PreferencesModel;
	import org.robotlegs.mvcs.SignalCommand;
	
	public class UpdateDynamicLibraryCommand extends SignalCommand
	{
		[Inject]
		public var logger:ILogger;
		
		[Inject(name="bootstrapLoader")]
		public var assetLoader:IAssetLoader;
		
		[Inject]
		public var pm:org.birdbase.framework.model.PreferencesModel;

		public function UpdateDynamicLibraryCommand()
		{
			super();
		}
		
		override public function execute():void
		{
			logger.debug( "UpdateDynamicLibraryCommand::execute" );
			
			var newLibrary:String = pm.getPreference( "dynamicLibrary" ) ? pm.getPreference( "dynamicLibrary" ) : null;
			
			if( !newLibrary )
			{
				logger.error( "The name of the Dynamic Library is not defined in the PreferencesModel. " +
					"Add its name to the Model before triggering this Signal. " +
					"e.g. pm.setPreference( 'dynamicLibrary', 'assets2.swf' )" );
			}
			else
			{
				var newLibraryPath:String = pm.assetBasePath + newLibrary;
				if( assetLoader.hasAsset( "dynamicLibrary" ) )
				{
					assetLoader.remove( "dynamicLibrary" );
				}
				assetLoader.addLazy( "dynamicLibrary", newLibraryPath );
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