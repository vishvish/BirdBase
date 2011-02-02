package com.vishvish.demoApplication.view.mediators
{
	import com.greensock.TweenMax;
	import com.greensock.easing.Quart;
	import com.vishvish.demoApplication.IExternalLinkActionable;
	import com.vishvish.demoApplication.view.*;
	
	import flash.display.DisplayObject;
	import flash.events.MouseEvent;
	import flash.utils.Dictionary;
	
	import org.as3commons.logging.ILogger;
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
	public class MainContainerViewMediator extends ApplicationMediator
	{
		[Inject]
		public var view:MainContainerView;
		
		[Inject]
		public var viewStateChanged:ViewStateChanged;
		
		[Inject]
		public var updateDynamicLibrary:UpdateDynamicLibrary;
		
		[Inject]
		public var swfAddress:SWFAddress;
		
		[Inject]
		public var pm:PreferencesModel;
		
		[Inject]
		public var l10n:L10nModel;
		
		[Inject]
		public var logger:ILogger;

		/**
		 *	// TODO views 
		 */
		protected var views:Object;
		
		/**
		 *	// TODO currentView 
		 */
		protected var currentView:IView;
				
		/**
		 *	// TODO MainUIMediator 
		 */
		public function MainContainerViewMediator()
		{
			super();
		}

		/**
		 *	// TODO onRegister 
		 *	
		 *	@return void	
		 */
		override public function onRegister():void
		{
			logger.debug( "MainUIMediator::onRegister" );
			viewStateChanged.add( onViewStateChange );
			
			view.main();
			
			var navigationArray:Array = [];
			var navMap:Array = l10n.map.nav
			
			for( var i:int = 0; i < navMap.length; i++ )
			{
				var item:Object = Dictionary( navMap[ i ] ).item;
				var action:Action = new Action( item.destination, item.label )
				navigationArray.push( action );
			}
			
			view.buildNavigation( navigationArray );
			
			view.tagline.text = l10n.map.tagline;
			view.toggleAssetButton.label = l10n.map.swap_assets;
			
			// set up the toggling of the asset library
			pm.setPreference( "dynamicLibrary", "assets.swf" );
			var toggleAssetSignal:NativeSignal = new NativeSignal( view.toggleAssetButton, MouseEvent.CLICK, MouseEvent );
			toggleAssetSignal.add( updateDynamicLib );
			
			views = {};
			views[ "home" ] = FirstView;
			views[ "blog" ] = SecondView;
			views[ "about" ] = ThirdView;
			
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

		private function updateDynamicLib( evt:MouseEvent ):void
		{
			updateDynamicLibrary.dispatch();
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
		 *	// TODO onViewStateChange 
		 *	
		 *	@return void	
		 */
		protected function onViewStateChange():void
		{
			var viewName:String = viewState.viewName;
			
			// if it's empty, set it to the home page
			if( viewName == "" ) viewName; // = "home";
			
			logger.debug( "MainUIMediator::onViewStateChanged: " + viewName );
			
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
		
		/**
		 *	// TODO showView 
		 *	
		 *	@param newView 
		 *	
		 *	@return void	
		 */
		protected function showView( newView:IView ):void
		{
			currentView = newView;
			view.viewContainer.addChild( DisplayObject( currentView ) );
			currentView.show( null );
		}
		
		private function beginShow():void
		{
			TweenMax.to( currentView, 1, { alpha: 1, ease:Quart.easeOut } );
		}
		
		protected function changeDynamicLibrary():void
		{
			pm.setPreference( "dynamicLibrary", "assets2.swf" );
			updateDynamicLibrary.dispatch();
		}
	}
}