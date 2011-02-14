package com.vishvish.demoApplication.view
{
	import com.vishvish.demoApplication.view.mediators.abstract.ApplicationMediator;
	
	import flash.events.MouseEvent;
	
	import org.birdbase.framework.service.TextService;
	import org.osflash.signals.natives.NativeSignal;

	/**
	 *	// TODO SecondViewMediator 
	 *	
	 *	// TODO @example 
	 *	
	 *	// TODO @exampleText 
	 *	
	 *	@author 	Vish Vishvanath
	 *	@email 		vish.vishvanath@gmail.com
	 *	@since 		11 January 2011
	 */
	public class SecondViewMediator extends ApplicationMediator
	{
		[Inject]
		public var textService:TextService;

		[Inject]
		public var view:SecondView;
				
		/**
		 *	// TODO SecondViewMediator 
		 */
		public function SecondViewMediator()
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
			
			textService.register( view.pushbuttonA, "yellowbutton" );
			textService.register( view.pushbuttonB, "purplebutton" );

			var ns:NativeSignal = new NativeSignal( view.pushbuttonA, MouseEvent.CLICK, MouseEvent );
			ns.add( selectYellowPill );
			
			ns = new NativeSignal( view.pushbuttonB, MouseEvent.CLICK, MouseEvent );
			ns.add( selectPurplePill );
			
			textService.register( view.textTF, "secondviewselected", appModel.map.itemFor( "option1" ), appModel.map.itemFor( "option1" ), appModel.map.itemFor( "option1" ) );
		}
		
		/**
		 *	// TODO selectYellowPill 
		 *	
		 *	@param e 
		 *	
		 *	@return void	
		 */
		protected function selectYellowPill(e:MouseEvent):void
		{
			appModel.addParameter( "option2", "yellow" );
			viewState.viewName = "community";
			modifyApplicationState.dispatch();
		}
		
		/**
		 *	// TODO selectPurplePill 
		 *	
		 *	@param e 
		 *	
		 *	@return void	
		 */
		protected function selectPurplePill(e:MouseEvent):void
		{
			appModel.addParameter( "option2", "purple" );
			viewState.viewName = "community";
			modifyApplicationState.dispatch();
		}	
	}
}