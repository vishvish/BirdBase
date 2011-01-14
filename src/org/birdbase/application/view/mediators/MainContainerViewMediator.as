package org.birdbase.application.view.mediators
{
	import com.greensock.TweenMax;
	import com.greensock.easing.Quart;
	
	import flash.display.DisplayObject;
	import flash.events.MouseEvent;
	
	import org.as3commons.logging.ILogger;
	import org.birdbase.application.view.*;
	import org.birdbase.framework.model.*;
	import org.birdbase.framework.signals.*;
	import org.birdbase.framework.utils.swfaddress.SWFAddress;
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
	public class MainContainerViewMediator extends AbstractBirdbaseMediator
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

//		[Inject]
//		public var slideshow:ISlideshowModule;
//		
//		[Inject]
//		public var slideshowLoaded:SlideshowLoaded;

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
//			slideshowLoaded.add( onSlideshowLoaded );
			
			view.main();
			
			view.tagline.text = l10n.getProperty( "tagline" );
			view.toggleAssetButton.text = l10n.getProperty( "swap-assets" );
			
			// set up the toggling of the asset library
			pm.setProperty( "dynamic-library", "assets.swf" );
			var toggleAssetSignal:NativeSignal = new NativeSignal( view.toggleAssetButton, MouseEvent.CLICK, MouseEvent );
			toggleAssetSignal.add( updateDynamicLib );
			
			views = {};
			views[ "" ] = FirstView;
			views[ "view2" ] = SecondView;
			views[ "view3" ] = ThirdView;
			
			var ns:NativeSignal = new NativeSignal( view.logo, MouseEvent.CLICK, MouseEvent );
			ns.add(gotoHome);
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
			swfAddress.setValue( "/" );
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
		
		protected function onSlideshowLoaded():void
		{
			logger.debug( "MainContainerViewMediator::onSlideshowLoaded" );
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