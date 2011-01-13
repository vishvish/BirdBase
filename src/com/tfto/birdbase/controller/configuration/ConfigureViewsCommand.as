package com.tfto.birdbase.controller.configuration
{
	import com.tfto.birdbase.controller.AppConfigStateConstants;
	import com.tfto.birdbase.controller.abstract.BirdbaseCommand;
	import com.tfto.birdbase.signals.ModifyApplicationState;
	import com.tfto.birdbase.view.FirstView;
	import com.tfto.birdbase.view.MainUI;
	import com.tfto.birdbase.view.SecondView;
	import com.tfto.birdbase.view.ThirdView;
	import com.tfto.birdbase.view.mediators.FirstViewMediator;
	import com.tfto.birdbase.view.mediators.MainUIMediator;
	import com.tfto.birdbase.view.mediators.SecondViewMediator;
	import com.tfto.birdbase.view.mediators.ThirdViewMediator;
	
	import org.robotlegs.utilities.statemachine.StateEvent;
	
	/**
	 *	// TODO ConfigureViewsCommand 
	 *	
	 *	// TODO @example 
	 *	
	 *	// TODO @exampleText 
	 *	
	 *	@author 	Vish Vishvanath
	 *	@email 		vish.vishvanath@gmail.com
	 *	@since 		11 January 2011
	 */
	public class ConfigureViewsCommand extends BirdbaseCommand
	{
		/**
		 *	// TODO ConfigureViewsCommand 
		 */
		public function ConfigureViewsCommand()
		{
			super();
		}

		/**
		 *	// TODO execute 
		 *	
		 *	@return void	
		 */
		override public function execute():void
		{
			logger.debug( "ConfigureViewsCommand::execute" );

			mediatorMap.mapView( MainUI, MainUIMediator );
			mediatorMap.mapView( FirstView, FirstViewMediator );
			mediatorMap.mapView( SecondView, SecondViewMediator );
			mediatorMap.mapView( ThirdView, ThirdViewMediator );

			eventDispatcher.dispatchEvent( new StateEvent( StateEvent.ACTION, AppConfigStateConstants.CONFIGURE_VIEWS_COMPLETE ) );
		}
	}
}