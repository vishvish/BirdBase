package com.vishvish.demoApplication.view
{
	import org.birdbase.framework.view.helpers.ViewHelper;
	
	import org.as3commons.logging.ILogger;
	import org.birdbase.framework.model.*;
	import org.birdbase.framework.utils.swfaddress.SWFAddress;
	import com.vishvish.demoApplication.view.mediators.abstract.ApplicationMediator;

	public class ContactViewMediator extends ApplicationMediator
	{
		[Inject]
		public var view:ContactView;
		
		public function ContactViewMediator()
		{
			super();
		}
	}
}