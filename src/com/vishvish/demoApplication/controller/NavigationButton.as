package com.vishvish.demoApplication.controller
{
	import com.bit101.components.PushButton;
	import flash.display.DisplayObjectContainer;
	import org.birdbase.framework.action.IAction;
	import org.birdbase.framework.action.INavigationActionable;

	public class NavigationButton extends PushButton implements INavigationActionable
	{
		private var _action:IAction;
		
		public function NavigationButton( parent:DisplayObjectContainer = null, 
										  xpos:Number = 0, 
										  ypos:Number = 0, 
										  label:String = "Navigation Button", 
										  defaultHandler:Function = null )
		{
			super(parent, xpos, ypos, label, defaultHandler);
		}

		public function get action():IAction
		{
			return _action;
		}
		
		public function set action( value:IAction ):void
		{
			_action = value;
			if( value )
			{
				this.label = action.label;
			}
		}
	}
}