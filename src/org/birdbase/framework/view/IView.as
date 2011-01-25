package org.birdbase.framework.view
{
	import org.osflash.signals.Signal;
	
	/**
	 *	// TODO IView 
	 *	
	 *	// TODO @example 
	 *	
	 *	// TODO @exampleText 
	 *	
	 *	@author 	Vish Vishvanath
	 *	@email 		vish.vishvanath@gmail.com
	 *	@since 		11 January 2011
	 */
	public interface IView
	{
		/**
		 *	// TODO main 
		 *	
		 *	// TODO @return 
		 */
		function main():void;
		/**
		 *	// TODO show 
		 *	
		 *	// TODO @param signal - 
		 *	
		 *	// TODO @return 
		 */
		function show(signal:Signal):void;
		/**
		 *	// TODO hide 
		 *	
		 *	// TODO @param signal - 
		 *	
		 *	// TODO @return 
		 */
		function hide(signal:Signal):void;		
	}
}