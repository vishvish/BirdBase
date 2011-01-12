package com.tfto.birdbase.controller.configuration
{
	import com.tfto.birdbase.controller.AppConfigStateConstants;
	import com.tfto.birdbase.controller.assets.UpdateDynamicLibraryCommand;
	import com.tfto.birdbase.controller.state.ChangeApplicationStateCommand;
	import com.tfto.birdbase.signals.ModifyApplicationState;
	import com.tfto.birdbase.signals.UpdateDynamicLibrary;
	
	import org.as3commons.logging.ILogger;
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
			// maps a signal for SWFAddress
			signalCommandMap.mapSignalClass( ModifyApplicationState, ChangeApplicationStateCommand );
			

			eventDispatcher.dispatchEvent( new StateEvent( StateEvent.ACTION, AppConfigStateConstants.CONFIGURE_COMMANDS_COMPLETE ) );
		}
	}
}