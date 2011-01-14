package org.birdbase.modules.slideshow
{
	import org.as3commons.collections.ArrayList;
	import org.as3commons.collections.framework.core.ArrayListIterator;
	import org.as3commons.logging.ILogger;
	import org.birdbase.framework.model.PreferencesModel;
	import org.birdbase.modules.slideshow.signals.LoadSlideshow;
	import org.birdbase.modules.slideshow.signals.SlideshowLoaded;
	import org.robotlegs.adapters.SwiftSuspendersInjector;
	import org.robotlegs.core.IInjector;
	import org.robotlegs.utilities.modular.core.IModuleContext;
	
	public class SlideshowModule implements ISlideshowModule
	{
		[Inject]
		public var list:ArrayList;
		
		[Inject]
		public var pm:PreferencesModel;
		
		[Inject]
		public var logger:ILogger;

		[Inject]
		public var loadSlideshow:LoadSlideshow;
		
		protected var context:IModuleContext;
		
		public function get iterator():ArrayListIterator
		{
			if( list )
			{
				return new ArrayListIterator( list, 0 );
			}
			else
			{
				return null;
			}
		}
		
		public function SlideshowModule()
		{
//			var injector:SwiftSuspendersInjector = new SwiftSuspendersInjector();
//			injector.mapSingletonOf( SlideshowLoaded, SlideshowLoaded );
		}
		
		[PostConstruct]
		public function load():void
		{
			loadSlideshow.dispatch();
		}

		[Inject]
		public function set parentInjector( value:IInjector ):void
		{
//			this.parentInjector = value;
//			context = new SlideshowContext( this., value );
		}

		public function dispose():void
		{
			// TODO Auto-generated method stub
		}
		
	}
}