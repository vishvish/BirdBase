package org.birdbase.framework.controller.boot
{
	import com.asual.swfaddress.*;
	import com.epologee.navigator.integration.swfaddress.SWFAddressNavigator;
	
	import org.birdbase.framework.controller.navigation.*;
	import org.birdbase.framework.model.*;
	import org.birdbase.framework.signals.*;
	import org.osflash.signals.Signal;
	import org.robotlegs.mvcs.SignalCommand;
	
	/**
	 * Triggered once BootManagement hands over the application to the user.
	 * 
	 * Handles deep-linking at startup by checking for links in the URL and setting the navigator state, or
	 * sending the application to the home_view as defined in the configuration.yml
	 *  
	 * @author	Vish Vishvanath
	 * @since	03 March 2011
	 */
	public class ApplicationReady extends SignalCommand
	{
		[Inject]
		public var navigator:SWFAddressNavigator;
		
		[Inject]
		public var configurationModel:IConfigurationModel;

		public function ApplicationReady()
		{
			super();
		}
		
		/**
		 * @inheritDoc
		 */
		override public function execute():void
		{
			commandMap.mapEvent( SWFAddressEvent.EXTERNAL_CHANGE, InternalChangeCommand, SWFAddressEvent );

			var state:String = SWFAddress.getPath();
			if( state == "/" )
			{
				state = Preferences.restricted.getPreference( "home_view" );
			}
			navigator.start( state );
			navigator.requestNewState( state );
			status( "Navigation State: " + state );
		}
	}
}