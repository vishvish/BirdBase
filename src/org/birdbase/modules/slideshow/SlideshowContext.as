package org.birdbase.modules.slideshow
{
	import flash.display.DisplayObjectContainer;
	
	import org.as3commons.collections.ArrayList;
	import org.as3commons.collections.SortedList;
	import org.as3commons.collections.framework.core.ArrayListIterator;
	import org.as3commons.collections.framework.core.SortedListIterator;
	import org.as3commons.logging.ILogger;
	import org.as3commons.logging.LoggerFactory;
	import org.birdbase.modules.slideshow.view.SlideshowView;
	import org.birdbase.modules.slideshow.view.mediators.SlideshowMediator;
	import org.robotlegs.core.IInjector;
	import org.robotlegs.utilities.modular.mvcs.ModuleContext;
	
	public class SlideshowContext extends ModuleContext
	{
		public function SlideshowContext( contextView:DisplayObjectContainer, parentInjector:IInjector )
		{
			super( contextView, true, parentInjector );
		}

		override public function startup():void
		{
			var logger:ILogger = LoggerFactory.getLogger( "module.slideshow" );
			injector.mapValue( ILogger, logger );
			
			logger.debug( "SlideshowContext::startup" );

			injector.mapClass( ISlideshowModule, SlideshowModule );
			injector.mapClass( SortedList, SortedList );
			injector.mapClass( SortedListIterator, SortedListIterator );
			injector.mapClass( ArrayList, ArrayList );
			injector.mapClass( ArrayListIterator, ArrayListIterator );
			
			//map the modules so that instances will be properly supplied (injected) with an injector.
			viewMap.mapType( SlideshowModule );
			
			mediatorMap.mapView( SlideshowView, SlideshowMediator );
			
			super.startup();
		}
	}
}