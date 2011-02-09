package org.birdbase.framework.controller.state
{
	import org.as3commons.logging.ILogger;
	import org.birdbase.framework.model.ApplicationModel;
	import org.birdbase.framework.model.ViewStateModel;
	import org.birdbase.framework.utils.swfaddress.SWFAddress;
	import org.robotlegs.mvcs.SignalCommand;

	/**
	 *	ApplicationStateChangedCommand handles swfaddress changes and maps the parameters into the ApplicationModel.
	 *	
	 *	@author 	Vish Vishvanath
	 *	@email 		vish.vishvanath@gmail.com
	 *	@since 		11 January 2011
	 */
	public class ApplicationStateChangedCommand extends SignalCommand
	{
		[Inject]
		public var logger:ILogger;
		
		[Inject]
		public var viewState:ViewStateModel;
		
		[Inject]
		public var appModel:ApplicationModel;
		
		[Inject]
		public var swfAddress:SWFAddress;
		
		/**
		 * @inherit 
		 */		
		override public function execute():void
		{
			//logger.debug( "ApplicationStateChangedCommand::execute --> SWFAddress" + swfAddress.getValue() );
			
			for( var i:Number = 0; i < swfAddress.getParameterNames().length; i++ )
			{
				if( swfAddress.getParameterNames()[ i ] != null )
				{
					appModel.addParameter( swfAddress.getParameterNames()[ i ], swfAddress.getParameter( swfAddress.getParameterNames()[ i ] ) );
				}
			}
			
			viewState.viewName = swfAddress.getPath().substr( 1 );
		}
	}
}