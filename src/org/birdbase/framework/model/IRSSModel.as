package org.birdbase.framework.model
{
	/**
	 * Describes a model class which holds RSS Feed Data.
	 *  
	 * @author	Vish Vishvanath
	 * @since	31 March 2011
	 */	
	public interface IRSSModel
	{
		/**
		 * Loads a feed from a given URL.
		 *  
		 * @param uri
		 * @param callback
		 */
		function loadFeed( uri:String, callback:Function ):void;
	}
}