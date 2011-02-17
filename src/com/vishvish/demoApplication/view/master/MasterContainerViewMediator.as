package com.vishvish.demoApplication.view.master
{
	import com.greensock.TweenMax;
	import com.greensock.easing.Quart;
	import com.vishvish.demoApplication.view.*;
	import com.vishvish.demoApplication.view.mediators.abstract.ApplicationMediator;
	
	import flash.display.DisplayObject;
	import flash.events.MouseEvent;
	import flash.utils.Dictionary;
	
	import org.birdbase.framework.action.*;
	import org.birdbase.framework.model.*;
	import org.birdbase.framework.service.TextService;
	import org.birdbase.framework.signals.*;
	import org.birdbase.framework.view.*;
	import org.osflash.signals.Signal;
	import org.osflash.signals.natives.NativeSignal;

	/**
	 *	// TODO MainUIMediator 
	 *	
	 *	// TODO @example 
	 *	
	 *	// TODO @exampleText 
	 *	
	 *	@author 	Vish Vishvanath
	 *	@email 		vish.vishvanath@gmail.com
	 *	@since 		11 January 2011
	 */
	public class MasterContainerViewMediator extends ApplicationMediator
	{
		[Inject]
		public var textService:TextService;

		[Inject]
		public var viewStateChanged:ViewStateChanged;
		
		protected var currentView:IView;

		[Inject]
		public var view:MasterContainerView;
		
		[Inject]
		public var updateDynamicLibrary:UpdateDynamicLibrary;
		
		public function MasterContainerViewMediator()
		{
			super();
		}

		/**
		 * onRegister calls the superclass to map the view names to Classes, bootstraps the view and builds a primary
		 * navigation.
		 *	
		 *	@return void	
		 */
		override public function onRegister():void
		{
			super.onRegister();
			
			viewStateChanged.add( onViewStateChange );
			view.main();
			
			var navigation:NavigationView = new NavigationView();
			navigation.helper = helper;
			view.addChild( navigation );
			navigation.buildNavigation();
			
			textService.register( view.toggleAssetButton, "swap_assets" );
			
			// set up the toggling of the asset library
			var toggleAssetSignal:NativeSignal = new NativeSignal( view.toggleAssetButton, MouseEvent.CLICK, MouseEvent );
			toggleAssetSignal.add( changeDynamicLibrary );
			
			var ns:NativeSignal = new NativeSignal( view.logo, MouseEvent.CLICK, MouseEvent );
			ns.add( gotoHome );

			var signal:NativeSignal = new NativeSignal( navigation, MouseEvent.CLICK, MouseEvent );
			signal.add( viewPressed );
		}
		
		/**
		 * This handler will pick up signals from its view and subviews. This is deliberate: the top-level view may
		 * want to know this, and perform its own view actions.
		 * 
		 * @param e
		 */
		private function viewPressed( e:MouseEvent ):void
		{
			var action:Action;
			var destination:String;
			
			if( e.target is INavigationActionable ) // for navigation actions
			{
				action = Action( IActionable( e.target ).action );
				if( action )
				{
					destination = action.destination
					logger.debug( "MasterContainerViewMediator::viewPressed / Target: INavigationActionable --> " + destination );
					swfAddress.setValue( destination );
				}
			}
			else if( e.target is IExternalLinkActionable ) // for external link actions
			{
				action = Action( IActionable( e.target ).action );
				if( action )
				{
					destination = action.destination
					logger.debug( "MasterContainerViewMediator::viewPressed / IExternalLinkActionable --> " + destination );
				}
			}
			else
			{
				// anything that makes it's way in here should be handled already by something else.
				// this is a catch-all
				// logger.debug( "MasterContainerViewMediator::viewPressed / " + e.target.toString() );
			}
		}
		
		/**
		 *	// TODO gotoHome 
		 *	
		 *	@param myEvent 
		 *	
		 *	@return void	
		 */
		protected function gotoHome( evt:MouseEvent ):void
		{	
			swfAddress.setValue( "home" );
		}

		/**
		 * onViewStateChange handles view state changes by string and kicks off the transition between the current view
		 * and the new view.
		 *	
		 *	@return void	
		 */
		protected function onViewStateChange():void
		{
			try {
				var newView:IView = helper.getView( viewState.viewName );
				
				if( currentView != null )
				{
					var s:Signal = new Signal();
					s.addOnce( function():void 
					{
						// FIXME might be a little hardcore
						while( view.viewContainer.numChildren > 0 )
						{
							view.viewContainer.removeChildAt( 0 );
						}
						//view.viewContainer.removeChild( DisplayObject( currentView ) ); 
						showView( newView ); 
					});
					currentView.hide( s );
				}
				else
				{
					showView( newView );
				}
			}
			catch( e:Error )
			{
				logger.error( "MasterContainerViewMediator::onViewStateChanged " + e.message );
			}
		}

		protected function showView( newView:IView ):void
		{
			currentView = newView;
			view.viewContainer.addChild( DisplayObject( currentView ) );
			currentView.show( null );
		}
		
		/**
		 * A very basic fade in tween to transition in the entire site view. 
		 */		
		private function beginShow():void
		{
			TweenMax.to( currentView, 1, { alpha: 1, ease:Quart.easeOut } );
		}
		
		protected function changeDynamicLibrary( e:MouseEvent ):void
		{
			config.setPreference( "dynamicLibrary", "assets2.swf" );
			updateDynamicLibrary.dispatch();
		}
	}
}