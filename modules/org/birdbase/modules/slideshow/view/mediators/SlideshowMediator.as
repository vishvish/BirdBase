package org.birdbase.modules.slideshow.view.mediators
{
	import org.birdbase.framework.view.AbstractBirdbaseMediator;
	import org.birdbase.modules.slideshow.view.SlideshowView;
	
	public class SlideshowMediator extends AbstractBirdbaseMediator
	{
		[Inject]
		public var view:SlideshowView;
		
		public function SlideshowMediator()
		{
			super();
		}

		/**
		 *	// TODO onRegister 
		 *	
		 *	@return void	
		 */
		override public function onRegister():void
		{
			view.main();
		}
	}
}