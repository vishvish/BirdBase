package org.birdbase.framework.model
{
	import org.as3commons.collections.Map;
	import org.as3commons.logging.ILogger;
	import org.robotlegs.mvcs.Actor;
	
	public class ApplicationModel extends Actor
	{
		[Inject]
		public var logger:ILogger;

		private var _map:Map = new Map();
		
		public function ApplicationModel()
		{
			super();
		}
		
		public function addParameter( key:String, item:*, override:Boolean = true ):void
		{
			if( override )
			{
				if( _map.hasKey( key ) )
				{
					_map.removeKey( key );
				}
			}
			logger.debug( [ "ApplicationModel::addParameter", key, item, _map.add( key, item ), _map.size ].toString() );
		}
		
		public function get map():Map
		{
			return _map;
		}
	}
}