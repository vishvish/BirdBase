package com.tfto.birdbase.model
{
	/**
	 *	// TODO PreferencesModel 
	 *	
	 *	// TODO @example 
	 *	
	 *	// TODO @exampleText 
	 *	
	 *	@author 	Vish Vishvanath
	 *	@email 		vish.vishvanath@gmail.com
	 *	@since 		11 January 2011
	 */
	public class PreferencesModel extends ApplicationModel
	{
		/**
		 *	// TODO _preferencesFileName 
		 */
		private var _preferencesFileName:String = "preferences.properties";
		
		/**
		 *	// TODO PreferencesModel 
		 */
		public function PreferencesModel()
		{
			super();
		}

		/**
		 * preferencesFileName // TODO 
		 */
		public function get preferencesFileName():String
		{
			return _preferencesFileName;
		}

		/**
		 * @private
		 */
		public function set preferencesFileName( value:String ):void
		{
			_preferencesFileName = value;
		}

	}
}