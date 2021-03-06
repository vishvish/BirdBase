package org.birdbase.framework.controller.navigation
{
	import com.asual.swfaddress.SWFAddressEvent;
	import com.epologee.navigator.INavigator;
	
	import org.birdbase.framework.controller.signals.ExternalNavigationSignal;
	import org.robotlegs.mvcs.Command;
	
	public class ExternalSWFAddressChangeCommand extends Command
	{
		private var _event:SWFAddressEvent;

		[Inject]
		public var navigator:INavigator;

		[Inject]
		public var navigationSignal:ExternalNavigationSignal;
		
		public function ExternalSWFAddressChangeCommand( e:SWFAddressEvent )
		{
			super();
			_event = e;
		}
		
		override public function execute():void
		{
			info( _event.path );
			navigator.request( _event.path );
			navigationSignal.dispatch();
		}
	}
}