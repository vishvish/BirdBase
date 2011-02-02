package com.vishvish.demoApplication.view
{
	import com.bit101.components.PushButton;
	import com.bit101.components.Text;
	import com.vishvish.demoApplication.view.components.NavigationButton;
	
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	import org.as3commons.logging.ILogger;
	import org.as3commons.logging.LoggerFactory;
	import org.birdbase.framework.action.Action;
	import org.birdbase.framework.action.INavigationActionable;
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
	public class MainContainerView extends Sprite implements IView
	{
		[Inject]
		public var logger:ILogger;
		
		/**
		 *	// TODO viewContainer 
		 */
		public var viewContainer:Sprite;
		
		public var navigationContainer:Sprite;
		
		/**
		 *	// TODO logo 
		 */
		public var logo:DynamicSprite;
		
		public var block:DynamicSprite;
		
		public var tagline:Text;
		
		public var toggleAssetButton:PushButton;
		
		public var loadSlideshowButton:PushButton;
		
		/**
		 *	// TODO MainUI 
		 */
		public function MainContainerView()
		{
			super();
			logger = LoggerFactory.getLogger( "com.tfto.birdbase" );
		}
		
		/**
		 *	// TODO main 
		 *	
		 *	@return void	
		 */
		public function main():void
		{
			logger.debug( "MainContainerView::main" );
			
			logo = new DynamicSprite( "logo" );
			logo.x = 550;
			logo.y = 5
			addChild( logo );
			
			tagline = new Text( this, 0, 30 );
			addChild( tagline );
			
			toggleAssetButton = new PushButton( this, 850, 30, "Toggle Assets" );
			addChild( toggleAssetButton );

			loadSlideshowButton = new PushButton( this, 850, 70, "Load Slideshow" );
//			addChild( loadSlideshowButton );

			block = new DynamicSprite( "block" );
			block.x = 400;
			block.y = 50;
			addChild( block );
			
			viewContainer = new Sprite();
			viewContainer.x = 0;
			viewContainer.y = 90;
			addChild( viewContainer );

			navigationContainer = new Sprite();
			navigationContainer.x = 0;
			navigationContainer.y = 0;
			addChild( navigationContainer );
		}
		
		public function buildNavigation( data:Array ):void
		{
			var spacing:Number = 0;
			
			for( var i:int = 0; i < data.length; i++ )
			{
				var action:Action = Action( data[ i ] );
				var button:NavigationButton = new NavigationButton( navigationContainer, 0, 0, null );
				button.x = spacing;
				spacing += button.width + 10;
				button.action = action;
			}
		}
		
		protected function navigationSelected( e:MouseEvent ):void
		{
			if( e.target is INavigationActionable )
			{
				logger.debug( INavigationActionable( e.target ).action.destination );
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
	}
}