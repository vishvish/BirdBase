package com.tfto.birdbase.view
{
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	import org.osflash.signals.Signal;

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
	public class ThirdView extends Sprite implements IView
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
		public function main():void
		{
//			trace("ThirdView main");
			cleanup();
			textTF = new TextField();
			textTF.defaultTextFormat = new TextFormat("Arial",13,0x0);
			textTF.width = 500;
			textTF.text = "This is the third view of the application. You've already selected: "+option1+" and "+option2+".";
			addChild(textTF);
			
		}
		
		/**
		 *	// TODO show 
		 *	
		 *	@param callback 
		 *	
		 *	@return void	
		 */
		public function show(callback:Signal):void
		{	
//			trace("ThirdView show");
			if(callback)
				callback.dispatch();
		}
		
		/**
		 *	// TODO hide 
		 *	
		 *	@param callback 
		 *	
		 *	@return void	
		 */
		public function hide(callback:Signal):void
		{	
//			trace("ThirdView hide");
			if(callback)
				callback.dispatch();
		}
		
		/**
		 *	// TODO cleanup 
		 *	
		 *	@return void	
		 */
		protected function cleanup():void
		{
			while(this.numChildren > 0)
				this.removeChildAt(0);
		}
		
	}
}