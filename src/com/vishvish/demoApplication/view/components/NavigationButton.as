package com.vishvish.demoApplication.view.components
{
	import flash.display.DisplayObjectContainer;
	
	import org.birdbase.framework.action.INavigationActionable;
	
	public class NavigationButton extends ActionableButton implements INavigationActionable
	{
		public function NavigationButton( parent:DisplayObjectContainer = null, 
										  xpos:Number = 0,
										  ypos:Number = 0,
										  label:String = "Navigation Button",
										  defaultHandler:Function=null)
		{
			super(parent, xpos, ypos, label, defaultHandler);
		}
	}
}

