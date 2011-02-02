package org.birdbase.framework.controller.configuration
{
	import org.as3commons.logging.ILogger;
	import org.birdbase.framework.controller.assets.UpdateDynamicLibraryCommand;
	import org.birdbase.framework.signals.UpdateDynamicLibrary;
	import org.robotlegs.mvcs.SignalCommand;
	import org.robotlegs.utilities.statemachine.StateEvent;
	
	/**
	 *	// TODO ConfigureCommandsCommand 
	 *	
	 *	// TODO @example 
	 *	
	 *	// TODO @exampleText 
	 *	
	 *	@author 	Vish Vishvanath
	 *	@email 		vish.vishvanath@gmail.com
	 *	@since 		11 January 2011
	 */
	public class ConfigureCommandsCommand extends SignalCommand
	{
		[Inject]
		public var logger:ILogger;
		
		/**
		 *	// TODO ConfigureCommandsCommand 
		 */
		public function ConfigureCommandsCommand()
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
			logger.debug( "ConfigureCommandsCommand::execute" );
			
			signalCommandMap.mapSignalClass( UpdateDynamicLibrary, UpdateDynamicLibraryCommand );

			eventDispatcher.dispatchEvent( new StateEvent( StateEvent.ACTION, ConfigureStateMachineCommand.CONFIGURE_COMMANDS_COMPLETE ) );
		}
	}
}