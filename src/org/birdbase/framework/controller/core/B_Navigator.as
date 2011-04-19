package org.birdbase.framework.controller.core
{
	import com.asual.swfaddress.SWFAddress;
	import com.epologee.navigator.integration.robotlegs.mapping.*;
	import com.epologee.navigator.integration.swfaddress.SWFAddressNavigator;
	
	import org.birdbase.framework.controller.boot.BootManagement;
	import org.birdbase.framework.controller.navigation.*;
	import org.birdbase.framework.controller.signals.*;
	import org.robotlegs.mvcs.Command;
	import org.robotlegs.utilities.statemachine.StateEvent;
	
	/**
	 * The Navigator command instantiates and sets up the Navigator class to manage the view states of the application.
	 *  
	 * @author	Vish Vishvanath
	 * @since	31 March 2011
	 */
	public class B_Navigator extends Command
	{
		public function B_Navigator()
		{
			super();
		}

		/**
		 *	@inheritDoc 
		 */
		override public function execute():void
		{
			status();
			
			var navigator:SWFAddressNavigator = new SWFAddressNavigator();

			injector.mapValue( SWFAddressNavigator, navigator );
			
			// signals to be dispatched when SWFAddress tells us.
			injector.mapSingletonOf( InternalNavigationSignal, InternalNavigationSignal );
			injector.mapSingletonOf( ExternalNavigationSignal, ExternalNavigationSignal );
			
			var state:String = SWFAddress.getPath();
			var stateControllerMap:IStateControllerMap = new StateControllerMap( navigator, injector );
			var stateActorMap:IStateActorMap = new StateActorMap( navigator, injector );

			onComplete();
		}
		
		private function onComplete():void
		{
			eventDispatcher.dispatchEvent( new StateEvent( StateEvent.ACTION, BootManagement.CONFIGURING_NAVIGATOR_COMPLETE ) );
		}
	}
}