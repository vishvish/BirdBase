package com.vishvish.demoApplication.controller
{
	import org.as3commons.logging.ILogger;
	import org.birdbase.framework.controller.configuration.ConfigureStateMachineCommand;
	import org.robotlegs.mvcs.SignalCommand;
	import org.robotlegs.utilities.statemachine.StateEvent;
	
	/**
	 *	ApplicationLoadModulesCommand is a point of contact between the BirdBase framework and the application.
	 *	BirdBase will execute this command once ApplicationBootstrapCommand has executed.
	 * 
	 *	@author 	Vish Vishvanath
	 *	@email 		vish.vishvanath@gmail.com
	 *	@since 		11 January 2011
	 */
	public class ApplicationLoadModulesCommand extends SignalCommand
	{
		[Inject]
		public var logger:ILogger;

		public function ApplicationLoadModulesCommand()
		{
			super();
		}

		/**
		 *	@inherit 
		 */
		override public function execute():void
		{
			logger.info( "ApplicationLoadModulesCommand::execute" );
			eventDispatcher.dispatchEvent( new StateEvent( StateEvent.ACTION, ConfigureStateMachineCommand.BOOT_APPLICATION_MODULES_COMPLETE ) );
		}
	}
}