package org.birdbase.framework.model
{
	import flash.utils.Dictionary;
	
	import org.as3commons.collections.Map;
	import org.robotlegs.mvcs.Actor;

	/**
	 * The ConfigurationModel holds all the information relating to data and structure of the site. This information
	 * is loaded from the ConfigurationService, as YAML, and mapped into a Dictionary.
	 * 
	 * The model also holds application preferences that may be altered during application lifecycle.
	 * 
	 * @author	Vish Vishvanath
	 * @since	7 February 2011
	 */
	public final class ConfigurationModel extends Actor implements IConfigurationModel
	{
		protected var _configurationFilename:String = "configuration.yml";

		protected var _configuration:Dictionary;

		protected var _map:Map = new Map();

		public function ConfigurationModel()
		{
			super();
		}
		
		/**
		 * @inheritDoc
		 */
		public function get conf():Dictionary
		{
			return _configuration;
		}
		
		public function set conf( value:Dictionary ):void
		{
			_configuration = value;
		}

		/**
		 * @inheritDoc
		 */
		public function get configurationFilename():String
		{
			return _configurationFilename;
		}

		public function set configurationFilename( value:String ):void
		{
			_configurationFilename = value;
		}

		/**
		 * @inheritDoc
		 */
		public function getConfigurationById( id:String, restricted:Boolean = false ):*
		{
			warn( "You may be better off using the local space.restricted/unrestricted rather than" +
				" injecting a configuration model into your view or mediator" );
			switch( restricted )
			{
				case true:
					return conf.restricted[ id ];
					break;
				case false:
					return conf.unrestricted[ id ];
					break;
			}
		}
	}
}