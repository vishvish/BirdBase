package org.birdbase.framework.model.lists
{
	import org.as3commons.collections.Map;
	import org.birdbase.framework.service.ITextUpdatable;
	
	/**
	 *	This list maps text-containing components to the id keys of the strings they are interested in displaying.
	 *  
	 *	@author	Vish Vishvanath
	 * 	@since	13 February 2011
	 * 
	 */
	public class UpdatableTextComponentList extends Map
	{
		public function UpdatableTextComponentList()
		{
			super();
		}
		
		/**
		 *	Add an ITextUpdatable component to the list, identified by its key.
		 * 
		 * 	@param	key
		 * 	@param	item
		 * 	@return 
		 * 
		 */
		public function addComponent( key:String, item:ITextUpdatable ):uint
		{
			try
			{
				if( item is ITextUpdatable )
				{
					super.add( key, item );
					return _size;
				}
				else
				{
					throw new Error( "UpdatableTextComponentList::add --> You cannot add an item that does not implement ITextUpdatable to this list" );
				}
			}
			catch( e:Error )
			{
				//
			}
			finally
			{
				return size;
			}
		}
		
		/**
		 *	Add an ITextUpdatable component to the list, identified by itself.
		 * 
		 * 	@param	item
		 * 	@return 
		 * 
		 */
		public function removeComponent( item:ITextUpdatable ):Boolean
		{
			if( item is ITextUpdatable && has( item ) )
			{
				return super.remove( item );
			}
			else
			{
				return false;
			}
		}
	}
}