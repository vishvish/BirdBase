package org.birdbase.framework.model
{
	import org.as3commons.collections.Map;
	import org.as3commons.logging.ILogger;
	import org.robotlegs.mvcs.Actor;
	
	public class ApplicationModel extends Actor
	{
		[Inject(name="birdbase")]
		public var logger:ILogger;

		private var _map:Map = new Map();
		
		public function ApplicationModel()
		{
			super();
		}
		
		/**
		 * Adds a data parameter to the model.
		 *  
		 * @param key
		 * @param item
		 * @param override
		 * 
		 */
		public function addParameter( key:String, item:*, override:Boolean = true ):void
		{
			try
			{
				if( override )
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
				logger.error( e.message );
			}
			finally
			{
				logger.debug( [ "ApplicationModel::addParameter", key, item, _map.size ].toString() );
			}
		}
		
		public function get map():Map
		{
			return _map;
		}
	}
}