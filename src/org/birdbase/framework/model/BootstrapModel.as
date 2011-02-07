package org.birdbase.framework.model
{
	import flash.utils.Dictionary;
	
	import org.robotlegs.mvcs.Actor;
	
	/**
	 * The BootstrapModel holds all the information for booting the application. 
	 * Information is loaded in via the BootstrapService.
	 * 
	 * @author Vish Vishvanath
	 * @since 7 February 2011
	 */
	public final class BootstrapModel extends Actor
	{
		protected var _locale:String = "en_GB";
		
		protected var _map:Dictionary;
		
		protected var _bootstrapFilename:String = "bootstrap.yml";
		
		public function BootstrapModel()
		{
			super();
		}
				
		public function getPreference( key:String ):*
		{
			return _map[ key ];
		}
		
		public function get locale():String
		{
			return _locale;
		}
		
		public function set locale( value:String ):void
		{
			_locale = value;
		}
		
		public function get assetBasePath():String
		{
			var result:String = "assets/" + this.locale + "/";
			return result;
		}
		
		public function get bootstrap():String
		{
			return _bootstrapFilename;
		}
		
		public function set bootstrap( value:String ):void
		{
			_bootstrapFilename = value;
		}

		public function load( map:Dictionary ):void
		{
			if( !_map )
			{
				_map = map
			}
			else
			{
				throw new Error( "Cannot load bootstrap more than once" );
			}
		}
	}
}