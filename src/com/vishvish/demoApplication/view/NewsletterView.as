package com.vishvish.demoApplication.view
{
	import com.bit101.components.Text;
	import com.bit101.components.VBox;
	import com.vishvish.demoApplication.view.components.ExternalLinkButton;
	
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
		protected var _container:VBox;
		
		public var linkButton:ExternalLinkButton;
		
		public var textTF:Text;
		
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

			_container = new VBox( this );
			textTF = new Text( _container );
			linkButton = new ExternalLinkButton( _container );
		}
	}
}