package com.vishvish.demoApplication.helpers
{
	import flash.utils.Dictionary;
	
	import org.birdbase.framework.model.*;

	public class ViewHelper
	{
		[Inject]
		public var pm:PreferencesModel;
		
		[Inject]
		public var l10n:L10nModel;
		
		public function ViewHelper()
		{
		}
		
		public function get externalLinks():Dictionary
		{
			return l10n.map.external_links as Dictionary;
		}
		
		public function get navigation():Array
		{
			return l10n.map.nav as Array;
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