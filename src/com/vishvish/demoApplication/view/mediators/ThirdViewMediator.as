package com.vishvish.demoApplication.view.mediators
{
	import org.birdbase.framework.action.IExternalLinkActionable;
	import com.vishvish.demoApplication.helpers.ViewHelper;
	import com.vishvish.demoApplication.view.ThirdView;
	
	import flash.events.MouseEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.utils.Dictionary;
	
	import org.as3commons.logging.ILogger;
	import org.birdbase.framework.action.Action;
	import org.birdbase.framework.action.IActionable;
	import org.birdbase.framework.model.L10nModel;
	import org.birdbase.framework.model.PreferencesModel;
	import org.birdbase.framework.utils.swfaddress.SWFAddress;
	import org.osflash.signals.natives.NativeSignal;

	/**
	 *	// TODO ThirdViewMediator 
	 *	
	 *	// TODO @example 
	 *	
	 *	// TODO @exampleText 
	 *	
	 *	@author 	Vish Vishvanath
	 *	@email 		vish.vishvanath@gmail.com
	 *	@since 		11 January 2011
	 */
	public class ThirdViewMediator extends ApplicationMediator
	{
		[Inject]
		public var view:ThirdView;
		
		[Inject]
		public var logger:ILogger;

		[Inject]
		public var swfAddress:SWFAddress;

		[Inject]
		public var pm:PreferencesModel;
		
		[Inject]
		public var l10n:L10nModel;
		
		[Inject]
		public var helper:ViewHelper;

		/**
		 *	// TODO ThirdViewMediator 
		 */
		public function ThirdViewMediator()
		{
			super();
		}
		
		/**
		 *	// TODO onRegister 
		 *	
		 *	@return void	
		 */
		override public function onRegister():void
		{
			view.option1 = appModel.map.itemFor( "option1" );
			view.option2 = appModel.map.itemFor( "option2" );
			view.main();
			
			var links:Dictionary = helper.externalLinks;
			if( links != null )
			{
				view.dzoneButton.action = new Action( links.dzone.destination, links.dzone.label );
			}

			var signal:NativeSignal = new NativeSignal( view, MouseEvent.CLICK, MouseEvent );
			signal.add( viewPressed );
		}

		private function viewPressed( e:MouseEvent ):void
		{
			// did someone just press a navigation button?
			if( e.target is IExternalLinkActionable )
			{
				if( IActionable( e.target ).action )
				{
					var destination:String = IActionable( e.target ).action.destination
					logger.debug( "ThirdViewMediator::viewPressed / IExternalLinkActionable --> " + destination );
					
					// TODO: Hand over all external loading to a Util class.
					var urlRequest:URLRequest = new URLRequest( destination );
					
//					swfAddress.setValue( destination );
				}
			}
			else
			{
				logger.debug( "ThirdViewMediator::viewPressed " + e.target.toString() );
			}
		}
	}
}