package com.vishvish.demoApplication.model
{
	import org.as3commons.collections.Map;
	import org.birdbase.framework.model.BirdbaseApplicationModel;
	
	public final class ApplicationModel extends BirdbaseApplicationModel
	{
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
			trace( "ApplicationModel::addParameter", key, item, _map.add( key, item ), _map.size );
		}
		
		public function get map():Map
		{
			return _map;
		}
	}
}