package com.vishvish.demoApplication.view
{
	import com.bit101.components.PushButton;
	import com.bit101.components.Text;
	import com.bit101.components.VBox;
	
	import org.birdbase.framework.view.AbstractTransitioningView;

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
	public class FirstView extends AbstractTransitioningView
	{
		protected var _container:VBox;
		
		public var pushbuttonA:PushButton;
		
		public var pushbuttonB:PushButton;
		
		public var textTF:Text;
		
		public function FirstView()
		{
			super();
		}
		
		override public function main():void
		{
			cleanup();
			
			_container = new VBox( this );
			textTF = new Text( _container );
			pushbuttonA = new PushButton( _container );
			pushbuttonB = new PushButton( _container );
		}
	}
}