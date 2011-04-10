package org.birdbase.framework.controller.navigation
{
	import com.asual.swfaddress.SWFAddressEvent;
	import com.epologee.navigator.integration.swfaddress.SWFAddressNavigator;
	
	import org.birdbase.framework.signals.InternalNavigationSignal;
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
	public class InternalChangeCommand extends SignalCommand
	{
		[Inject]
		public var navigator:SWFAddressNavigator;
		
		[Inject]
		public var navigationSignal:InternalNavigationSignal;
		
		private var _event:SWFAddressEvent;
		
		public function InternalChangeCommand( e:SWFAddressEvent )
		{
			super();
			_event = e;
		}
		
		override public function execute():void
		{
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