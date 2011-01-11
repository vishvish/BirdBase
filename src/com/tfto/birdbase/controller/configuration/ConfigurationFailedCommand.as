package com.tfto.birdbase.controller.configuration
{
	import com.tfto.birdbase.controller.abstract.BirdbaseCommand;
	
	import org.robotlegs.mvcs.Command;
	
	/**
	 *	// TODO ConfigurationFailedCommand 
	 *	
	 *	// TODO @example 
	 *	
	 *	// TODO @exampleText 
	 *	
	 *	@author 	Vish Vishvanath
	 *	@email 		vish.vishvanath@gmail.com
	 *	@since 		11 January 2011
	 */
	public class ConfigurationFailedCommand extends BirdbaseCommand
	{
		/**
		 *	// TODO execute 
		 *	
		 *	@return void	
		 */
		override public function execute():void
		{
			logger.error( "ConfigurationFailedCommand::Configuration Failed" );
		}
	}
}