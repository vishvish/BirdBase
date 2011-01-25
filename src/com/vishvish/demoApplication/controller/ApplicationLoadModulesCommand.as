package com.vishvish.demoApplication.controller
{
	import org.as3commons.logging.ILogger;
	import org.birdbase.framework.controller.AppConfigStateConstants;
	import org.robotlegs.mvcs.SignalCommand;
	import org.robotlegs.utilities.statemachine.StateEvent;
	
	public class ApplicationLoadModulesCommand extends SignalCommand
	{
		[Inject]
		public var logger:ILogger;

		public function ApplicationLoadModulesCommand()
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
			logger.info( "ApplicationLoadModulesCommand::execute" );
			
			// ADD MODULES HERE
			
//			var mcm:ModuleCommandMap = new ModuleCommandMap( this.eventDispatcher, this.injector, this.

			eventDispatcher.dispatchEvent( new StateEvent( StateEvent.ACTION, AppConfigStateConstants.BOOT_APPLICATION_MODULES_COMPLETE ) );
		}
	}
}