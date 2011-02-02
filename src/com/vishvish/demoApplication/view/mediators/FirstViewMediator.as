package com.vishvish.demoApplication.view.mediators
{
	import com.vishvish.demoApplication.view.FirstView;
	
	import flash.events.MouseEvent;
	
	import org.birdbase.framework.model.L10nModel;
	import org.birdbase.framework.model.L10nModel;
	import org.birdbase.framework.view.AbstractBirdbaseMediator;
	import org.birdbase.modules.navigation.NavigationModule;
	import org.birdbase.modules.slideshow.SlideshowModule;
	import org.osflash.signals.natives.NativeSignal;

	/**
	 *	// TODO FirstViewMediator 
	 *	
	 *	// TODO @example 
	 *	
	 *	// TODO @exampleText 
	 *	
	 *	@author 	Vish Vishvanath
	 *	@email 		vish.vishvanath@gmail.com
	 *	@since 		11 January 2011
	 */
	public class FirstViewMediator extends ApplicationMediator
	{
		[Inject]
		/**
		 *	// TODO view 
		 */
		public var view:FirstView;
		
		[Inject]
		public var slideshow:SlideshowModule;
		
		[Inject]
		public var l10n:org.birdbase.framework.model.L10nModel;
		
		/**
		 *	// TODO FirstViewMediator 
		 */
		public function FirstViewMediator()
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
			view.slideshow = slideshow;
			
			view.main();
			
			var ns:NativeSignal = new NativeSignal( view.blueButton, MouseEvent.CLICK, MouseEvent );
			ns.add( selectBluePill );
			
			ns = new NativeSignal( view.redButton, MouseEvent.CLICK, MouseEvent );
			ns.add( selectRedPill );
		}
		
		/**
		 *	// TODO selectBluePill 
		 *	
		 *	@param e 
		 *	
		 *	@return void	
		 */
		protected function selectBluePill( e:MouseEvent ):void
		{
			appModel.addParameter( "option1", "blue" );
			viewState.viewName = "blog";
			modifyApplicationState.dispatch();
		}
		
		/**
		 *	// TODO selectRedPill 
		 *	
		 *	@param e 
		 *	
		 *	@return void	
		 */
		protected function selectRedPill( e:MouseEvent ):void
		{
			appModel.addParameter( "option1", "red" );
			viewState.viewName = "blog";
			modifyApplicationState.dispatch();
		}	
	}
}