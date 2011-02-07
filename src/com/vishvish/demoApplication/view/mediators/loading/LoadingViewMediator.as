package com.vishvish.demoApplication.view.mediators.loading
{
	import com.vishvish.demoApplication.view.LoadingView;
	import com.vishvish.demoApplication.view.mediators.abstract.ApplicationMediator;

	public class LoadingViewMediator extends ApplicationMediator
	{
		[Inject]
		public var view:LoadingView;

		public function LoadingViewMediator()
		{
		}
	}
}