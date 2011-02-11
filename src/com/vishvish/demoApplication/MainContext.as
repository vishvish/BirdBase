package com.vishvish.demoApplication
{
	import com.vishvish.demoApplication.view.*;
	import com.vishvish.demoApplication.view.master.MasterContainerView;
	import com.vishvish.demoApplication.view.master.MasterContainerViewMediator;
	import com.vishvish.demoApplication.view.mediators.*;
	
	import flash.display.DisplayObjectContainer;
	
	import org.as3commons.logging.ILogger;
	import org.as3commons.logging.LoggerFactory;
	import org.birdbase.framework.BirdbaseContext;
	import org.birdbase.framework.controller.state.ChangeApplicationStateCommand;
	import org.birdbase.framework.model.*;
	import org.birdbase.framework.service.*;
	import org.birdbase.framework.signals.*;
	import org.birdbase.framework.view.helpers.ViewHelper;
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
			logger = LoggerFactory.getLogger( "com.vishvish.demoApplication" );
			injector.mapValue( ILogger, logger, "application" );

			signalCommandMap.mapSignalClass( ModifyApplicationState, ChangeApplicationStateCommand );

			// models
			injector.mapSingleton( ApplicationModel );
			injector.mapSingleton( SlideshowModule );
			
			// helpers
			injector.mapSingleton( ViewHelper );

			// modules
			viewMap.mapType( SlideshowModule );
			
			mediatorMap.mapView( MasterContainerView, MasterContainerViewMediator );
			mediatorMap.mapView( FirstView, FirstViewMediator );
			mediatorMap.mapView( SecondView, SecondViewMediator );
			mediatorMap.mapView( ThirdView, ThirdViewMediator );
			mediatorMap.mapView( ContactView, ContactViewMediator );
			
			super.startup();
        }
	}
}