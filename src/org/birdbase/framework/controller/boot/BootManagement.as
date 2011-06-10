package org.birdbase.framework.controller.boot
{
	import org.birdbase.framework.controller.core.*;
	import org.robotlegs.mvcs.Command;
	import org.robotlegs.utilities.statemachine.*;
	
	/**
	 * Uses the Finite State Machine (FSM) contributed by Joel Hooks/Cliff Hall/PureMVC, to configure the systematic 
	 * Bootstrap procedure that executes a series of commands. This sets up services and populates models and each step
	 * depends upon successful completion of the previous one.
	 * 
	 * To add steps, simply copy one of the XML &lt;state&gt; nodes and a set of four constants, and rename them to fit your
	 * step. Add a command event map for StateEvent and your new Command to kick off this step.
	 * 
	 * This is the place where the BirdBase framework boots your application.
	 * 
	 * Basically, once the bootstrap is ready, the StartApplication in your application will execute. Once your
	 * Application is ready, the ApplicationReady performs any initial navigation requests from deep links that may be
	 * present, and hands over control to the User.
	 * 
	 * @author 	Vish Vishvanath
	 * @since 	11 January 2011
	 */
	public class BootManagement extends Command
	{
		public static const FSM:XML = 
			<fsm initial={STARTING}>
				<!-- THE INITIAL STATE -->
				<state name={STARTING}>
					<transition action={STARTED} target={CONFIGURING_PREFERENCES} />
					<transition action={START_FAILED} target={FAILING} />
				</state>

				<state name={CONFIGURING_PREFERENCES} changed={CONFIGURE_PREFERENCES}>
					<transition action={CONFIGURING_PREFERENCES_COMPLETE} target={CONFIGURING_NAVIGATOR} />
					<transition action={CONFIGURING_PREFERENCES_FAILED} target={FAILING} />
				</state>
				
				<state name={CONFIGURING_NAVIGATOR} changed={CONFIGURE_NAVIGATOR}>
					<transition action={CONFIGURING_NAVIGATOR_COMPLETE} target={CONFIGURING_MODELS} />
					<transition action={CONFIGURING_NAVIGATOR_FAILED} target={FAILING} />
				</state>
		
				<state name={CONFIGURING_MODELS} changed={CONFIGURE_MODELS}>
					<transition action={CONFIGURING_MODELS_COMPLETE} target={CONFIGURING_SERVICES} />
					<transition action={CONFIGURING_MODELS_FAILED} target={FAILING} />
				</state>
		
				<state name={CONFIGURING_SERVICES} changed={CONFIGURE_SERVICES}>
					<transition action={CONFIGURING_SERVICES_COMPLETE} target={LOADING_ASSETS} />
					<transition action={CONFIGURING_SERVICES_FAILED} target={FAILING} />
				</state>
		
				<state name={LOADING_ASSETS} changed={LOAD_ASSETS}>
					<transition action={LOAD_ASSETS_COMPLETE} target={STARTING_APPLICATION} />
					<transition action={LOAD_ASSETS_FAILED} target={FAILING} />
				</state>

				<state name={STARTING_APPLICATION} changed={START_APPLICATION}>
					<transition action={START_APPLICATION_COMPLETE} target={READY} />
					<transition action={START_APPLICATION_FAILED} target={FAILING} />
				</state>
				<!-- READY TO ACCEPT BROWSER OR USER NAVIGATION -->
				<state name={READY} changed={GO} />
				<!-- REPORT FAILURE FROM ANY STATE -->
				<state name={FAILING} changed={FAIL} />
			</fsm>;
		
		// Finite State Machine
		
		public static const STARTING:String              			= "state/starting";
		public static const START:String                 			= "event/start";
		public static const STARTED:String               			= "action/completed/start";
		public static const START_FAILED:String          			= "action/start/failed";
		
		public static const READY:String  	      					= "state/ready";
		public static const GO:String  			  					= "event/go";		
		public static const FAILING:String  	  		  	    	= "state/failing";
		public static const FAIL:String  	  		  	        	= "event/fail";
		
		// Birdbase
		
		public static const CONFIGURING_NAVIGATOR:String			= "state/configuring/navigator";
		public static const CONFIGURE_NAVIGATOR:String				= "event/configure/navigator";
		public static const CONFIGURING_NAVIGATOR_COMPLETE:String	= "action/configure/navigator/complete";
		public static const CONFIGURING_NAVIGATOR_FAILED:String		= "action/configure/navigator/failed";
		
		public static const CONFIGURING_MODELS:String				= "state/configuring/models";
		public static const CONFIGURE_MODELS:String					= "event/configure/models";
		public static const CONFIGURING_MODELS_COMPLETE:String		= "action/configure/models/complete";
		public static const CONFIGURING_MODELS_FAILED:String		= "action/configure/models/failed";

		public static const CONFIGURING_SERVICES:String				= "state/configuring/services";
		public static const CONFIGURE_SERVICES:String				= "event/configure/services";
		public static const CONFIGURING_SERVICES_COMPLETE:String	= "action/configure/services/complete";
		public static const CONFIGURING_SERVICES_FAILED:String		= "action/configure/services/failed";
		
		public static const CONFIGURING_PREFERENCES:String			= "state/configuring/preferences";
		public static const CONFIGURE_PREFERENCES:String			= "event/configure/preferences";
		public static const CONFIGURING_PREFERENCES_COMPLETE:String	= "action/configure/preferences/complete";
		public static const CONFIGURING_PREFERENCES_FAILED:String	= "action/configure/preferences/failed";
		
		public static const LOADING_ASSETS:String         			= "state/loading/assets";
		public static const LOAD_ASSETS:String           			= "event/load/assets";
		public static const LOAD_ASSETS_COMPLETE:String  			= "action/load/assets/complete";
		public static const LOAD_ASSETS_FAILED:String    			= "action/load/assets/failed";
		
		public static const STARTING_APPLICATION:String            	= "state/starting/application";
		public static const START_APPLICATION:String              	= "event/start/application";
		public static const START_APPLICATION_COMPLETE:String     	= "action/start/application/complete";
		public static const START_APPLICATION_FAILED:String   		= "action/start/application/failed";
		
		/**
		 * @inheritDoc
		 */
		override public function execute():void
		{
			var smInjector:FSMInjector = new FSMInjector( BootManagement.FSM );
			var sm:StateMachine = new StateMachine( eventDispatcher );
			smInjector.inject( sm );
			
			/*sm.eventDispatcher.addEventListener( StateEvent.ACTION, handleStateEvent );
			sm.eventDispatcher.addEventListener( StateEvent.CANCEL, handleStateEvent );
			sm.eventDispatcher.addEventListener( StateEvent.CHANGED, handleStateEvent );*/
			
			commandMap.mapEvent( BootManagement.CONFIGURE_PREFERENCES,	A_Preferences, StateEvent, true );
			commandMap.mapEvent( BootManagement.CONFIGURE_NAVIGATOR, 	B_Navigator, StateEvent, true );
			commandMap.mapEvent( BootManagement.CONFIGURE_MODELS, 		C_Models, StateEvent, true );
			commandMap.mapEvent( BootManagement.CONFIGURE_SERVICES, 	D_Services, StateEvent, true );
			commandMap.mapEvent( BootManagement.LOAD_ASSETS, 			E_Assets, StateEvent, true );
			
			commandMap.mapEvent( BootManagement.GO, 					ApplicationReady, StateEvent, true );
			commandMap.mapEvent( BootManagement.FAIL, 					ApplicationFault, StateEvent, true );
			
			eventDispatcher.dispatchEvent( new StateEvent( StateEvent.ACTION, BootManagement.STARTED ) );
		}

		/**
		 * Turn the event listening back on above if you want to see what's happening within the StateMachine. 
		 * @param e
		 */
		private function handleStateEvent( e:StateEvent ):void
		{
			notice( e );
		}
	}
}