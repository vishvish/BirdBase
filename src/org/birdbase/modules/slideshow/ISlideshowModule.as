package org.birdbase.modules.slideshow
{
	import org.as3commons.collections.framework.core.ArrayListIterator;
	import org.robotlegs.core.ISignalContext;
	import org.robotlegs.utilities.modular.core.IModule;

	public interface ISlideshowModule extends IModule
	{
		function get iterator():ArrayListIterator;
		
		function load():void;
	}
}