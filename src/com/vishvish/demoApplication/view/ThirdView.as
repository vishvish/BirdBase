package com.vishvish.demoApplication.view
{
	import com.bit101.components.Text;
	
	import org.birdbase.framework.view.AbstractTransitioningView;

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
		protected var textTF:Text;
		
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
			cleanup();
			textTF = new Text( this, 0, 120 );
			textTF.text = "This is the third view of the application. You've already selected: "+option1+" and "+option2+".";
			addChild( textTF );
		}
	}
}