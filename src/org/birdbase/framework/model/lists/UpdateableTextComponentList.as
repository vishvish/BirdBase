package org.birdbase.framework.model.lists
{
	import org.as3commons.collections.Map;
	import org.birdbase.framework.service.ITextIsUpdateable;
	
	/**
	 *	This list maps text-containing components to the id keys of the strings they are interested in displaying.
	 *  
	 *	@author	Vish Vishvanath
	 * 	@since	13 February 2011
	 * 
	 */
	public class UpdateableTextComponentList extends Map
	{
		public function UpdateableTextComponentList()
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
		public function addComponent( key:String, item:ITextIsUpdateable, ...args ):uint
		{
			try
			{
				
				if( item is ITextIsUpdateable )
				{
					super.add( key, createUpdateableComponent( item ) );
					return _size;
				}
				else
				{
					throw new Error( "UpdateableTextComponentList::add --> You cannot add an item that does not implement ITextUpdateable to this list" );
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
		public function removeComponent( item:ITextIsUpdateable ):Boolean
		{
			if( item is ITextIsUpdateable && has( item ) )
			{
				return super.remove( item );
			}
			else
			{
				return false;
			}
		}
		
		private function createUpdateableComponent( item:ITextIsUpdateable, ...args ):IUpdateableTextListComponent
		{
			return new UpdateableTextListComponent( item, args );
		}
	}
}