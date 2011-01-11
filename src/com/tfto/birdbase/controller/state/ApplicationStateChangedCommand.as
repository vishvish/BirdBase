package com.tfto.birdbase.controller.state
{
	import com.tfto.birdbase.model.ApplicationModel;
	import com.tfto.birdbase.model.ViewStateModel;
	
	import org.as3commons.logging.ILogger;
	import org.robotlegs.mvcs.SignalCommand;
	
	import swfaddress.SWFAddress;

	/**
	 *	// TODO ApplicationStateChangedCommand 
	 *	
	 *	// TODO @example 
	 *	
	 *	// TODO @exampleText 
	 *	
	 *	@author 	Vish Vishvanath
	 *	@email 		vish.vishvanath@gmail.com
	 *	@since 		11 January 2011
	 */
	public class ApplicationStateChangedCommand extends SignalCommand
	{
		[Inject]
		/**
		 *	// TODO logger 
		 */
		public var logger:ILogger;
		
		[Inject]
		/**
		 *	// TODO viewState 
		 */
		public var viewState:ViewStateModel;
		
		[Inject]
		/**
		 *	// TODO appModel 
		 */
		public var appModel:ApplicationModel;
		
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
			logger.debug( "ApplicationStateChangedCommand: execute" );
			logger.info( "SWFAddress::" + swfAddress.getValue() );
			
			appModel.option1 = swfAddress.getParameter("op1") as String;
			appModel.option2 = swfAddress.getParameter("op2") as String;
					
			viewState.viewName = swfAddress.getPath().substr(1);
			
		}
		
	}
}