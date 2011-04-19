package org.birdbase.framework.service.text
{

	/**
	 *	IUpdateableTextListComponent TODO
	 *	
	 *	@example TODO
	 *	
	 *	@exampleText TODO
	 *	
	 *	@author 	Vish Vishvanath
	 *	@email 		vish.vishvanath@gmail.com
	 *	@since 		22 February 2011
	 */
	public interface IUpdateableTextComponent
	{
		
		/**
		 *	getitem TODO
		 *	
		 *	@return TODO
		 */
		function get item():IHaveUpdateableText;

		/**
		 *	setitem TODO
		 *	
		 *	@param value - TODO
		 *	
		 *	@return TODO
		 */
		function set item( value:IHaveUpdateableText ):void;

		/**
		 *	getargs TODO
		 *	
		 *	@return TODO
		 */
		function get args():Array;

		/**
		 *	setargs TODO
		 *	
		 *	@param value - TODO
		 *	
		 *	@return TODO
		 */
		function set args( value:Array ):void;
	}
}