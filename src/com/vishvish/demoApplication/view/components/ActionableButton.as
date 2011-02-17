package com.vishvish.demoApplication.view.components
{
	import com.bit101.components.PushButton;
	
	import flash.display.DisplayObjectContainer;
	
	import org.birdbase.framework.action.IAction;
	import org.birdbase.framework.action.IActionable;

	public class ActionableButton extends PushButton implements IActionableButton
	{
		protected var _action:IAction;
		
		public function ActionableButton( parent:DisplayObjectContainer = null, 
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

		public function set text( value:String ):void
		{
			this.label = value;
		}
	}
}