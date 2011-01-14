package org.birdbase.application.view.mediators
{
	import flash.events.MouseEvent;
	
	import org.birdbase.application.view.ThirdView;
	import org.birdbase.framework.model.BirdbaseApplicationModel;
	import org.birdbase.framework.model.ViewStateModel;
	import org.birdbase.framework.signals.ModifyApplicationState;
	import org.birdbase.modules.slideshow.ISlideshowModule;
	import org.birdbase.modules.slideshow.signals.LoadSlideshow;
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
	public class ThirdViewMediator extends AbstractBirdbaseMediator
	{
		[Inject]
		public var view:ThirdView;
		
		[Inject]
		public var slideshow:ISlideshowModule;

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