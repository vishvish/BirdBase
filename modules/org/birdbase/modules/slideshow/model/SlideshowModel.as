package org.birdbase.modules.slideshow.model
{
	import org.birdbase.framework.model.BirdbaseApplicationModel;

	public class SlideshowModel extends BirdbaseApplicationModel
	{
		private var _slideshowFilename:String = "slideshow.xml";
		
		public function SlideshowModel()
		{
			super();
		}
		
		public function get slideshowFilename():String
		{
			return _slideshowFilename;
		}
		
		public function set slideshowFilename( value:String ):void
		{
			_slideshowFilename = value;
		}
	}
}