package com.vishvish.demoApplication.view.mediators.abstract
{
	import com.vishvish.demoApplication.view.*;
	
	import org.as3commons.logging.ILogger;
	import org.birdbase.framework.signals.ViewStateChanged;
	import org.birdbase.framework.view.IView;

	public class MapNavigation extends ApplicationMediator
	{
		[Inject]
		public var logger:ILogger;
		
		[Inject]
		public var viewStateChanged:ViewStateChanged;
		
		protected var views:Object;

		protected var currentView:IView;

		/**
		 * MapNavigation is an abstract mediator that allows us to cleanly map view names (that we know from the
		 * wireframes and from the yaml configuration) to concrete View Classes. 
		 * 
		 */
		public function MapNavigation()
		{
			super();
		}
		
		/**
		 * Map your view names to concrete classes in here. 
		 */
		override public function onRegister():void
		{
			views = {};
			views[ "home" ] = FirstView;
			views[ "blog" ] = SecondView;
			views[ "about" ] = ThirdView;
		}
	}
}