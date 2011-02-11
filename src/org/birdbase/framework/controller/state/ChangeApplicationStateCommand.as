package org.birdbase.framework.controller.state
{
	import org.as3commons.logging.ILogger;
	import org.birdbase.framework.model.ApplicationModel;
	import org.birdbase.framework.model.ViewStateModel;
	import org.birdbase.framework.utils.swfaddress.SWFAddress;
	import org.robotlegs.mvcs.SignalCommand;

	/**
	 *	ChangeApplicationStateCommand changes the application's state to reflect the ApplicationModel. Switches
	 *	swfaddress to the appropriate URL.
	 *	
	 *	@author 	Vish Vishvanath
	 *	@email 		vish.vishvanath@gmail.com
	 *	@since 		11 January 2011
	 */
	public class ChangeApplicationStateCommand extends SignalCommand
	{	
		[Inject(name="birdbase")]
		public var logger:ILogger;
		
		[Inject]
		public var appModel:ApplicationModel;
		
		[Inject]
		public var viewState:ViewStateModel;
		
		[Inject]
		public var swfAddress:SWFAddress;
		
		/**
		 * @inherit 
		 */
		override public function execute():void
		{
			var url:String = "/" + viewState.viewName + "?";
			var mapContents:Array = appModel.map.keysToArray();
			
			for( var i:int = 0; i < mapContents.length; i++ )
			{
				var item:* = appModel.map.itemFor( mapContents[ i ] );
				if( item )
				{
					url += appModel.map.keysToArray()[ i ] + "=" + item + "&";
				}
			}
			swfAddress.setValue( url );
		}
	}
}