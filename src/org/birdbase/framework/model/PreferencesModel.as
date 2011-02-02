package org.birdbase.framework.model
{
	import flash.utils.Dictionary;
	
	import org.robotlegs.mvcs.Actor;
	
	public class PreferencesModel extends Actor
	{
		private var _locale:String = "en_GB";
		
		protected var _map:Dictionary;
		
		private var _preferencesFileName:String = "config.yml";
		
		public function PreferencesModel()
		{
			super();
		}
				
		public function getPreference( key:String ):*
		{
			return _map[ key ];
		}
		
		public function setPreference( key:String, value:* ):void
		{
			_map[ key ] = value;
		}
		
		public function get locale():String
		{
			return _locale;
		}
		
		public function set locale(value:String):void
		{
			_locale = value;
		}
		
		public function get assetBasePath():String
		{
			var result:String = "assets/" + this.locale + "/";
			return result;
		}
		
		/**
		 * preferencesFileName // TODO 
		 */
		public function get preferencesFileName():String
		{
			return _preferencesFileName;
		}
		
		/**
		 * @private
		 */
		public function set preferencesFileName( value:String ):void
		{
			_preferencesFileName = value;
		}

		public function loadPreferences( map:Dictionary ):void
		{
			if( !_map )
			{
				_map = map
			}
			else
			{
				throw new Error( "Cannot load preferences more than once" );
			}
		}
	}
}