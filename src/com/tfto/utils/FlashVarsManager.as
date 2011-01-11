package com.tfto.utils
{
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
		 *	// TODO _instance 
		 */
		private static var _instance:FlashVarsManager;
		
		/**
		 *	// TODO FlashVarsManager 
		 */
		public function FlashVarsManager()
		{
			super();
		}
		
		/**
		 *	// TODO getInstance 
		 *	
		 *	@return FlashVarsManager	
		 */
		public static function getInstance():FlashVarsManager
		{
			if( _instance )
			{
				return _instance;
			}
			else
			{
				_instance = new FlashVarsManager();
				return _instance;
			}
		}
		
		/**
		 *	// TODO Name 
		 */
		public function vars( varName:String ):*
		{
			if( !this.loaderInfo )
			{
				return null;
			}
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