package com.tfto.birdbase.view.mediators
{
	import com.tfto.birdbase.model.ApplicationModel;
	import com.tfto.birdbase.model.ViewStateModel;
	import com.tfto.birdbase.signals.ModifyApplicationState;
	import com.tfto.birdbase.view.FirstView;
	
	import flash.events.MouseEvent;
	
	import org.osflash.signals.natives.NativeSignal;
	import org.robotlegs.mvcs.Mediator;

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
	public class FirstViewMediator extends Mediator
	{
		[Inject]
		/**
		 *	// TODO view 
		 */
		public var view:FirstView;
				
		[Inject]
		/**
		 *	// TODO appModel 
		 */
		public var appModel:ApplicationModel;
		
		[Inject]
		/**
		 *	// TODO viewState 
		 */
		public var viewState:ViewStateModel;
		
		[Inject]
		/**
		 *	// TODO modifyApplicationState 
		 */
		public var modifyApplicationState:ModifyApplicationState;
		
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
			
			var ns:NativeSignal = new NativeSignal(view.bluePillButton,MouseEvent.CLICK,MouseEvent);
			ns.add(selectBluePill);
			
			ns = new NativeSignal(view.redPillButton,MouseEvent.CLICK,MouseEvent);
			ns.add(selectRedPill);
		}
		
		/**
		 *	// TODO selectBluePill 
		 *	
		 *	@param e 
		 *	
		 *	@return void	
		 */
		protected function selectBluePill(e:MouseEvent):void
		{
			appModel.option1 = "blue";
			viewState.viewName = "view2";
			modifyApplicationState.dispatch();
		}
		
		/**
		 *	// TODO selectRedPill 
		 *	
		 *	@param e 
		 *	
		 *	@return void	
		 */
		protected function selectRedPill(e:MouseEvent):void
		{
			appModel.option1 = "red";
			viewState.viewName = "view2";
			modifyApplicationState.dispatch();
		}	
	}
}