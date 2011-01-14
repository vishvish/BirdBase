package org.birdbase.framework.controller.configuration
{
	import org.birdbase.framework.controller.abstract.BirdbaseCommand;
	import org.birdbase.framework.service.L10nService;
	
	/**
	 *	// TODO ConfigureLocalizationCommand 
	 *	
	 *	// TODO @example 
	 *	
	 *	// TODO @exampleText 
	 *	
	 *	@author 	Vish Vishvanath
	 *	@email 		vish.vishvanath@gmail.com
	 *	@since 		11 January 2011
	 */
	public class ConfigureLocalizationCommand extends BirdbaseCommand
	{
		[Inject]
		/**
		 *	// TODO l10 
		 */
		public var l10:L10nService;
		
		/**
		 *	// TODO ConfigureLocalizationCommand 
		 */
		public function ConfigureLocalizationCommand()
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
			logger.debug( "ConfigureLocalizationCommand::execute" );
		}
	}
}