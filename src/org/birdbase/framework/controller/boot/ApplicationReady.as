package org.birdbase.framework.controller.boot
{
	import com.asual.swfaddress.SWFAddress;
	import com.asual.swfaddress.SWFAddressEvent;
	import com.epologee.navigator.INavigator;
	
	import org.birdbase.framework.controller.navigation.*;
	import org.birdbase.framework.model.*;
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
		public var settings:Settings;

		[Inject]
		public var navigator:INavigator;
		
		[Inject]
		public var configurationModel:IConfigurationModel;
		
		protected var _state:String;

		private var _timeout:uint;

		public function ApplicationReady()
		{
			super();
		}
		
		/**
		 * @inheritDoc
		 */
		override public function execute():void
		{
			commandMap.mapEvent( SWFAddressEvent.EXTERNAL_CHANGE, ExternalSWFAddressChangeCommand, SWFAddressEvent );
			commandMap.mapEvent( SWFAddressEvent.INTERNAL_CHANGE, InternalSWFAddressChangeCommand, SWFAddressEvent );

			_state = SWFAddress.getValue();
			if( _state == "/" )
			{
				_state = settings.getSetting( "home_view" );
			}
			navigator.start( "", _state );
		}
	}
}