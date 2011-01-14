package org.birdbase.application.controller.state
{
	import org.birdbase.application.model.ApplicationModel;
	import org.birdbase.framework.model.BirdbaseApplicationModel;
	import org.birdbase.framework.model.ViewStateModel;
	import org.birdbase.framework.utils.swfaddress.SWFAddress;
	
	import org.as3commons.logging.ILogger;
	import org.robotlegs.mvcs.SignalCommand;

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
		public var logger:ILogger;
		
		[Inject]
		public var appModel:ApplicationModel;
		
		[Inject]
		public var viewState:ViewStateModel;
		
		[Inject]
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
			
			// update url with application options
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