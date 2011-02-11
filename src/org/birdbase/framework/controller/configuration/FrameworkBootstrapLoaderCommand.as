package org.birdbase.framework.controller.configuration
{
	import org.birdbase.framework.controller.abstract.BirdbaseCommand;
	import org.birdbase.framework.service.BootstrapService;
	
	/**
	 *	// TODO FrameworkBootstrapLoaderCommand 
	 *	
	 *	// TODO @example 
	 *	
	 *	// TODO @exampleText 
	 *	
	 *	@author 	Vish Vishvanath
	 *	@email 		vish.vishvanath@gmail.com
	 *	@since 		11 January 2011
	 */
	public class FrameworkBootstrapLoaderCommand extends BirdbaseCommand
	{
		[Inject]
		public var ps:BootstrapService;

		/**
		 *	// TODO ConfigurePreferencesCommand 
		 */
		public function FrameworkBootstrapLoaderCommand()
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
			logger.debug( "FrameworkBootstrapLoaderCommand::execute" );
		}
	}
}