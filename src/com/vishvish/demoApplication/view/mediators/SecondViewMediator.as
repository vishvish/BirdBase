package com.vishvish.demoApplication.view.mediators
{
	import flash.events.MouseEvent;
	
	import com.vishvish.demoApplication.view.SecondView;
	import org.birdbase.framework.view.AbstractBirdbaseMediator;
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
		/**
		 *	// TODO view 
		 */
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
			view.option1 = appModel.option1;
			view.main();
			
			var ns:NativeSignal = new NativeSignal(view.yellowButton,MouseEvent.CLICK,MouseEvent);
			ns.add(selectYellowPill);
			
			ns = new NativeSignal(view.purpleButton,MouseEvent.CLICK,MouseEvent);
			ns.add(selectPurplePill);
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
			appModel.option2 = "yellow";
			viewState.viewName = "view3";
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
			appModel.option2 = "purple";
			viewState.viewName = "view3";
			modifyApplicationState.dispatch();
		}	
	}
}