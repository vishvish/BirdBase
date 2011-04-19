package org.birdbase.framework.model
{
	/**
	 * Application settings, wrapping up two instances of SettingsModel in unrestricted and restricted
	 * instances. Unrestricted properties are public and created/updated by simply being in the query string.
	 * 
	 * Restricted settings may only be changed within the code.
	 *  
	 * @author	Vish Vishvanath
	 * @since	10 March 2011
	 * 
	 */
	public class Settings
	{
		public static var restricted:ISettingsModel;
		public static var unrestricted:ISettingsModel;
	}
}