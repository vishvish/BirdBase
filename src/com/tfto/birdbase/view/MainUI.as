package com.tfto.birdbase.view
{
	import com.tfto.utils.DynamicSprite;
	
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	import org.as3commons.logging.ILogger;
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
	public class MainUI extends Sprite implements IView
	{
		/**
		 *	// TODO viewContainer 
		 */
		public var viewContainer:Sprite;
		
		/**
		 *	// TODO logo 
		 */
		public var logo:Sprite;
		
		/**
		 *	// TODO tf 
		 */
		public var tf:TextField;

		public var block:DynamicSprite;
		
		/**
		 *	// TODO MainUI 
		 */
		public function MainUI()
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
			block = new DynamicSprite( "block" );
			block.x = 300;
			addChild( block );
			
			var hello:DynamicSprite = new DynamicSprite( "hello" );
			hello.x = 100;
			hello.y = 50;
			addChild( hello );
			
			buildLogo();
			
			viewContainer = new Sprite();
			viewContainer.x = 10;
			viewContainer.y = 70;
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
		
		/**
		 *	// TODO buildLogo 
		 *	
		 *	@return void	
		 */
		protected function buildLogo():void
		{
			logo = new Sprite();
			logo.x = 10;
			logo.y = 10;
			logo.graphics.beginFill(0xFFFF00);
			logo.graphics.drawEllipse(0,0,75,45);
			logo.graphics.endFill();
			logo.buttonMode = true;
			logo.mouseChildren = false;
			tf = new TextField();
			tf.defaultTextFormat = new TextFormat( "Arial", 18, 0x0, true );
			tf.text = "LOGO";
			logo.addChild( tf );
			
			tf.x = 10;
			tf.y = 10;
			
			addChild(logo);
		}
		
	}
}