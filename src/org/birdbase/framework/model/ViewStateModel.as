package org.birdbase.framework.model
{
	import org.birdbase.framework.signals.ViewStateChanged;
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
		public static const HOME_VIEW_NAME:String = "home";

		[Inject]
		public var viewStateChanged:ViewStateChanged;
		
		/**
		 *	Defaults to "home" at start.
		 */
		protected var _viewName:String;
		
		/**
		 * viewName // TODO 
		 */
		public function get viewName():String
		{
			return _viewName;
		}

		/**
		 * Sets the current viewname. If empty, take that to
		 * represent "home".
		 * 
		 * @param val
		 */
		public function set viewName( val:String ):void
		{	
			var changed:Boolean = val != _viewName;

			if( val == "" )
			{
				_viewName = ViewStateModel.HOME_VIEW_NAME;
			}
			else
			{
				_viewName = val;
			}

			if( changed )
			{
				viewStateChanged.dispatch();
			}
		}
	}
}