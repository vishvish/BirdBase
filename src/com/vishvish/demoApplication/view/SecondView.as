package com.vishvish.demoApplication.view
{
	import com.bit101.components.PushButton;
	import com.bit101.components.Text;
	
	import org.birdbase.framework.view.AbstractTransitioningView;

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
		public var yellowButton:PushButton;

		public var purpleButton:PushButton;
		
		public var option1:String;
		
		protected var textTF:Text;
				
		public function SecondView()
		{
			super();
		}
		
		override public function main():void
		{
			cleanup();
			textTF = new Text( this, 0, 120 );
			textTF.html = true;
			textTF.width = 450;
			textTF.text = "This is the second view of the application.<br/>You've already selected: "+option1+".<br/>Choose an option below.";
			addChild(textTF);
			
			yellowButton = new PushButton( this, 0, 80, "Button 3" );
			addChild( yellowButton );
			
			purpleButton = new PushButton( this, 110, 80, "Button 4" );
			addChild( purpleButton );
		}
	}
}