package org.birdbase.application
{
	import flash.display.DisplayObjectContainer;
	
	import org.as3commons.collections.ArrayList;
	import org.birdbase.application.controller.state.ChangeApplicationStateCommand;
	import org.birdbase.application.view.*;
	import org.birdbase.application.view.mediators.*;
	import org.birdbase.framework.BirdbaseContext;
	import org.birdbase.framework.model.*;
	import org.birdbase.framework.service.*;
	import org.birdbase.framework.signals.*;
	import org.birdbase.modules.slideshow.ISlideshowModule;
	import org.birdbase.modules.slideshow.SlideshowModule;
	
	/**
	 *	// TODO MainContext 
	 *	
	 *	// TODO @example 
	 *	
	 *	// TODO @exampleText 
	 *	
	 *	@author 	Vish Vishvanath
	 *	@email 		vish.vishvanath@gmail.com
	 *	@since 		11 January 2011
	 */
	public class MainContext extends BirdbaseContext
	{
		/**
		 *	// TODO MainContext 
		 *	
		 *	@param contextView 
		 *	
		 *	@return 	
		 */
		public function MainContext( contextView:DisplayObjectContainer )
		{
			super( contextView );
		}
		
		/**
		 *	// TODO startup 
		 *	
		 *	@return void	
		 */
		override public function startup():void
        {
			injector.mapClass( ISlideshowModule, SlideshowModule );
			
			// will need collections to use modules
			injector.mapClass( ArrayList, ArrayList );
			
			// maps a signal for SWFAddress
			signalCommandMap.mapSignalClass( ModifyApplicationState, ChangeApplicationStateCommand );

			mediatorMap.mapView( MainContainerView, MainContainerViewMediator );
			mediatorMap.mapView( FirstView, FirstViewMediator );
			mediatorMap.mapView( SecondView, SecondViewMediator );
			mediatorMap.mapView( ThirdView, ThirdViewMediator );

			super.startup();
        }
	}
}