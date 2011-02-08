package com.vishvish.demoApplication.view
{
	import com.bit101.components.ProgressBar;
	import com.bit101.components.Text;
	
	import flash.display.Sprite;
	
	/**
	 *	// TODO LoadingUI 
	 *	
	 *	// TODO @example 
	 *	
	 *	// TODO @exampleText 
	 *	
	 *	@author 	Vish Vishvanath
	 *	@email 		vish.vishvanath@gmail.com
	 *	@since 		11 January 2011
	 */
	public class LoadingView extends Sprite
	{
		protected var _loadingProgress:ProgressBar;
		
		protected var _progress:Number;

		public function LoadingView()
		{
			super();
		}
		
		public function start():void
		{
			_progress = 0;
			_loadingProgress = new ProgressBar();
			_loadingProgress.maximum = 100;
			addChild( _loadingProgress );
		}
		
		public function update( progress:Number ):void
		{
			trace( "LoadingView::update", progress );
			_progress = progress;
			_loadingProgress.value = _progress;
		}
		
		public function stop():void
		{
			if( _loadingProgress )
			{
				removeChild( _loadingProgress );
				_loadingProgress = null;
			}
		}
		
	}
}