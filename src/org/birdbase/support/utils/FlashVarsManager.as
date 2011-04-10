package org.birdbase.support.utils
{
	import flash.display.DisplayObject;
	
	import com.ffsys.core.AbstractFlashVars;
	
	/**
	* 	Manages the flash variables for the application.
	*/
	dynamic public class FlashVarsManager extends AbstractFlashVars
	{
		private var _bootstrap:String;
		private var _configuration:String;
		private var _locale:String;
		
		/**
		* 	Creates a <code>FlashVarsManager</code> instance.
		* 
		* 	@param root The root of the display list hierarchy
		* 	for the application.
		*/
		public function FlashVarsManager( root:DisplayObject )
		{
			super( root );
		}
		
		/**
		* 	An alternative path to the main bootstrap document.
		*/
		public function get bootstrap():String
		{
			return _bootstrap;
		}
		
		public function set bootstrap( value:String ):void
		{
			_bootstrap = value;
		}
		
		/**
		* 	An alternative path to the main configuration file.
		*/
		public function get configuration():String
		{
			return _configuration;
		}
		
		public function set configuration( value:String ):void
		{
			_configuration = value;
		}
		
		/**
		* 	The current locale for the application.
		*/
		public function get locale():String
		{
			return _locale;
		}
		
		public function set locale( value:String ):void
		{
			_locale = value;
		}
	}
}