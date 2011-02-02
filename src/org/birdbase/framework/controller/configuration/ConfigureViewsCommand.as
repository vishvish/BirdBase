package org.birdbase.framework.controller.configuration
{
	import org.birdbase.framework.controller.FiniteStateMachineConfiguration;
	import org.birdbase.framework.controller.abstract.BirdbaseCommand;
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
			
			// in your application, you may want to configure your views here as per the example below
			
			/*mediatorMap.mapView( MainContainerView, MainContainerViewMediator );
			mediatorMap.mapView( FirstView, FirstViewMediator );
			mediatorMap.mapView( SecondView, SecondViewMediator );
			mediatorMap.mapView( ThirdView, ThirdViewMediator );*/

			eventDispatcher.dispatchEvent( new StateEvent( StateEvent.ACTION, ConfigureStateMachineCommand.CONFIGURE_VIEWS_COMPLETE ) );
		}3
	}
}