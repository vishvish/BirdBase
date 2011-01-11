package com.tfto.birdbase.controller.assets
{
	import com.tfto.utils.DynamicSprite;
	
	import flash.display.MovieClip;
	
	import org.as3commons.logging.ILogger;
	import org.assetloader.core.IAssetLoader;
	import org.robotlegs.mvcs.SignalCommand;
	
	public class RegisterDynamicLibraryCommand extends SignalCommand
	{
		[Inject]
		public var logger:ILogger;
		
		[Inject]
		public var assetLoader:IAssetLoader;
		
		public function RegisterDynamicLibraryCommand()
		{
			super();
		}
		
		override public function execute():void
		{
			logger.debug( "RegisterDynamicLibraryCommand::execute" );
			
			if( assetLoader.getAsset( "dynamic-library" ) )
			{
				DynamicSprite.update( "dynamic-library", assetLoader.getAsset( "dynamic-library" ) as MovieClip );
				logger.debug( "DynamicSprite successfully updated with dynamic library" );
			}
			else
			{
				logger.error( "Dynamic Library not found" );
				throw new Error( "Dynamic Library not found" );
			}
		}
	}
}