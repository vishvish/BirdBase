package com.tfto.birdbase.view
{
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	
	import org.osflash.signals.Signal;

	/**
	 *	// TODO FirstView 
	 *	
	 *	// TODO @example 
	 *	
	 *	// TODO @exampleText 
	 *	
	 *	@author 	Vish Vishvanath
	 *	@email 		vish.vishvanath@gmail.com
	 *	@since 		11 January 2011
	 */
	public class FirstView extends Sprite implements IView
	{
		/**
		 *	// TODO bluePillButton 
		 */
		public var bluePillButton:Sprite;
		/**
		 *	// TODO redPillButton 
		 */
		public var redPillButton:Sprite;
		
		/**
		 *	// TODO textTF 
		 */
		protected var textTF:TextField;
		
		/**
		 *	// TODO FirstView 
		 */
		public function FirstView()
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
//			trace("FirstView main");
			cleanup();
			textTF = new TextField();
//			textTF.defaultTextFormat = new TextFormat("Arial",13,0x0);
			textTF.width = 400;
			textTF.multiline = true;
			textTF.wordWrap = true;
			textTF.autoSize = TextFieldAutoSize.LEFT;
//			textTF.htmlText = "Welcome";
			addChild(textTF);
			
			bluePillButton = buildButton("Blue Pill",0x0000FF);
			addChild(bluePillButton);
			bluePillButton.y = 60;
			
			redPillButton = buildButton("Red Pill",0xFF0000 );
			addChild(redPillButton);
			redPillButton.y = 60;
			redPillButton.x = 110;
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
//			trace("FirstView show");
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
//			trace("FirstView hide");
			if(callback)
				callback.dispatch();
		}
		
		/**
		 *	// TODO buildButton 
		 *	
		 *	@param label 
		 *	@param color 
		 *	
		 *	@return Sprite	
		 */
		protected function buildButton(label:String, color:Number):Sprite
		{
			var s:Sprite = new Sprite();
			
			s.graphics.beginFill(color);
			s.graphics.drawRoundRect(0,0,100,35,3,3);
			s.graphics.endFill();
			s.buttonMode = true;
			s.mouseChildren = false;
			var tf:TextField = new TextField();
			tf.defaultTextFormat = new TextFormat("Arial",14,0x0,true);
			tf.text = label;
			tf.x = 5;
			tf.y = 5;
			s.addChild(tf);
			
			return s;
		}
		
		/**
		 *	// TODO cleanup 
		 *	
		 *	@return void	
		 */
		protected function cleanup():void
		{
			while( this.numChildren > 0 )
			{
				this.removeChildAt( 0 );
			}
		}
		
	}
}