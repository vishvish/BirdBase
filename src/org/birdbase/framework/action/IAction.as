package org.birdbase.framework.action
{
	/**
	 * Describes an Action object - a call to action. Actions wrap around destinations, or desired effects, if you
	 * like.
	 *	
	 * @author	Vish Vishvanath
	 * @since 	22 February 2011
	 */
	public interface IAction
	{
		/**
		 * A destination target, or desired action.
		 *  
		 * @return 
		 */		
		function get destination():String;

		function set destination( value:String ):void;

		/**
		 * The text for the visible label.
		 *  
		 * @return 
		 */
		function get label():String;

		function set label( value:String ):void;
	}
}