package org.birdbase.framework.controller.navigation
{
	import org.birdbase.framework.signals.ExternalNavigationSignal;
	import org.robotlegs.mvcs.Command;
	
	public class ExternalChangeCommand extends Command
	{
		[Inject]
		public var navigationSignal:ExternalNavigationSignal;
		
		public function ExternalChangeCommand()
		{
			super();
		}
		
		override public function execute():void
		{
			info();
//			navigationSignal.dispatch();
		}
	}
}