package org.birdbase.framework.controller.core
{
	import org.birdbase.framework.service.*;
	import org.robotlegs.mvcs.Command;
	
	/**
	 * The services comand holds the IConfigurationService as a DI and by virtue of this, instantiates the concrete
	 * class ConfigurationService.
	 *  
	 * @author	Vish Vishvanath
	 * @since	31 March 2011
	 */
	public class D_Services extends Command
	{
		[Inject]
		public var configurationService:IConfigurationService;
		
		public function D_Services()
		{
			super();
		}
		
		/**
		 * @inheritDoc
		 */
		override public function execute():void
		{
			status();
			onComplete();
		}
		
		private function onComplete():void
		{
			// IConfigurationService fires complete event
		}
	}
}