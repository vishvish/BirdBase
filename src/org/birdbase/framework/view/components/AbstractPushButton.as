package org.birdbase.framework.view.components
{
	import com.bit101.components.PushButton;
	
	import flash.display.DisplayObjectContainer;
	
	import org.birdbase.framework.service.ITextUpdatable;
	
	/**
	 *	Modifies the MinimalComps PushButton to implement ITextUpdatable.
	 * 
	 *	@author Vish Vishvanath
	 * 	@sinced	13 February 2011
	 * 
	 */
	public class AbstractPushButton extends PushButton implements ITextUpdatable
	{
		public function AbstractPushButton( parent:DisplayObjectContainer=null, xpos:Number=0, ypos:Number=0, defaultHandler:Function=null )
		{
			super( parent, xpos, ypos, "", defaultHandler );
		}

		/**
		 *	@inherit 
		 */
		public function set text( value:String ):void
		{
			label = value;
		}
	}
}