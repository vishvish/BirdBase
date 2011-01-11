package com.tfto.birdbase.controller.configuration
{
	import com.tfto.birdbase.controller.AppConfigStateConstants;
	import com.tfto.birdbase.controller.ApplicationBootstrapCommand;
	import com.tfto.birdbase.controller.abstract.BirdbaseCommand;
	
	import org.robotlegs.utilities.statemachine.FSMInjector;
	import org.robotlegs.utilities.statemachine.StateEvent;
	import org.robotlegs.utilities.statemachine.StateMachine;
	
	/**
	 *	// TODO ConfigureStateMachineCommand 
	 *	
	 *	// TODO @example 
	 *	
	 *	// TODO @exampleText 
	 *	
	 *	@author 	Vish Vishvanath
	 *	@email 		vish.vishvanath@gmail.com
	 *	@since 		11 January 2011
	 */
	public class ConfigureStateMachineCommand extends BirdbaseCommand
	{
		/**
		 *	// TODO execute 
		 *	
		 *	@return void	
		 */
		override public function execute():void
		{
			logger.debug( "ConfigureStateMachineCommand::execute" );
			
			var smInjector:FSMInjector = new FSMInjector( AppConfigStateConstants.FSM );
			var sm:StateMachine = new StateMachine( eventDispatcher );

			commandMap.mapEvent( AppConfigStateConstants.CONFIGURE_COMMANDS, ConfigureCommandsCommand, StateEvent, true );
			commandMap.mapEvent( AppConfigStateConstants.CONFIGURE_PREFERENCES, ConfigurePreferencesCommand, StateEvent, true );
			commandMap.mapEvent( AppConfigStateConstants.CONFIGURE_LOCALIZATION, ConfigureLocalizationCommand, StateEvent, true );
			commandMap.mapEvent( AppConfigStateConstants.CONFIGURE_VIEWS, ConfigureViewsCommand, StateEvent, true );
			commandMap.mapEvent( AppConfigStateConstants.GO, ApplicationBootstrapCommand, StateEvent, true );

			commandMap.mapEvent( AppConfigStateConstants.FAIL, ConfigurationFailedCommand, StateEvent, true );

			smInjector.inject( sm );
			
			eventDispatcher.dispatchEvent( new StateEvent( StateEvent.ACTION, AppConfigStateConstants.STARTED ) );
		}
	}
}