package com.vishvish.demoApplication.view
{
	import com.bit101.components.PushButton;
	import com.bit101.components.Text;
	import com.bit101.components.VBox;
	
	import org.birdbase.framework.view.AbstractTransitioningView;
	import org.birdbase.framework.view.components.AbstractPushButton;
	import org.birdbase.framework.view.components.AbstractUpdatableText;

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
		
		public var pushbuttonA:AbstractPushButton;
		
		public var pushbuttonB:AbstractPushButton;
		
		public var textTF:AbstractUpdatableText;
		
		public function FirstView()
		{
			super();
		}
		
		override public function main():void
		{
			cleanup();
			
			_container = new VBox( this );
			textTF = new AbstractUpdatableText( _container );
			pushbuttonA = new AbstractPushButton( _container );
			pushbuttonB = new AbstractPushButton( _container );
		}
	}
}