package org.birdbase.framework.controller.configuration
{
	import com.vishvish.demoApplication.controller.*;
	
	import org.birdbase.framework.controller.abstract.BirdbaseCommand;
	import org.birdbase.framework.controller.assets.LoadAssetsCommand;
	import org.robotlegs.utilities.statemachine.*;
	
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
		public static const FSM:XML = 
			<fsm initial={STARTING}>
				<!-- THE INITIAL STATE -->
				<state name={STARTING}>
					<transition action={STARTED} target={CONFIGURING_COMMANDS} />
					<transition action={START_FAILED} target={FAILING} />
				</state>
				<!-- DOING SOME WORK -->
				<state name={CONFIGURING_COMMANDS} changed={CONFIGURE_COMMANDS}>
					<transition action={CONFIGURE_COMMANDS_COMPLETE} target={CONFIGURING_PREFERENCES} />
					<transition action={CONFIGURE_COMMANDS_FAILED} target={FAILING} />
				</state>
				<state name={CONFIGURING_PREFERENCES} changed={CONFIGURE_PREFERENCES}>
					<transition action={CONFIGURE_PREFERENCES_COMPLETE} target={CONFIGURING_LOCALIZATION} />
					<transition action={CONFIGURE_PREFERENCES_FAILED} target={FAILING} />
				</state>
				<state name={CONFIGURING_LOCALIZATION} changed={CONFIGURE_LOCALIZATION}>
					<transition action={CONFIGURE_LOCALIZATION_COMPLETE} target={LOADING_ASSETS} />
					<transition action={CONFIGURE_LOCALIZATION_FAILED} target={FAILING} />
				</state>
				<state name={LOADING_ASSETS} changed={LOAD_ASSETS}>
					<transition action={LOAD_ASSETS_COMPLETE} target={CONFIGURING_VIEWS} />
					<transition action={LOAD_ASSETS_FAILED} target={FAILING} />
				</state>
				<state name={CONFIGURING_VIEWS} changed={CONFIGURE_VIEWS}>
					<transition action={CONFIGURE_VIEWS_COMPLETE} target={BOOTSTRAPPING_APPLICATION} />
					<transition action={CONFIGURE_VIEWS_FAILED} target={FAILING} />
				</state>
				<state name={BOOTSTRAPPING_APPLICATION} changed={BOOT_APPLICATION}>
					<transition action={BOOT_APPLICATION_COMPLETE} target={BOOTSTRAPPING_APPLICATION_MODULES} />
					<transition action={BOOT_APPLICATION_FAILED} target={FAILING} />
				</state>
				<state name={BOOTSTRAPPING_APPLICATION_MODULES} changed={BOOT_APPLICATION_MODULES}>
					<transition action={BOOT_APPLICATION_MODULES_COMPLETE} target={READY} />
					<transition action={BOOT_APPLICATION_MODULES_FAILED} target={FAILING} />
				</state>
				<!-- READY TO ACCEPT BROWSER OR USER NAVIGATION -->
				<state name={READY} changed={GO} />
				<!-- REPORT FAILURE FROM ANY STATE -->
				<state name={FAILING} changed={FAIL} />
			</fsm>;
		
		public static const STARTING:String              			= "state/starting";
		public static const START:String                 			= "event/start";
		public static const STARTED:String               			= "action/completed/start";
		public static const START_FAILED:String          			= "action/start/failed";
		
		public static const CONFIGURING_COMMANDS:String      		= "state/configuring/commands";
		public static const CONFIGURE_COMMANDS:String          	 	= "event/configure/commands";
		public static const CONFIGURE_COMMANDS_COMPLETE:String		= "action/configure/commands/complete";
		public static const CONFIGURE_COMMANDS_FAILED:String		= "action/configure/commands/failed";
		
		public static const CONFIGURING_PREFERENCES:String			= "state/configuring/preferences";
		public static const CONFIGURE_PREFERENCES:String			= "event/configure/preferences";
		public static const CONFIGURE_PREFERENCES_COMPLETE:String	= "action/configure/preferences/complete";
		public static const CONFIGURE_PREFERENCES_FAILED:String		= "action/configure/preferences/failed";
		
		public static const CONFIGURING_LOCALIZATION:String			= "state/configuring/localization";
		public static const CONFIGURE_LOCALIZATION:String			= "event/configure/localization";
		public static const CONFIGURE_LOCALIZATION_COMPLETE:String	= "action/configure/localization/complete";
		public static const CONFIGURE_LOCALIZATION_FAILED:String	= "action/configure/localization/failed";
		
		public static const BOOTSTRAPPING_APPLICATION:String		= "state/booting/application";
		public static const BOOT_APPLICATION:String					= "event/boot/application";
		public static const BOOT_APPLICATION_COMPLETE:String		= "action/boot/application/complete";
		public static const BOOT_APPLICATION_FAILED:String			= "action/boot/application/failed";
		
		public static const BOOTSTRAPPING_APPLICATION_MODULES:String	= "state/booting/application_modules";
		public static const BOOT_APPLICATION_MODULES:String				= "event/boot/application_modules";
		public static const BOOT_APPLICATION_MODULES_COMPLETE:String	= "action/boot/application_modules/complete";
		public static const BOOT_APPLICATION_MODULES_FAILED:String		= "action/boot/application_modules/failed";
		
		public static const LOADING_ASSETS:String         			= "state/loading/assets";
		public static const LOAD_ASSETS:String           			= "event/load/assets";
		public static const LOAD_ASSETS_COMPLETE:String  			= "action/load/assets/complete";
		public static const LOAD_ASSETS_FAILED:String    			= "action/load/assets/failed";
		
		public static const CONFIGURING_VIEWS:String            	= "state/configuring/views";
		public static const CONFIGURE_VIEWS:String              	= "event/configure/views";
		public static const CONFIGURE_VIEWS_COMPLETE:String     	= "action/configure/views/complete";
		public static const CONFIGURE_VIEWS_FAILED:String   		= "action/configure/views/failed";
		
		public static const READY:String  	      					= "state/ready";
		public static const GO:String  			  					= "event/go";		
		
		public static const FAILING:String  	  		  	    	= "state/failing";
		public static const FAIL:String  	  		  	        	= "event/fail";

		
		/**
		 *	@inherit 
		 */
		override public function execute():void
		{
			logger.debug( "ConfigureStateMachineCommand::execute" );
			
			var smInjector:FSMInjector = new FSMInjector( ConfigureStateMachineCommand.FSM );
			var sm:StateMachine = new StateMachine( eventDispatcher );

			commandMap.mapEvent( ConfigureStateMachineCommand.CONFIGURE_COMMANDS, ConfigureCommandsCommand, StateEvent, true );
			commandMap.mapEvent( ConfigureStateMachineCommand.CONFIGURE_PREFERENCES, ConfigurePreferencesCommand, StateEvent, true );
			commandMap.mapEvent( ConfigureStateMachineCommand.CONFIGURE_LOCALIZATION, ConfigureLocalizationCommand, StateEvent, true );
			commandMap.mapEvent( ConfigureStateMachineCommand.LOAD_ASSETS, LoadAssetsCommand, StateEvent, true );
			commandMap.mapEvent( ConfigureStateMachineCommand.CONFIGURE_VIEWS, ConfigureViewsCommand, StateEvent, true );
			commandMap.mapEvent( ConfigureStateMachineCommand.FAIL, ConfigurationFailedCommand, StateEvent, true );
			
			// This is the connection between BirdBase and your application
			commandMap.mapEvent( ConfigureStateMachineCommand.BOOT_APPLICATION, ApplicationBootstrapCommand, StateEvent, true );
			commandMap.mapEvent( ConfigureStateMachineCommand.BOOT_APPLICATION_MODULES, ApplicationLoadModulesCommand, StateEvent, true );

			smInjector.inject( sm );
			
			eventDispatcher.dispatchEvent( new StateEvent( StateEvent.ACTION, ConfigureStateMachineCommand.STARTED ) );
		}
	}
}