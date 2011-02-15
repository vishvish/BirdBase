package com.vishvish.demoApplication.view
{
	import com.vishvish.demoApplication.view.mediators.abstract.ApplicationMediator;
	
	import org.birdbase.framework.model.*;

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