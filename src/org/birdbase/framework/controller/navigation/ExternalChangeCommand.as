package org.birdbase.framework.controller.navigation
{
	import com.asual.swfaddress.SWFAddressEvent;
	import com.epologee.navigator.integration.swfaddress.SWFAddressNavigator;
	
	import org.birdbase.framework.signals.ExternalNavigationSignal;
	import org.robotlegs.mvcs.Command;
	
	public class ExternalChangeCommand extends Command
	{
		private var _event:SWFAddressEvent;

		[Inject]
		public var navigator:SWFAddressNavigator;

		[Inject]
		public var navigationSignal:ExternalNavigationSignal;
		
		public function ExternalChangeCommand( e:SWFAddressEvent )
		{
			super();
			_event = e;
		}
		
		override public function execute():void
		{
			info( _event.path );
			if( navigator.startState )
			{
				navigator.request( _event.path );
			}
			navigationSignal.dispatch();
		}
	}
}