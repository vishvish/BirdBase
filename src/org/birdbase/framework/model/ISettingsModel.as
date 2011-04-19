package org.birdbase.framework.model
{
	import flash.utils.Dictionary;

	/**
	 * Describes a basic data settings model.
	 *  
	 * @author	Vish Vishvanath
	 * @since	10 March 2011
	 */
	public interface ISettingsModel
	{
		/**
		 * Returns a setting by its key.
		 *  
		 * @param key
		 * @return 
		 */
		function getSetting( key:String ):*;

		/**
		 * Sets a setting item to a key. Optional override to overwrite existing setting.
		 *  
		 * @param key
		 * @param item
		 * @param pOverride
		 */
		function setSetting( key:String, item:*, pOverride:Boolean = true ):void;

		/**
		 * Removes the key and item from the model.
		 *  
		 * @param key
		 */
		function clearSetting( key:String ):void;

		/**
		 * Sets all initial settings.
		 *  
		 * @param d
		 */
		function setValues( d:Dictionary ):void;
	}
}