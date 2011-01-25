package org.birdbase.modules.slideshow
{
	import flash.display.Sprite;
	
	/**
	 *	// TODO Main 
	 *	
	 *	// TODO @example 
	 *	
	 *	// TODO @exampleText 
	 *	
	 *	@author 	Vish Vishvanath
	 *	@email 		vish.vishvanath@gmail.com
	 *	@since 		17 January 2011
	 */
	[SWF(width="400", height="300", frameRate="31", backgroundColor="#F6F6F6")]
	public class SlideshowMain extends Sprite
	{
		/**
		 *	// TODO context 
		 */
		protected var context:SlideshowContext;
		
		/**
		 *	// TODO Main 
		 */
		public function SlideshowMain()
		{
			context = new SlideshowContext( this );
		}
	}
}
