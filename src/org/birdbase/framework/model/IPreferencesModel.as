package org.birdbase.framework.model
{
	import flash.utils.Dictionary;

	/**
	 * Describes a basic data preferences model.
	 *  
	 * @author	Vish Vishvanath
	 * @since	10 March 2011
	 */
	public interface IPreferencesModel
	{
		/**
		 * Returns a preference by its key.
		 *  
		 * @param key
		 * @return 
		 */
		function getPreference( key:String ):*;

		/**
		 * Sets a preference item to a key. Optional override to overwrite existing pref.
		 *  
		 * @param key
		 * @param item
		 * @param pOverride
		 */
		function setPreference( key:String, item:*, pOverride:Boolean = true ):void;

		/**
		 * Removes the key and item from the model.
		 *  
		 * @param key
		 */
		function clearPreference( key:String ):void;

		/**
		 * Sets all initial preferences.
		 *  
		 * @param d
		 */
		function setValues( d:Dictionary ):void;
	}
}