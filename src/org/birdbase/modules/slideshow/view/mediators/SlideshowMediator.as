package org.birdbase.modules.slideshow.view.mediators
{
	import org.birdbase.application.view.mediators.AbstractBirdbaseMediator;
	import org.birdbase.modules.slideshow.ISlideshowModule;
	
	public class SlideshowMediator extends AbstractBirdbaseMediator
	{
		[Inject]
		public var slideshow:ISlideshowModule;
		
		public function SlideshowMediator()
		{
			super();
		}
	}
}