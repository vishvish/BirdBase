package org.birdbase.framework.model
{
	import flash.utils.Dictionary;

	/**
	 * The ConfigurationModel holds all the information relating to data and structure of the site. This information
	 * is loaded from the ConfigurationService, as YAML, and mapped into a Dictionary.
	 * 
	 * The model also holds application preferences that may be altered during application lifecycle.
	 * 
	 * @author Vish Vishvanath
	 * @since 7 February 2011
	 * 
	 */
	public final class ConfigurationModel extends ApplicationModel
	{
		protected var _configuration:Dictionary;
		
		protected var _preferences:Dictionary = new Dictionary();
		
		/**
		 * Default configuration filename. 
		 */
		protected var _configurationFilename:String = "configuration.yml";

		public function ConfigurationModel()
		{
			super();
		}
		
		public function get conf():Dictionary
		{
			return _configuration;
		}
		
		public function set conf( value:Dictionary ):void
		{
			_configuration = value;
		}

		public function get preferences():Dictionary
		{
			return _preferences;
		}
		
		public function set preferences( value:Dictionary ):void
		{
			_preferences = value;
		}

		public function getPreference( key:String ):*
		{
			return _preferences[ key ];
		}
		
		public function setPreference( key:String, value:* ):void
		{
			_preferences[ key ] = value;
		}

		public function get configurationFilename():String
		{
			return _configurationFilename;
		}

		public function set configurationFilename(value:String):void
		{
			_configurationFilename = value;
		}
	}
}