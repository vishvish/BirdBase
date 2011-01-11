package com.tfto.birdbase.model
{
	/**
	 *	// TODO L10nModel 
	 *	
	 *	// TODO @example 
	 *	
	 *	// TODO @exampleText 
	 *	
	 *	@author 	Vish Vishvanath
	 *	@email 		vish.vishvanath@gmail.com
	 *	@since 		11 January 2011
	 */
	public class L10nModel extends ApplicationModel
	{
		/**
		 *	// TODO _l10nFilename 
		 */
		private var _l10nFilename:String = "l10n.properties";

		/**
		 *	// TODO L10nModel 
		 */
		public function L10nModel()
		{
			super();
		}
		
		/**
		 * l10nFilename // TODO 
		 */
		public function get l10nFilename():String
		{
			return _l10nFilename;
		}
		
		/**
		 * @private
		 */
		public function set l10nFilename( value:String ):void
		{
			_l10nFilename = value;
		}
		
	}
}