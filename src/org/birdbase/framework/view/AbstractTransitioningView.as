package org.birdbase.framework.view
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.text.*;
	
	import org.birdbase.framework.controller.signals.*;
	
	/**
	 *	Basic View. Inherit this view to use simple transitions and callbacks.
	 *	
	 *	@author 	Vish Vishvanath
	 *	@email 		vish.vishvanath@gmail.com
	 *	@since 		22 February 2011
	 */
	public class AbstractTransitioningView extends Sprite implements ITransitioningView
	{
		public var titleField:TextField;
		
		private var _title:String;
		
		public function AbstractTransitioningView()
		{
			super();
		}
		
		public function get title():String
		{
			return _title;
		}
		
		public function set title( value:String ):void
		{
			if( titleField == null )
			{
				var tf:TextFormat = new TextFormat();
				tf.font = "main";
				tf.size = 20;
				tf.color = 0xffffff;
				titleField = TextFieldFactory.create( tf );
				addChild( titleField );
			}
			
			if( value == null && titleField != null && contains( titleField ) )
			{
				removeChild( titleField );
			}else if( value != null && titleField != null  )
			{
				titleField.text = value; //.toUpperCase();
			}
			
			_title = value;
		}
		
		/**
		 * @inheritDoc
		 */
		public function main():void
		{
			//
		}
		
		private var _showCallback:Function;
		private var _hideCallback:Function;
		
		public function get showCallback():Function
		{
			return _showCallback;
		}
		
		public function get hideCallback():Function
		{
			return _hideCallback;
		}		
		
		/**
		 * @inheritDoc
		 */
		public function show( f:Function ):void
		{	
			_showCallback = f;
		}
		
		protected function shown( target:DisplayObject ):void
		{
			_showCallback.call();
		}

		/**
		 * @inheritDoc
		 */
		public function hide( f:Function ):void
		{
			_hideCallback = f;
		}
		
		protected function hidden( target:DisplayObject ):void
		{
			_hideCallback.call();
		}
		
		/**
		 * @inheritDoc
		 */
		public function cleanup():void
		{
			while( this.numChildren > 0 )
			{
				this.removeChildAt( 0 );
			}
		}
	}
}