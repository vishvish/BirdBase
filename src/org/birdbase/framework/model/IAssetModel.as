package org.birdbase.framework.model
{
	import org.birdbase.support.utils.IInit;

	/**
	 * Describes a model class which holds design/media assets mapped to keys.
	 *  
	 * @author	Vish Vishvanath
	 * @since	31 March 2011
	 */
	public interface IAssetModel extends IInit
	{
		/**
		 * Retrieves asset by its key or id.
		 *  
		 * @param id
		 * @return 
		 */
		function getAssetById( id:String ):*;
	}
}