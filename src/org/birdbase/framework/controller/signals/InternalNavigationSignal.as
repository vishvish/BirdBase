package org.birdbase.framework.controller.signals
{
	import org.osflash.signals.Signal;
	
	/**
	 * A navigation signal fired when a navigation event occurs.
	 *  
	 * @author	Vish Vishvanath
	 * @since	11 March 2011
	 * 
	 */
	public class InternalNavigationSignal extends Signal
	{
		public function InternalNavigationSignal( ...parameters )
		{
			super( parameters );
		}
	}
}