package org.birdbase.modules.slideshow.view
{
	import flash.display.Sprite;
	
	import org.birdbase.application.view.AbstractTransitioningView;
	import org.birdbase.application.view.IView;
	import org.osflash.signals.Signal;
	
	public class SlideshowView extends AbstractTransitioningView implements IView
	{
		public function SlideshowView()
		{
			super();
		}
		
		override public function main():void
		{
			trace( "SlideshowView::main" );
			this.graphics.beginFill( 0xFFFF00, 0.5 );
			this.graphics.drawCircle( 200, 100, 50 );
			this.graphics.endFill();
		}
	}
}