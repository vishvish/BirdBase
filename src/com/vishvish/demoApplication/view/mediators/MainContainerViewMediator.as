package com.vishvish.demoApplication.view.mediators
{
	import com.bit101.components.PushButton;
	import com.greensock.TweenMax;
	import com.greensock.easing.Quart;
	import org.birdbase.framework.action.Action;
	import org.birdbase.framework.action.ActionSignal;
	import org.birdbase.framework.action.IActionable;
	import org.birdbase.framework.action.INavigationActionable;
	import com.vishvish.demoApplication.controller.NavigationButton;
	import com.vishvish.demoApplication.view.*;
	
	import flash.display.DisplayObject;
	import flash.events.MouseEvent;
	import flash.utils.Dictionary;
	
	import org.as3commons.logging.ILogger;
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
		public var l10n:L10nYAMLModel;
		
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
				var item:Object = Dictionary( navMap[i] ).item;
				var action:Action = new Action( item.destination, item.label )
				navigationArray.push( action );
			}
			
			view.buildNavigation( navigationArray );
			
			
			view.tagline.text = l10n.map.tagline;
			view.toggleAssetButton.label = l10n.map.swap_assets;
			
			// set up the toggling of the asset library
			pm.setProperty( "dynamic-library", "assets.swf" );
			var toggleAssetSignal:NativeSignal = new NativeSignal( view.toggleAssetButton, MouseEvent.CLICK, MouseEvent );
			toggleAssetSignal.add( updateDynamicLib );
			
			views = {};
			views[ "home" ] = FirstView;
			views[ "blog" ] = SecondView;
			views[ "about" ] = ThirdView;
			
			var ns:NativeSignal = new NativeSignal( view.logo, MouseEvent.CLICK, MouseEvent );
			ns.add(gotoHome);
//
			var signal:NativeSignal = new NativeSignal( view, MouseEvent.CLICK, MouseEvent );
			signal.add( viewPressed );
			
		}

		private function viewPressed( e:MouseEvent ):void
		{
			// did someone just press a navigation button?
			if( e.target is INavigationActionable )
			{
				var destination:String = IActionable( e.target ).action.destination
				logger.debug( "MainContainerViewMediator::viewPressed / Navigation --> " + destination );
				//
				swfAddress.setValue( destination );
			}
			else
			{
				logger.debug( "MainContainerViewMediator::viewPressed" );
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
//			trace("GotoHome");
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

//			Sprite( currentView ).alpha = 0;
			
			view.viewContainer.addChild( DisplayObject( currentView ) );
			currentView.show( null );
//			beginShow();
		}
		
		private function beginShow():void
		{
			TweenMax.to( currentView, 1, { alpha: 1, ease:Quart.easeOut } );
		}
		
		protected function changeDynamicLibrary():void
		{
			pm.setProperty( "dynamic-library", "assets2.swf" );
			updateDynamicLibrary.dispatch();
		}
	}
}