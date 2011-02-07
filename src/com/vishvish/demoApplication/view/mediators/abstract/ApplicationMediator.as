package com.vishvish.demoApplication.view.mediators.abstract
{
	import com.vishvish.demoApplication.helpers.ViewHelper;
	import com.vishvish.demoApplication.model.ApplicationModel;
	
	import org.as3commons.logging.ILogger;
	import org.birdbase.framework.model.ConfigurationModel;
	import org.birdbase.framework.utils.swfaddress.SWFAddress;
	import org.birdbase.framework.view.AbstractBirdbaseMediator;
	
	public class ApplicationMediator extends AbstractBirdbaseMediator
	{
		[Inject]
		public var appModel:ApplicationModel;

		[Inject]
		public var config:ConfigurationModel;

		[Inject]
		public var helper:ViewHelper;

		[Inject]
		public var logger:ILogger;
		
		[Inject]
		public var swfAddress:SWFAddress;

		public function ApplicationMediator()
		{
			super();
		}
	}
}