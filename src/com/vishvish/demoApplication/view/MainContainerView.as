package com.vishvish.demoApplication.view
{
	import com.bit101.components.PushButton;
	import com.bit101.components.Text;
	
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	import org.as3commons.logging.ILogger;
	import org.as3commons.logging.LoggerFactory;
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
			logger.debug( "MainUI::main" );
			
			logo = new DynamicSprite( "logo" );
			logo.x = logo.y = 5;
			addChild( logo );
			
			tagline = new Text( this, 150, 5 );
			addChild( tagline );
			
			toggleAssetButton = new PushButton( this, 850, 30, "Toggle Assets" );
			addChild( toggleAssetButton );

			loadSlideshowButton = new PushButton( this, 850, 70, "Load Slideshow" );
			addChild( loadSlideshowButton );

			block = new DynamicSprite( "block" );
			block.x = 400;
			block.y = 50;
			addChild( block );
			
			viewContainer = new Sprite();
			viewContainer.x = 5;
			viewContainer.y = 71;
			addChild( viewContainer );
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