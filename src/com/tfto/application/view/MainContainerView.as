package com.tfto.application.view
{
	import com.tfto.button.BasicButton;
	import com.tfto.utils.DynamicSprite;
	
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	
	import org.as3commons.logging.ILogger;
	import org.as3commons.logging.LoggerFactory;
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
		
		public var tagline:TextField;
		
		public var toggleAssetButton:BasicButton;
		
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
			
			tagline = new TextField();
			tagline.defaultTextFormat = new TextFormat( "Myriad Pro", 14, 0x00000000 );
			tagline.x = 150;
			tagline.y = 5;
			tagline.autoSize = TextFieldAutoSize.LEFT;
			addChild( tagline );
			
			toggleAssetButton = new BasicButton();
			toggleAssetButton.x = 150;
			toggleAssetButton.y = 30;
			addChild( toggleAssetButton );
			
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