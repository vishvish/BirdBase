package org.birdbase.modules.slideshow
{
	import flash.display.Sprite;
	
	import org.birdbase.framework.modules.*;
	import org.robotlegs.core.IInjector;
	import org.robotlegs.utilities.modular.core.IModuleContext;
	
	public class SlideshowModule extends Sprite implements IBirdbaseModule
	{
		protected var context:IModuleContext;
		
		[Inject]
		public function set parentInjector( value:IInjector ):void
		{
			context = new SlideshowContext( this, value );
		}

		public function dispose():void
		{
			context = null;
		}
		
		public function init( data:Array ):void
		{
			
		}
	}
}