package org.birdbase.framework.model
{
	/**
	 * Application preferences, wrapping up two instances of PreferencesModel in unrestricted and restricted
	 * instances. Unrestricted properties are public and created/updated by simply being in the query string.
	 * 
	 * Restricted preferences may only be changed within the code.
	 *  
	 * @author	Vish Vishvanath
	 * @since	10 March 2011
	 * 
	 */
	public class Preferences
	{
		public static var restricted:IPreferencesModel;
		public static var unrestricted:IPreferencesModel;
	}
}