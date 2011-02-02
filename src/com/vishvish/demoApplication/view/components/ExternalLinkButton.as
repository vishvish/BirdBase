package com.vishvish.demoApplication.view.components
{
	import org.birdbase.framework.action.IExternalLinkActionable;
	
	import flash.display.DisplayObjectContainer;
	
	public class ExternalLinkButton extends ActionableButton implements IExternalLinkActionable
	{
		public function ExternalLinkButton( parent:DisplayObjectContainer = null, 
										  xpos:Number = 0, 
										  ypos:Number = 0, 
										  label:String = "External Link Button", 
										  defaultHandler:Function = null )
		{
			super(parent, xpos, ypos, label, defaultHandler);
		}
	}
}