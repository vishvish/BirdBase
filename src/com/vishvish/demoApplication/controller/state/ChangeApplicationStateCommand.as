package com.vishvish.demoApplication.controller.state
{
	import com.vishvish.demoApplication.model.ApplicationModel;
	
	import org.as3commons.logging.ILogger;
	import org.birdbase.framework.model.ViewStateModel;
	import org.birdbase.framework.utils.swfaddress.SWFAddress;
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