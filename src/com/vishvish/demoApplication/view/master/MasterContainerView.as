package com.vishvish.demoApplication.view.master
{
	import com.bit101.components.VBox;
	import com.vishvish.demoApplication.view.components.ActionableButton;
	
	import flash.display.Sprite;
	
	import org.birdbase.framework.utils.DynamicSprite;
	import org.birdbase.framework.view.IView;
	import org.osflash.signals.Signal;

	/**
	 *	// TODO MainUI 
	 *	
	 *	// TODO @example 
	 *	
	 *	// TODO @exampleText 
	 *	
	 *	@author 	Vish Vishvanath
	 *	@email 		vish.vishvanath@gmail.com
	 *	@since 		11 January 2011
	 */
	public class MasterContainerView extends Sprite implements IView
	{
		public var viewContainer:Sprite;
		
		public var logo:DynamicSprite;
		
		public var block:DynamicSprite;
		
		public var navigation:NavigationView;
		
		public var toggleAssetButton:ActionableButton;
		
		/**
		 *	// TODO MainUI 
		 */
		public function MasterContainerView()
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
			viewContainer = new Sprite();
			viewContainer.x = 0;
			viewContainer.y = 150;
			addChild( viewContainer );
			
			var vbox:VBox = new VBox( viewContainer, 0, 25 );
			vbox.spacing = 15;

			logo = new DynamicSprite( "logo" );
			logo.x = 10;
			logo.y = 600 - logo.height - 10;
			addChild( logo );

			block = new DynamicSprite( "block" );
			block.x = logo.width + 10;
			block.y = 600 - block.height - 10;
			addChild( logo );
			addChild( block );
			
			toggleAssetButton = new ActionableButton( vbox );
			toggleAssetButton.x = 600;
			viewContainer.addChild( toggleAssetButton );
		}
		
		/**
		 *	// TODO show 
		 *	
		 *	@param callback 
		 *	
		 *	@return void	
		 */
		public function show( callback:Signal ):void
		{	
			if( callback )
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
			if( callback )
				callback.dispatch();
		}
	}
}