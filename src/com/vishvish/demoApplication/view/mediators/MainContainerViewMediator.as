package com.vishvish.demoApplication.view.mediators
{
	import com.greensock.TweenMax;
	import com.greensock.easing.Quart;
	import com.vishvish.demoApplication.helpers.ViewHelper;
	import com.vishvish.demoApplication.view.*;
	import com.vishvish.demoApplication.view.mediators.abstract.MapNavigation;
	
	import flash.display.DisplayObject;
	import flash.events.MouseEvent;
	import flash.utils.Dictionary;
	
	import org.birdbase.framework.action.*;
	import org.birdbase.framework.model.*;
	import org.birdbase.framework.signals.*;
	import org.birdbase.framework.utils.swfaddress.SWFAddress;
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
	public class MainContainerViewMediator extends MapNavigation
	{
		[Inject]
		public var view:MainContainerView;
		
		[Inject]
		public var updateDynamicLibrary:UpdateDynamicLibrary;
		
		public function MainContainerViewMediator()
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
			
			logger.debug( "MainUIMediator::onRegister" );
			
			viewStateChanged.add( onViewStateChange );
			view.main();
			
			var navigationActions:Array = [];
			var navigation:Array = helper.navigation;
			
			for( var i:int = 0; i < navigation.length; i++ )
			{
				var item:Object = Dictionary( navigation[ i ] ).item;
				var action:Action = new Action( item.destination, item.label )
				navigationActions.push( action );
			}
			
			view.buildNavigation( navigationActions );
			
			// TODO replace these calls with helper functions
			view.tagline.text = config.conf.tagline;
			view.toggleAssetButton.label = config.conf.swap_assets;
			
			// set up the toggling of the asset library
//			config.setPreference( "dynamicLibrary", "assets2.swf" );
			var toggleAssetSignal:NativeSignal = new NativeSignal( view.toggleAssetButton, MouseEvent.CLICK, MouseEvent );
			toggleAssetSignal.add( changeDynamicLibrary );
			
			var ns:NativeSignal = new NativeSignal( view.logo, MouseEvent.CLICK, MouseEvent );
			ns.add( gotoHome );

			var signal:NativeSignal = new NativeSignal( view, MouseEvent.CLICK, MouseEvent );
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
			if( e.target is INavigationActionable ) // for navigation actions
			{
				var action:Action = IActionable( e.target ).action;
				if( action )
				{
					var destination:String = action.destination
					logger.debug( "MainContainerViewMediator::viewPressed / INavigationActionable --> " + destination );
					swfAddress.setValue( destination );
				}
			}
			else if( e.target is IExternalLinkActionable ) // for external link actions
			{
				var action:Action = IActionable( e.target ).action;
				if( action )
				{
					var destination:String = action.destination
					logger.debug( "MainContainerViewMediator::viewPressed / IExternalLinkActionable --> " + destination );
				}
			}
			else // everything else
			{
				logger.debug( "MainContainerViewMediator::viewPressed " + e.target.toString() );
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
			// if it's empty, set it to the home page
			if( viewName == "" ) viewName; // = "home";
			
			logger.debug( "MainNavigationMediator::onViewStateChanged: " + viewName );
			
			var viewName:String = viewState.viewName;
			
			if( views.hasOwnProperty( viewName ) )
			{
				if( views[ viewName ] is Class )
				{
					views[ viewName ] = new views[ viewName ];
				}
				
				if( currentView != null )
				{
					var s:Signal = new Signal();
					s.addOnce( function():void { view.viewContainer.removeChildAt( 0 ); showView( views[ viewName ] ); } );
					currentView.hide( s );
				}
				else
				{
					showView( views[ viewName ] );
				}
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