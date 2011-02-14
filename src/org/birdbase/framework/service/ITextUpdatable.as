package org.birdbase.framework.service
{
	/**
	 *	All components that contain text should implement this interface if they require automatic updating once new
	 *	strings are loaded.
	 *  
	 *	@author	Vish Vishvanath
	 * 	@since	13 February 2011
	 * 
	 */
	public interface ITextUpdatable
	{
		function set text( value:String ):void;
	}
}