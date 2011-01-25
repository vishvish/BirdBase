package com.vishvish.demoApplication.view.mediators
{
	import com.vishvish.demoApplication.view.ThirdView;
	import org.birdbase.framework.view.AbstractBirdbaseMediator;

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
	public class ThirdViewMediator extends ApplicationMediator
	{
		[Inject]
		public var view:ThirdView;
		
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