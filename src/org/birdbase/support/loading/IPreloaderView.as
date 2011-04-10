package org.birdbase.support.loading 
{
	/**
	 * Describes a preloader view class which must handle a complete function to clean itself up.
	 *  
	 * @author	Vish Vishvanath
	 * @since	06 April 2011
	 */
	public interface IPreloaderView
	{
		function complete():void;
	}
}