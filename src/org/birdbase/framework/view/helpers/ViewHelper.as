package org.birdbase.framework.view.helpers
{
	import flash.utils.Dictionary;
	
	import org.as3commons.lang.ClassUtils;
	import org.birdbase.framework.model.*;
	import org.birdbase.framework.view.IView;

	public class ViewHelper
	{
		[Inject]
		public var pm:BootstrapModel;
		
		[Inject]
		public var navigationModel:NavigationModel;
		
		[Inject]
		public var configurationModel:ConfigurationModel;
		
		public function get externalLinks():Dictionary
		{
			return configurationModel.conf.external_links as Dictionary;
		}
		
		public function get navigation():Array
		{
			return navigationModel.navigation;
		}

		public function get nav():*
		{
			return configurationModel.conf.nav;
		}
		
		public function getView( name:String ):IView
		{
			var viewRef:Class = navigationModel.getView( name );
			return ClassUtils.newInstance( viewRef );
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