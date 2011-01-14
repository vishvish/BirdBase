package org.birdbase.application.controller
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
			
//			var slideshowContext:SlideshowContext = new SlideshowContext( contextView, injector );
//			injector.mapValue( SlideshowContext, slideshowContext );
			
			eventDispatcher.dispatchEvent( new StateEvent( StateEvent.ACTION, AppConfigStateConstants.BOOT_APPLICATION_MODULES_COMPLETE ) );
		}
	}
}