package org.birdbase.framework.view
{
	import org.birdbase.demoApplication.model.ApplicationModel;
	import org.birdbase.framework.model.ViewStateModel;
	import org.birdbase.framework.signals.ModifyApplicationState;
	
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