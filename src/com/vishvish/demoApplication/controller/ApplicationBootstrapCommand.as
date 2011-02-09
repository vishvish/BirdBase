package com.vishvish.demoApplication.controller
{
	import com.vishvish.demoApplication.view.MainContainerView;
	
	import org.as3commons.logging.ILogger;
	import org.birdbase.framework.controller.configuration.ConfigureStateMachineCommand;
	import org.birdbase.framework.controller.state.ApplicationStateChangedCommand;
	import org.birdbase.framework.model.BootstrapModel;
	import org.birdbase.framework.utils.swfaddress.SWFAddress;
	import org.osflash.signals.Signal;
	import org.robotlegs.mvcs.SignalCommand;
	import org.robotlegs.utilities.statemachine.StateEvent;

	/**
	 *	ApplicationBootstrapCommand is a point of contact between the BirdBase framework and the application.
	 *	BirdBase will execute this command once configuration and localized strings are loaded and all other framework
	 *	commands have been run to support the application.
	 *	
	 *	@author 	Vish Vishvanath
	 *	@email 		vish.vishvanath@gmail.com
	 *	@since 		11 January 2011
	 */
	public class ApplicationBootstrapCommand extends SignalCommand
	{
		[Inject]
		public var logger:ILogger;
		
		[Inject]
		public var pm:org.birdbase.framework.model.BootstrapModel;
		
		[Inject]
		public var swfAddress:SWFAddress;
		
		/**
		 * @inherit 
		 */
		override public function execute():void
		{
			logger.info( "Birdbase --> Application / ApplicationBootstrapCommand::Booting..." );
			eventDispatcher.dispatchEvent( new StateEvent( StateEvent.ACTION, ConfigureStateMachineCommand.BOOT_APPLICATION_COMPLETE ) );
			
			var view:MainContainerView = new MainContainerView();
			
			contextView.addChild( view );
			
			var s:Signal = new Signal();
			s.add( function():void 
			{
				signalCommandMap.mapSignal( swfAddress.change, ApplicationStateChangedCommand );
			});
			
			view.show( s );
		}
	}
}