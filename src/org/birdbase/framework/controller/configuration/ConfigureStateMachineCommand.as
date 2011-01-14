package org.birdbase.framework.controller.configuration
{
	import org.birdbase.application.controller.ApplicationBootstrapCommand;
	import org.birdbase.application.controller.ApplicationLoadModulesCommand;
	import org.birdbase.framework.controller.AppConfigStateConstants;
	import org.birdbase.framework.controller.abstract.BirdbaseCommand;
	import org.birdbase.framework.controller.assets.LoadAssetsCommand;
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
			commandMap.mapEvent( AppConfigStateConstants.LOAD_ASSETS, LoadAssetsCommand, StateEvent, true );
			commandMap.mapEvent( AppConfigStateConstants.CONFIGURE_VIEWS, ConfigureViewsCommand, StateEvent, true );
			commandMap.mapEvent( AppConfigStateConstants.FAIL, ConfigurationFailedCommand, StateEvent, true );
			
			// This is the connection between BirdBase and your application
			commandMap.mapEvent( AppConfigStateConstants.BOOT_APPLICATION, ApplicationBootstrapCommand, StateEvent, true );
			commandMap.mapEvent( AppConfigStateConstants.BOOT_APPLICATION_MODULES, ApplicationLoadModulesCommand, StateEvent, true );

			smInjector.inject( sm );
			
			eventDispatcher.dispatchEvent( new StateEvent( StateEvent.ACTION, AppConfigStateConstants.STARTED ) );
		}
	}
}