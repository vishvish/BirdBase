package com.tfto.application.view
{
	import com.greensock.TweenLite;
	
	import flash.display.Sprite;
	
	import org.osflash.signals.Signal;
	
	public class AbstractTransitioningView extends Sprite implements IView
	{
		public function AbstractTransitioningView()
		{
			super();
			this.alpha = 0;
		}

		public function main():void
		{
			// TODO Auto-generated method stub
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
			var cb:Function = function():void
			{
				if( callback )
				{
					callback.dispatch();
				}
			}
			TweenLite.to( this, 1, { alpha:1, onComplete:cb } );
		}
		
		/**
		 *	// TODO hide 
		 *	
		 *	@param callback 
		 *	
		 *	@return void	
		 */
		public function hide( callback:Signal ):void
		{
			var cb:Function = function():void
			{
				if( callback )
				{
					callback.dispatch();
				}
			}
			TweenLite.to( this, 1, { alpha:0, onComplete:cb } );
		}

		/**
		 *	// TODO cleanup 
		 *	
		 *	@return void	
		 */
		protected function cleanup():void
		{
			while( this.numChildren > 0 )
			{
				this.removeChildAt( 0 );
			}
		}
	}
}