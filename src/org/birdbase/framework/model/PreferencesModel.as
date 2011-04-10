package org.birdbase.framework.model
{
	import flash.utils.Dictionary;
	
	import org.as3commons.collections.Map;
	import org.as3commons.collections.framework.IMap;

	/**
	 * The basic application data model. Create, update, delete preferences.
	 *  
	 * @author	Vish Vishvanath
	 * @since	10 March 2011
	 * 
	 */
	public class PreferencesModel implements IPreferencesModel
	{
		protected var _map:IMap;
		
		public function PreferencesModel()
		{
			_map = new Map();
		}
		
		/**
		 * @inheritDoc
		 */
		public function getPreference( key:String ):*
		{
			try
			{
				if( _map.hasKey( key ) )
				{
					return _map.itemFor( key );
				}
			}
			catch( e:Error )
			{
				error( e.message );
			}
		}
		
		/**
		 * @inheritDoc
		 */
		public function setPreference( key:String, item:*, pOverride:Boolean = true ):void
		{
//			notice( "Setting " + key + "(" + item + ") Into preferences. " ); 
			try
			{
				if( pOverride )
				{
					if( _map.hasKey( key ) )
					{
						_map.removeKey( key );
					}
				}
				_map.add( key, item );
			}
			catch( e:Error )
			{
				error( e.message );
			}
		}
		
		/**
		 * @inheritDoc
		 */
		public function clearPreference( key:String ):void
		{
			if( _map.hasKey( key ) )
			{
				_map.removeKey( key );
			}
		}

		/**
		 * @inheritDoc
		 */
		public function setValues( d:Dictionary ):void
		{
			for( var key:String in d )
			{
				setPreference( key, d[ key ] );
			}
		}
	}
}