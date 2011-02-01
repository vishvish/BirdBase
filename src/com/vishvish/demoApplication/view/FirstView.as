package com.vishvish.demoApplication.view
{
	import com.bit101.components.PushButton;
	import com.bit101.components.Text;
	
	import org.birdbase.framework.view.AbstractTransitioningView;
	import org.birdbase.modules.navigation.NavigationModule;
	import org.birdbase.modules.slideshow.SlideshowModule;

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
		public var blueButton:PushButton;
		public var redButton:PushButton;
		
		protected var textTF:Text;
		
		public var slideshow:SlideshowModule;
		
		public function FirstView()
		{
			super();
		}
		
		override public function main():void
		{
			cleanup();
			textTF = new Text( this, 0, 140 );
			textTF.width = 450;
			addChild( textTF );
			
			blueButton = new PushButton( this, 0, 60, "Button 1" );
			addChild( blueButton );
			
			redButton = new PushButton( this, 110, 60, "Button 2" );
			addChild( redButton );
			
//			addChild( slideshow );
//			
//			addChild( navigation );
		}
	}
}