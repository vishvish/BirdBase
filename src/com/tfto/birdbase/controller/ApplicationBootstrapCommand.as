package com.tfto.birdbase.controller
{
	import com.tfto.birdbase.controller.state.ApplicationStateChangedCommand;
	import com.tfto.birdbase.model.PreferencesModel;
	import com.tfto.birdbase.view.MainUI;
	
	import org.as3commons.logging.ILogger;
	import org.osflash.signals.Signal;
	import org.robotlegs.mvcs.SignalCommand;
	
	import swfaddress.SWFAddress;

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
		/**
		 *	// TODO logger 
		 */
		public var logger:ILogger;
		
		[Inject]
		/**
		 *	// TODO pm 
		 */
		public var pm:PreferencesModel;
		
		[Inject]
		/**
		 *	// TODO swfAddress 
		 */
		public var swfAddress:SWFAddress;
		
		/**
		 *	// TODO execute 
		 *	
		 *	@return void	
		 */
		override public function execute():void
		{
			logger.debug( "ApplicationStartupCommand::execute" );
			
			logger.info( "Application Booting..." );
			logger.info( "Author: " + pm.getProperty( "application.author" ) );
			logger.info( "Version: " + pm.getProperty( "application.version" ) );
			
			var view:MainUI = new MainUI();
			contextView.addChild( view );
			var s:Signal = new Signal();
			s.add( function():void 
			{
				signalCommandMap.mapSignal( swfAddress.change, ApplicationStateChangedCommand );
			}
			);
			view.show( s );	
		}
		
	}
}