package org.birdbase.framework.modules
{
	import org.robotlegs.utilities.modular.core.IModule;

	public interface IBirdbaseModule extends IModule
	{
		function init( data:Array ):void;
	}
}