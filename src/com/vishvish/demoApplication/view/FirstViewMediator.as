package com.vishvish.demoApplication.view
{
	import com.vishvish.demoApplication.view.mediators.abstract.ApplicationMediator;
	
	import flash.events.MouseEvent;
	
	import org.birdbase.framework.service.ITextUpdateable;
	import org.birdbase.framework.service.TextService;
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
		public var textService:TextService;
		
		[Inject]
		public var view:FirstView;

		[Inject]
		public var slideshow:SlideshowModule;
		
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
			view.main();
			
			var ns:NativeSignal = new NativeSignal( view.pushbuttonA, MouseEvent.CLICK, MouseEvent );
			ns.add( selectBluePill );
			
			ns = new NativeSignal( view.pushbuttonB, MouseEvent.CLICK, MouseEvent );
			ns.add( selectRedPill );
			
			// register all text-containing components
			textService.register( view.textTF, "tagline", "Vish" );
			textService.register( view.pushbuttonA, "bluebutton" );
			textService.register( view.pushbuttonB, "redbutton" );
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