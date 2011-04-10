package org.birdbase.framework.service.text
{
	/**
	 *	All components that contain text should implement this interface if they require automatic updating once new
	 *	strings are loaded.
	 *  
	 *	@author	Vish Vishvanath
	 * 	@since	13 February 2011
	 */
	public interface IHaveUpdateableText
	{
		/**
		 * The callback method to update the text field within this component.
		 *  
		 * @param value
		 */
		function setText( value:String ):void;
	}
}