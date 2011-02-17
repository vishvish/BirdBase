package com.vishvish.demoApplication.view.master
{
	import com.bit101.components.HBox;
	import com.bit101.components.Panel;
	import com.bit101.components.PushButton;
	import com.bit101.components.Text;
	import com.bit101.components.VBox;
	import com.vishvish.demoApplication.view.components.NavigationButton;
	
	import flash.display.Sprite;
	
	import org.birdbase.framework.action.Action;
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
		protected var _viewTitle:Text;

		public var viewContainer:Sprite;
		
		public var logo:DynamicSprite;
		
		public var block:DynamicSprite;
		
		public var navigation:NavigationView;
		
		
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
			viewContainer.y = 60;
			addChild( viewContainer );
			
//			navigationContainer = new HBox( this )
			
			var vbox:VBox = new VBox( viewContainer, 0, 25 );
			vbox.spacing = 15;

//			tagline = new Text( vbox );
//			toggleAssetButton = new PushButton( vbox );
//			loadSlideshowButton = new PushButton( vbox );

			block = new DynamicSprite( "block" );
//			navigationContainer.addChild( block );
			
			logo = new DynamicSprite( "logo" );
//			logo.x = 550;
//			logo.y = 5
//			navigationContainer.addChild( logo );
			
//			vbox.addChild( tagline );
			
			//, null, null, "Toggle Assets" );
//			vbox.addChild( toggleAssetButton );

			//addChild( loadSlideshowButton );

		}
		
		public function buildNavigation( data:Array ):void
		{
			var spacing:Number = 0;
			
			for( var i:int = 0; i < data.length; i++ )
			{
				var action:Action = Action( data[ i ] );
//				var button:NavigationButton = new NavigationButton( navigationContainer );
//				button.action = action;
			}
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

		public function get viewTitle():Text
		{
			return _viewTitle;
		}
		
		public function set viewTitle(value:Text):void
		{
			_viewTitle = value;
		}
	}
}