package org.birdbase.framework.controller.navigation
{
	import com.asual.swfaddress.SWFAddressEvent;
	import com.epologee.navigator.integration.swfaddress.SWFAddressNavigator;
	
	import org.birdbase.framework.controller.signals.InternalNavigationSignal;
	import org.robotlegs.mvcs.SignalCommand;
	
	/**
	 * Runs whenever SWFAddress reports an external change, such as a URL being typed into the browser.
	 * 
	 * Should capture all params and place them into the unrestricted zone, and request a state change
	 * from the navigator.
	 *  
	 * @author	Vish Vishvanath
	 * @since	23 February 2011
	 * 
	 */
	public class InternalSWFAddressChangeCommand extends SignalCommand
	{
		[Inject]
		public var navigator:SWFAddressNavigator;
		
		[Inject]
		public var navigationSignal:InternalNavigationSignal;
		
		private var _event:SWFAddressEvent;
		
		public function InternalSWFAddressChangeCommand( e:SWFAddressEvent )
		{
			super();
			_event = e;
		}
		
		override public function execute():void
		{
			info();
			if( navigator.startState )
			{
				navigator.request( _event.path );
			}
			
			navigationSignal.dispatch();
			
			/*for( var key:String in _event.parameters )
			{
				debug( key, _event.parameters[ key ] );
			}*/
		}
	}
}