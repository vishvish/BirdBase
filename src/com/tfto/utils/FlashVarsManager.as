package com.tfto.utils
{
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;

	/**
	 *	// TODO FlashVarsManager 
	 *	
	 *	// TODO @example 
	 *	
	 *	// TODO @exampleText 
	 *	
	 *	@author 	Vish Vishvanath
	 *	@email 		vish.vishvanath@gmail.com
	 *	@since 		11 January 2011
	 */
	public class FlashVarsManager extends Sprite
	{
		/**
		 *	// TODO FlashVarsManager 
		 */
		public function FlashVarsManager( contextView:DisplayObjectContainer )
		{
			super();
			contextView.addChild( this );
		}
		
		/**
		 *	// TODO Name 
		 */
		public function vars( varName:String ):*
		{
//			if( !this.loaderInfo )
//			{
//				return null;
//			}
			var result:* = this.loaderInfo.parameters[ varName ];
			if( !result )
			{
				return null;
			}
			else
			{
				return result;
			}
		}
	}
}