package org.birdbase.modules.slideshow
{
	import flash.display.DisplayObjectContainer;
	import flash.system.ApplicationDomain;
	
	import org.birdbase.modules.slideshow.view.SlideshowView;
	import org.robotlegs.core.IInjector;
	import org.robotlegs.utilities.modular.mvcs.ModuleContext;
	import org.birdbase.modules.slideshow.view.mediators.SlideshowMediator;
	
	public class SlideshowContext extends ModuleContext
	{
		override public function startup():void
		{
			//map the modules so that instances will be properly supplied (injected) with an injector.
			viewMap.mapType( SlideshowModule );
			
			mediatorMap.mapView( SlideshowView, SlideshowMediator );
		}
	}
}