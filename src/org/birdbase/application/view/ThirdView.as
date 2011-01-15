package org.birdbase.application.view
{
	import com.tfto.text.BasicTextField;
	
	import flash.display.Sprite;
	import flash.text.TextField;

	/**
	 *	// TODO ThirdView 
	 *	
	 *	// TODO @example 
	 *	
	 *	// TODO @exampleText 
	 *	
	 *	@author 	Vish Vishvanath
	 *	@email 		vish.vishvanath@gmail.com
	 *	@since 		11 January 2011
	 */
	public class ThirdView extends AbstractTransitioningView
	{
		/**
		 *	// TODO option1 
		 */
		public var option1:String;
		/**
		 *	// TODO option2 
		 */
		public var option2:String;
		
		/**
		 *	// TODO textTF 
		 */
		protected var textTF:TextField;
		
		public var slideshowHolder:Sprite;
		
		/**
		 *	// TODO ThirdView 
		 */
		public function ThirdView()
		{
			super();
		}
		
		/**
		 *	// TODO main 
		 *	
		 *	@return void	
		 */
		override public function main():void
		{
//			trace("ThirdView main");
			cleanup();
			textTF = new BasicTextField();
			textTF.width = 500;
			textTF.text = "This is the third view of the application. You've already selected: "+option1+" and "+option2+".";
			addChild(textTF);
			
			slideshowHolder = new Sprite();
			slideshowHolder.x = 10;
			slideshowHolder.y = 140;
			addChild( slideshowHolder );
		}
	}
}