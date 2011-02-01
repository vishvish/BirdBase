package org.birdbase.framework.action
{
	import org.osflash.signals.Signal;
	
	public class ActionSignal extends Signal
	{
		public function ActionSignal( actionable:IActionable )
		{
			super( actionable );
		}
	}
}