package org.birdbase.application.view
{
	import flash.display.Sprite;
	
	/**
	 *	// TODO LoadingUI 
	 *	
	 *	// TODO @example 
	 *	
	 *	// TODO @exampleText 
	 *	
	 *	@author 	Vish Vishvanath
	 *	@email 		vish.vishvanath@gmail.com
	 *	@since 		11 January 2011
	 */
	public class LoadingUI extends Sprite
	{
		/**
		 *	// TODO LoadingUI 
		 */
		public function LoadingUI()
		{
			super();
		}
		
		/**
		 *	// TODO beginLoading 
		 *	
		 *	@return void	
		 */
		public function beginLoading():void
		{
			trace( "Start Loading" );
		}
		
		/**
		 *	// TODO endLoading 
		 *	
		 *	@return void	
		 */
		public function endLoading():void
		{
			trace( "Loading Complete" );
		}
	}
}