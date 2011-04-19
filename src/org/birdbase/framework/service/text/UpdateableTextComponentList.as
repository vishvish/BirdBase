package org.birdbase.framework.service.text
{
	import org.as3commons.collections.Map;
	
	/**
	 *	This list maps text-containing components to the id keys of the strings they are interested in displaying.
	 *  
	 *	@author	Vish Vishvanath
	 * 	@since	13 February 2011
	 * 
	 */
	public class UpdateableTextComponentList extends Map
	{
		/**
		 *	UpdateableTextComponentList TODO
		 */
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
		public function addComponent( key:String, item:IHaveUpdateableText, ...args ):uint
		{
			try
			{
				
				if( item is IHaveUpdateableText )
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
		public function removeComponent( item:IHaveUpdateableText ):Boolean
		{
			if( item is IHaveUpdateableText && has( item ) )
			{
				return super.remove( item );
			}
			else
			{
				return false;
			}
		}
		
		/**
		 *	createUpdateableComponent TODO
		 *	
		 *	@param item 
		 *	@param ...args 
		 *	
		 *	@return IUpdateableTextListComponent	
		 */
		private function createUpdateableComponent( item:IHaveUpdateableText, ...args ):IUpdateableTextComponent
		{
			return new UpdateableTextComponent( item, args );
		}
	}
}