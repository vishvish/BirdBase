package org.birdbase.framework.model.lists
{
	import org.as3commons.collections.Map;
	import org.birdbase.framework.service.ITextUpdateable;
	
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
		public function addComponent( key:String, item:ITextUpdateable, ...args ):uint
		{
			try
			{
				
				if( item is ITextUpdateable )
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
		public function removeComponent( item:ITextUpdateable ):Boolean
		{
			if( item is ITextUpdateable && has( item ) )
			{
				return super.remove( item );
			}
			else
			{
				return false;
			}
		}
		
		private function createUpdateableComponent( item:ITextUpdateable, ...args ):IUpdateableTextComponent
		{
			trace( "createUpdateableComponent", item, args );
			return new UpdateableTextComponent( item, args );
		}
	}
}