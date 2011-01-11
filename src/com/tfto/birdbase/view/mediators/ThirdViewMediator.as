package com.tfto.birdbase.view.mediators
{
	import com.tfto.birdbase.model.ApplicationModel;
	import com.tfto.birdbase.model.ViewStateModel;
	import com.tfto.birdbase.signals.ModifyApplicationState;
	import com.tfto.birdbase.view.ThirdView;
	
	import flash.events.MouseEvent;
	
	import org.osflash.signals.natives.NativeSignal;
	import org.robotlegs.mvcs.Mediator;

	/**
	 *	// TODO ThirdViewMediator 
	 *	
	 *	// TODO @example 
	 *	
	 *	// TODO @exampleText 
	 *	
	 *	@author 	Vish Vishvanath
	 *	@email 		vish.vishvanath@gmail.com
	 *	@since 		11 January 2011
	 */
	public class ThirdViewMediator extends Mediator
	{
		[Inject]
		/**
		 *	// TODO view 
		 */
		public var view:ThirdView;
				
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
		 *	// TODO ThirdViewMediator 
		 */
		public function ThirdViewMediator()
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
			view.option2 = appModel.option2;
			view.main();
			
		}	
	
	}
}