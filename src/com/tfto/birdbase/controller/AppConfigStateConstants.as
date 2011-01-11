package com.tfto.birdbase.controller
{
	/**
	 *	// TODO AppConfigStateConstants 
	 *	
	 *	// TODO @example 
	 *	
	 *	// TODO @exampleText 
	 *	
	 *	@author 	Vish Vishvanath
	 *	@email 		vish.vishvanath@gmail.com
	 *	@since 		11 January 2011
	 */
	public class AppConfigStateConstants
	{
		public static const STARTING:String              		= "state/starting";
		public static const START:String                 		= "event/start";
		public static const STARTED:String               		= "action/completed/start";
		public static const START_FAILED:String          		= "action/start/failed";

		public static const CONFIGURING_COMMANDS:String         = "state/configuring/commands";
		public static const CONFIGURE_COMMANDS:String           = "event/configure/commands";
		public static const CONFIGURE_COMMANDS_COMPLETE:String  = "action/configure/commands/complete";
		public static const CONFIGURE_COMMANDS_FAILED:String    = "action/configure/commands/failed";

		public static const CONFIGURING_PREFERENCES:String         = "state/configuring/preferences";
		public static const CONFIGURE_PREFERENCES:String           = "event/configure/preferences";
		public static const CONFIGURE_PREFERENCES_COMPLETE:String  = "action/configure/preferences/complete";
		public static const CONFIGURE_PREFERENCES_FAILED:String    = "action/configure/preferences/failed";

		public static const CONFIGURING_LOCALIZATION:String         = "state/configuring/localization";
		public static const CONFIGURE_LOCALIZATION:String           = "event/configure/localization";
		public static const CONFIGURE_LOCALIZATION_COMPLETE:String  = "action/configure/localization/complete";
		public static const CONFIGURE_LOCALIZATION_FAILED:String    = "action/configure/localization/failed";

		public static const CONFIGURING_VIEWS:String            = "state/configuring/views";
		public static const CONFIGURE_VIEWS:String              = "event/configure/views";
		public static const CONFIGURE_VIEWS_COMPLETE:String     = "action/configure/views/complete";
		public static const CONFIGURE_VIEWS_FAILED:String   	= "action/configure/views/failed";

		public static const READY:String  	      				= "state/ready";
		public static const GO:String  			  				= "event/go";		
		
		public static const FAILING:String  	  		  	    = "state/failing";
		public static const FAIL:String  	  		  	        = "event/fail";

		public static const FSM:XML = 
			<fsm initial={STARTING}>

			    <!-- THE INITIAL STATE -->
				<state name={STARTING}>

				   <transition action={STARTED} 
							target={CONFIGURING_COMMANDS}/>
					
					<transition action={START_FAILED} 
							target={FAILING}/>
				</state>
					
					<!-- DOING SOME WORK -->
				<state name={CONFIGURING_COMMANDS} changed={CONFIGURE_COMMANDS}>
				
				   <transition action={CONFIGURE_COMMANDS_COMPLETE} 
						target={CONFIGURING_PREFERENCES}/>
				
				<transition action={CONFIGURE_COMMANDS_FAILED} 
						target={FAILING}/>
				
				</state>
					
				<state name={CONFIGURING_PREFERENCES} changed={CONFIGURE_PREFERENCES}>
				
				   <transition action={CONFIGURE_PREFERENCES_COMPLETE} 
						target={CONFIGURING_LOCALIZATION}/>
				
				<transition action={CONFIGURE_PREFERENCES_FAILED} 
						target={FAILING}/>
				
				</state>

				<state name={CONFIGURING_LOCALIZATION} changed={CONFIGURE_LOCALIZATION}>
				
				   <transition action={CONFIGURE_LOCALIZATION_COMPLETE} 
						target={CONFIGURING_VIEWS}/>
				
				<transition action={CONFIGURE_LOCALIZATION_FAILED} 
						target={FAILING}/>
				
				</state>

				<state name={CONFIGURING_VIEWS} changed={CONFIGURE_VIEWS}>

				   <transition action={CONFIGURE_VIEWS_COMPLETE} 
							target={READY}/>
					
					<transition action={CONFIGURE_VIEWS_FAILED} 
							target={FAILING}/>
					
				</state>

				<!-- READY TO ACCEPT BROWSER OR USER NAVIGATION -->
				<state name={READY} changed={GO}/>
				
				<!-- REPORT FAILURE FROM ANY STATE -->
				<state name={FAILING} changed={FAIL}/>

			</fsm>;
		
	}
}