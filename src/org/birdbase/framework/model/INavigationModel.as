package org.birdbase.framework.model
{

	/**
	 * Describes a model which stores definitions about the application structure and maps views to their names.
	 *  
	 * @author	Vish Vishvanath
	 * @since	31 March 2011
	 */
	public interface INavigationModel extends IModel
	{
		/**
		 * Returns a concrete class for a given view name.
		 * 
		 * @param destination
		 * @return 
		 */
		function getViewForDestination( destination:String ):Class;
		
		/**
		 * Returns the string name for a given class.
		 *  
		 * @param view
		 * @return 
		 */
		function getDestinationForView( view:Class ):Array;

		/**
		 * All the navigation items.
		 *  
		 * @return 
		 */
		function get navigationArray():Array;
		function set navigationArray( value:Array ):void;

		/**
		 * Shortcut helper method.
		 * 
		 * @deprecated
		 * 
		 * @param name
		 * @return 
		 */
		function _get( name:String ):*;
	}
}