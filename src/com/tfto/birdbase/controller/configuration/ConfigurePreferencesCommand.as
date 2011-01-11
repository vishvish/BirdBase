package com.tfto.birdbase.controller.configuration
{
	import com.tfto.birdbase.controller.AppConfigStateConstants;
	import com.tfto.birdbase.service.PreferencesService;
	
	import org.robotlegs.mvcs.Command;
	import org.robotlegs.utilities.statemachine.StateEvent;
	import com.tfto.birdbase.controller.abstract.BirdbaseCommand;
	
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