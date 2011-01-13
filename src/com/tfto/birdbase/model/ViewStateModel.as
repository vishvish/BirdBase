package com.tfto.birdbase.model
{
	import com.tfto.birdbase.signals.ViewStateChanged;
	
	import org.robotlegs.mvcs.Actor;
	
	/**
	 *	// TODO ViewStateModel 
	 *	
	 *	// TODO @example 
	 *	
	 *	// TODO @exampleText 
	 *	
	 *	@author 	Vish Vishvanath
	 *	@email 		vish.vishvanath@gmail.com
	 *	@since 		11 January 2011
	 */
	public class ViewStateModel extends Actor
	{
		[Inject]
		public var viewStateChanged:ViewStateChanged;
		
		/**
		 *	// TODO _viewName 
		 */
		protected var _viewName:String;
		
		/**
		 * viewName // TODO 
		 */
		public function get viewName():String
		{
			return _viewName;
		}

		public function set viewName( val:String ):void
		{	
			var changed:Boolean = val != _viewName;
			_viewName = val;
			if( changed )
			{
				viewStateChanged.dispatch();
			}
		}
	}
}