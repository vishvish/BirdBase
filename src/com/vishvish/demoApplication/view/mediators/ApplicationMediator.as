package com.vishvish.demoApplication.view.mediators
{
	import com.vishvish.demoApplication.model.ApplicationModel;
	
	import org.birdbase.framework.view.AbstractBirdbaseMediator;
	
	public class ApplicationMediator extends AbstractBirdbaseMediator
	{
		[Inject]
		public var appModel:ApplicationModel;

		public function ApplicationMediator()
		{
			super();
		}
	}
}