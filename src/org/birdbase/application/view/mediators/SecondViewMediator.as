package org.birdbase.application.view.mediators
{
	import org.birdbase.application.view.SecondView;
	import org.birdbase.framework.model.BirdbaseApplicationModel;
	import org.birdbase.framework.model.ViewStateModel;
	import org.birdbase.framework.signals.ModifyApplicationState;
	
	import flash.events.MouseEvent;
	
	import org.osflash.signals.natives.NativeSignal;
	import org.robotlegs.mvcs.Mediator;

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
	public class SecondViewMediator extends AbstractBirdbaseMediator
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
			
			var ns:NativeSignal = new NativeSignal(view.yellowPillButton,MouseEvent.CLICK,MouseEvent);
			ns.add(selectYellowPill);
			
			ns = new NativeSignal(view.purplePillButton,MouseEvent.CLICK,MouseEvent);
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