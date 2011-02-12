package com.vishvish.demoApplication.view
{
	import org.birdbase.framework.action.IExternalLinkActionable;
	import org.birdbase.framework.view.helpers.ViewHelper;
	
	import flash.events.MouseEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.utils.Dictionary;
	
	import org.as3commons.logging.ILogger;
	import org.birdbase.framework.action.Action;
	import org.birdbase.framework.action.IActionable;
	import org.birdbase.framework.model.ConfigurationModel;
	import org.birdbase.framework.model.BootstrapModel;
	import org.birdbase.framework.utils.swfaddress.SWFAddress;
	import org.osflash.signals.natives.NativeSignal;
	import com.vishvish.demoApplication.view.mediators.abstract.ApplicationMediator;

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
		
		/**
		 *	// TODO ThirdViewMediator 
		 */
		public function ThirdViewMediator()
		{
			super();
		}
		
		override public function onRegister():void
		{
			view.main();
			
			var option1:String = appModel.map.itemFor( "option1" );
			var option2:String = appModel.map.itemFor( "option2" );

			var links:Dictionary = helper.externalLinks;
			if( links != null )
			{
				view.linkButton.action = new Action( links.dzone.destination, links.dzone.label );
			}

			view.textTF.text = "This is the third view of the application. You've already selected: " + 
				option1 + 
				" and " + 
				option2 + 
				".";

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