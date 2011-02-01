package org.birdbase.framework.model
{
	import flash.utils.Dictionary;
	
	import org.robotlegs.mvcs.Actor;

	public class L10nYAMLModel extends Actor
	{
		private var _locale:String = "en_GB";

		protected var _map:Dictionary;
		
		private var _l10nFilename:String = "l10n.yml";

		public function L10nYAMLModel()
		{
			super();
		}
		
		public function get map():Dictionary
		{
			return _map;
		}
		
		public function set map( value:Dictionary ):void
		{
			_map = value;
		}

		public function get locale():String
		{
			return _locale;
		}

		public function set locale(value:String):void
		{
			_locale = value;
		}

		public function get l10nFilename():String
		{
			return _l10nFilename;
		}

		public function set l10nFilename(value:String):void
		{
			_l10nFilename = value;
		}

	}
}