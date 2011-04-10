package org.birdbase.framework.controller.boot
{
	import org.robotlegs.mvcs.Command;
	
	/**
	 * Command to handle bootup faults.
	 *  
	 * @author	Vish Vishvanath
	 * @since	31 March 2011
	 */
	public class ApplicationFault extends Command
	{
		public function ApplicationFault()
		{
			super();
		}
		
		/**
		 * @inheritDoc
		 */
		override public function execute():void
		{
			fatal();
		}
	}
}