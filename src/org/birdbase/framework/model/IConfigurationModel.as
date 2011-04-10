package org.birdbase.framework.model
{
	import flash.utils.Dictionary;

	/**
	 * Describes a configuration model which loads in a config file and stores its values.
	 * 
	 * @author	Vish Vishvanath
	 * @since	31 March 2011
	 */
	public interface IConfigurationModel
	{
		/**
		 * The configuration file filename. 
		 */
		function get configurationFilename():String;
		function set configurationFilename( value:String ):void;

		/**
		 * The configuration file loaded and parsed into a Dictionary object.
		 * @return 
		 */
		function get conf():Dictionary;
		function set conf( value:Dictionary ):void;

		/**
		 * Returns the configuration value by its ID.
		 * 
		 * @deprecated
		 * 
		 * @param id
		 * @param restricted
		 * @return 
		 */
		[Deprecated]
		function getConfigurationById( id:String, restricted:Boolean=false ):*;
	}
}