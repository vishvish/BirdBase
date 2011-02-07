package com.vishvish.demoApplication.view
{
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
		protected var _total:Number = 1;
		
		protected var _progress:Number;
		
		protected var _percentLoaded:int;
		
		/**
		 *	// TODO LoadingUI 
		 */
		public function LoadingView()
		{
			super();
		}
		
		public function updateProgress( value:Number )
		{
			_progress = value;
			_percentLoaded = ( _progress / _total ) * 100;
			updateView();
		}
		
		public function updateView():void
		{
			
		}
		
		public function reset():void
		{
			
		}
		
		public function start( total:Number ):void
		{
			if( total > 0 )
			{
				_total = total;
			}
		}
		
		public function stop():void
		{
			
		}
		
	}
}