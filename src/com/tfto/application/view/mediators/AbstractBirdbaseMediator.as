package com.tfto.application.view.mediators
{
	import com.tfto.application.model.ApplicationModel;
	import com.tfto.birdbase.model.ViewStateModel;
	import com.tfto.birdbase.signals.ModifyApplicationState;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class AbstractBirdbaseMediator extends Mediator
	{
		[Inject]
		public var appModel:ApplicationModel;
		
		[Inject]
		public var viewState:ViewStateModel;
		
		[Inject]
		public var modifyApplicationState:ModifyApplicationState;

		public function AbstractBirdbaseMediator()
		{
			super();
		}
	}
}