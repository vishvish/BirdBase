package org.birdbase.application.view
{
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;

	/**
	 *	// TODO SecondView 
	 *	
	 *	// TODO @example 
	 *	
	 *	// TODO @exampleText 
	 *	
	 *	@author 	Vish Vishvanath
	 *	@email 		vish.vishvanath@gmail.com
	 *	@since 		11 January 2011
	 */
	public class SecondView extends AbstractTransitioningView
	{
		/**
		 *	// TODO yellowPillButton 
		 */
		public var yellowPillButton:Sprite;
		/**
		 *	// TODO purplePillButton 
		 */
		public var purplePillButton:Sprite;
		
		/**
		 *	// TODO option1 
		 */
		public var option1:String;
		
		/**
		 *	// TODO textTF 
		 */
		protected var textTF:TextField;
				
		/**
		 *	// TODO SecondView 
		 */
		public function SecondView()
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
//			trace("SecondView main");
			cleanup();
			textTF = new TextField();
			textTF.defaultTextFormat = new TextFormat("Arial",13,0x0);
			textTF.width = 450;
			textTF.multiline = true;
			textTF.autoSize = TextFieldAutoSize.LEFT;
			textTF.wordWrap = true;
			textTF.htmlText = "This is the second view of the application.<br/>You've already selected: "+option1+".<br/>Choose an option below.";
			addChild(textTF);
			
			yellowPillButton = buildButton("Yellow Pill",0xFFFF00);
			addChild(yellowPillButton);
			yellowPillButton.y = 80;
			
			purplePillButton = buildButton("Purple Pill",0xFF00FF );
			addChild(purplePillButton);
			purplePillButton.y = 80;
			purplePillButton.x = 110;
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
	}
}