package org.birdbase.framework.view.components
{
	import com.bit101.components.Text;
	
	import flash.display.DisplayObjectContainer;
	
	import org.birdbase.framework.service.ITextUpdateable;
	
	public class AbstractUpdateableText extends Text implements ITextUpdateable
	{
		public function AbstractUpdateableText( parent:DisplayObjectContainer=null, xpos:Number=0, ypos:Number=0 )
		{
			super( parent, xpos, ypos );
		}
	}
}