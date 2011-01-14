package org.birdbase.modules.slideshow.controller
{
	import org.as3commons.logging.ILogger;
	import org.birdbase.modules.slideshow.signals.SlideshowLoaded;
	import org.robotlegs.mvcs.SignalCommand;
	
	public class SlideshowLoadedCommand extends SignalCommand
	{
		[Inject]
		public var logger:ILogger;
		
		[Inject]
		public var slideshowLoaded:SlideshowLoaded;
		
		public function SlideshowLoadedCommand()
		{
			super();
		}
		
		override public function execute():void
		{
			logger.debug( "SlideshowLoadedCommand::execute" );
			slideshowLoaded.dispatch();
		}
	}
}