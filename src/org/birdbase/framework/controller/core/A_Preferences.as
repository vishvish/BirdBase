package org.birdbase.framework.controller.core
{
	import org.birdbase.framework.controller.boot.BootManagement;
	import org.birdbase.framework.model.*;
	import org.birdbase.framework.service.*;
	import org.robotlegs.mvcs.Command;
	import org.robotlegs.utilities.statemachine.StateEvent;
	
	/**
	 * The preferences command creates the application Preferences singleton and sets up two zones within this, 
	 * restricted and unrestricted.
	 * 
	 * Restricted preferences may only be set internally. Unrestricted preferences are set by the URL query params.
	 *  
	 * @author	Vish Vishvanath
	 * @since	31 March 2011
	 */
	public class A_Preferences extends Command
	{
		public function A_Preferences()
		{
			super();
		}
		
		/**
		 * @inheritDoc
		 */
		override public function execute():void
		{
			status();
			
			var publicPreferences:ISettingsModel = new SettingsModel();
			var privatePreferences:ISettingsModel = new SettingsModel();
			Settings.restricted = privatePreferences;
			Settings.unrestricted = publicPreferences;
			injector.mapSingletonOf( Settings, Settings );
			
			onComplete();
		}
		
		private function onComplete():void
		{
			eventDispatcher.dispatchEvent( new StateEvent( StateEvent.ACTION, BootManagement.CONFIGURING_PREFERENCES_COMPLETE ) );
		}
	}
}