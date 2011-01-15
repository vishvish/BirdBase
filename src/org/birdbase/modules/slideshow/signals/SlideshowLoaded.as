package org.birdbase.modules.slideshow.signals
{
	import org.as3commons.collections.ArrayList;
	import org.osflash.signals.Signal;
	
	public class SlideshowLoaded extends Signal
	{
		public var list:ArrayList;
		
		public function SlideshowLoaded( list:ArrayList )
		{
			super();
			this.list = list;
		}
	}
}