package com.vishvish.demoApplication.controller
{
	import org.as3commons.logging.ILogger;
	import com.vishvish.demoApplication.controller.state.ApplicationStateChangedCommand;
	import com.vishvish.demoApplication.view.MainContainerView;
	import org.birdbase.framework.controller.AppConfigStateConstants;
	import org.birdbase.framework.model.PreferencesModel;
	import org.birdbase.framework.utils.swfaddress.SWFAddress;
	import org.osflash.signals.Signal;
	import org.robotlegs.mvcs.SignalCommand;
	import org.robotlegs.utilities.statemachine.StateEvent;

	/**
	 *	// TODO ApplicationBootstrapCommand 
	 *	
	 *	// TODO @example 
	 *	
	 *	// TODO @exampleText 
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
		public var pm:PreferencesModel;
		
		[Inject]
		public var swfAddress:SWFAddress;
		
		/**
		 *	// TODO execute 
		 *	
		 *	@return void	
		 */
		override public function execute():void
		{
			logger.info( "ApplicationBootstrapCommand::execute" );
			logger.info( "Birdbase is handing control over to the Application: Booting..." );
			eventDispatcher.dispatchEvent( new StateEvent( StateEvent.ACTION, AppConfigStateConstants.BOOT_APPLICATION_COMPLETE ) );
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