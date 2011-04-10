package org.birdbase.framework.view
{
	/**
	 *	Describes a view that will integrate into both BirdBase and the AS3-Navigator. 
	 *	
	 *	@author 	Vish Vishvanath
	 *	@email 		vish.vishvanath@gmail.com
	 *	@since 		11 January 2011
	 */
	public interface ITransitioningView
	{
		/**
		 * Main methods called by mediator to build the visuals. 
		 */
		function main():void;
		
		/**
		 * Show function with a callback in the argument.
		 *  
		 * @param f
		 */
		function show( f:Function ):void;
		
		/**
		 * Hide function with a callback in the argument. 
		 * @param f
		 */
		function hide( f:Function ):void;
		
		/**
		 * Cleanup of view and its children. 
		 */
		function cleanup():void;
	}
}