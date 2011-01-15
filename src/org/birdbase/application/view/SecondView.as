package org.birdbase.application.view
{
	import com.tfto.button.BasicButton;
	import com.tfto.text.BasicTextField;
	
	import flash.text.TextFieldAutoSize;

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
		public var yellowButton:BasicButton;

		public var purpleButton:BasicButton;
		
		public var option1:String;
		
		protected var textTF:BasicTextField;
				
		public function SecondView()
		{
			super();
		}
		
		override public function main():void
		{
			cleanup();
			textTF = new BasicTextField();
			textTF.y = 120;
			textTF.width = 450;
			textTF.multiline = true;
			textTF.autoSize = TextFieldAutoSize.LEFT;
			textTF.wordWrap = true;
			textTF.htmlText = "This is the second view of the application.<br/>You've already selected: "+option1+".<br/>Choose an option below.";
			addChild(textTF);
			
			yellowButton = new BasicButton( 0xFFFF00 );
			yellowButton.text = "Yellow Button";
			addChild( yellowButton );
			yellowButton.y = 80;
			
			purpleButton = new BasicButton( 0xFF00FF, 0xFFFFFF );
			purpleButton.text = "Purple Button";
			addChild( purpleButton );
			purpleButton.y = 80;
			purpleButton.x = 110;
		}
	}
}