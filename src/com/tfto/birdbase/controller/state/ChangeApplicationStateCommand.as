package com.tfto.birdbase.controller.state
{
	import com.tfto.birdbase.model.ApplicationModel;
	import com.tfto.birdbase.model.ViewStateModel;
	
	import org.as3commons.logging.ILogger;
	import org.robotlegs.mvcs.SignalCommand;
	
	import swfaddress.SWFAddress;

	/**
	 *	// TODO ChangeApplicationStateCommand 
	 *	
	 *	// TODO @example 
	 *	
	 *	// TODO @exampleText 
	 *	
	 *	@author 	Vish Vishvanath
	 *	@email 		vish.vishvanath@gmail.com
	 *	@since 		11 January 2011
	 */
	public class ChangeApplicationStateCommand extends SignalCommand
	{	
		[Inject]
		/**
		 *	// TODO logger 
		 */
		public var logger:ILogger;
		
		[Inject]
		/**
		 *	// TODO appModel 
		 */
		public var appModel:ApplicationModel;
		
		[Inject]
		/**
		 *	// TODO viewState 
		 */
		public var viewState:ViewStateModel;
		
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
			logger.debug( "ChangeApplicationStateCommand: execute" );

			var url:String = "/" + viewState.viewName + "?";
			
			if( appModel.option1 != null )
			{
				url += "op1=" + appModel.option1;
			}

			if( appModel.option2 != null )
			{
				url += "&op2=" + appModel.option2;
			}
					
			swfAddress.setValue( url );
		}
	}
}