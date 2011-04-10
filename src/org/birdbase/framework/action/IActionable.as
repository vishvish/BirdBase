package org.birdbase.framework.action
{
	/**
	 *	IActionable TODO
	 *	
	 *	@example TODO
	 *	
	 *	@exampleText TODO
	 *	
	 *	@author 	Vish Vishvanath
	 *	@email 		vish.vishvanath@gmail.com
	 *	@since 		22 February 2011
	 */
	public interface IActionable
	{
		/**
		 *	getaction TODO
		 *	
		 *	@return TODO
		 */
		function get action():IAction;
		
		/**
		 *	setaction TODO
		 *	
		 *	@param value - TODO
		 *	
		 *	@return TODO
		 */
		function set action( value:IAction ):void;
	}
}