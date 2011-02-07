package org.birdbase.framework.view.helpers
{
	import flash.utils.Dictionary;
	
	import org.birdbase.framework.model.*;

	public class ViewHelper
	{
		[Inject]
		public var pm:BootstrapModel;
		
		[Inject]
		public var cm:ConfigurationModel;
		
		public function get externalLinks():Dictionary
		{
			return cm.conf.external_links as Dictionary;
		}
		
		public function get navigation():Array
		{
			return cm.conf.nav as Array;
		}
		
		/**
		 * A helper function that return the localized string.
		 * 
		 * TODO: Figure out how we're going to deal with context.
		 * 
		 * TODO: Should traverse the YAML and return the first string for the key.
		 *  
		 * @param key
		 * @return 
		 * 
		 */
		public function gettext( key:String ):String
		{
			return "";
		}
	}
}