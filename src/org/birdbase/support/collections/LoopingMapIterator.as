package org.birdbase.support.collections
{
	import org.as3commons.collections.Map;
	import org.as3commons.collections.framework.core.MapIterator;
	
	/**
	 * A looping iterator which extends the as3-collections class and provides a better interface
	 * to getting the next and previous items from a Map.
	 * 
	 * @author	Vish Vishvanath
	 * @since	23 March 2011
	 */
	public class LoopingMapIterator extends MapIterator
	{
		protected var _currentIndex:Number = 0;
		
		public function LoopingMapIterator( map:Map )
		{
			super( map );
		}
		
		/**
		 * The number of items in the map. 
		 * @return 
		 * 
		 */
		public function size():Number
		{
			return this._map.size;
		}
		
		/**
		 * Returns the item for a specified key.
		 *  
		 * @param id
		 * @return 
		 * 
		 */
		public function getItemById( id:* ):*
		{
			if( _map.hasKey( id ) )
			{
				_currentIndex = _map.keysToArray().indexOf( id );
				return _map.itemFor( id );
			}
			else
			{
				return null;
			}
		}
		
		/**
		 * Returns the key at the current index.
		 *  
		 * @return 
		 * 
		 */
		public function getCurrentKey():*
		{
			return _map.keysToArray()[ _currentIndex ];
		}
		
		/**
		 * Previous item.
		 *  
		 * @return 
		 * 
		 */
		public function get previousItem():*
		{
			_currentIndex --;

			if( _currentIndex < 0 )
			{
				_currentIndex = mapArray.length - 1;
			}
			
			return mapArray[ _currentIndex ];
		}
		
		/**
		 * Next item.
		 *  
		 * @return 
		 * 
		 */
		public function get nextItem():*
		{
			_currentIndex ++;
			
			if( _currentIndex > mapArray.length - 1 )
			{
				_currentIndex = 0;
			}
			
			return mapArray[ _currentIndex ];
		}
		
		protected function get mapArray():Array
		{
			return _map.toArray();
		}
			
	}
}