package com.tfto.birdbase.controller.configuration
{
	import com.tfto.birdbase.controller.abstract.BirdbaseCommand;
	import com.tfto.birdbase.service.PreferencesService;
	
	/**
	 *	// TODO ConfigurePreferencesCommand 
	 *	
	 *	// TODO @example 
	 *	
	 *	// TODO @exampleText 
	 *	
	 *	@author 	Vish Vishvanath
	 *	@email 		vish.vishvanath@gmail.com
	 *	@since 		11 January 2011
	 */
	public class ConfigurePreferencesCommand extends BirdbaseCommand
	{
		[Inject]
		/**
		 *	// TODO ps 
		 */
		public var ps:PreferencesService;

		/**
		 *	// TODO ConfigurePreferencesCommand 
		 */
		public function ConfigurePreferencesCommand()
		{
			super();
		}
		
		/**
		 *	// TODO execute 
		 *	
		 *	@return void	
		 */
		override public function execute():void
		{
			logger.debug( "ConfigurePreferencesCommand::execute" );
		}
	}
}