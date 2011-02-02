package org.birdbase.framework.helpers
{
	import flash.utils.Dictionary;
	
	import org.birdbase.framework.model.L10nModel;
	import org.birdbase.framework.model.PreferencesModel;

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
	}
}