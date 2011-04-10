package org.birdbase.support.loading 
{
	import flash.display.MovieClip;

	/**
	 * Describes a class that accepts being informed that preloading is complete.
	 *  
	 * @author	Vish Vishvanath
	 * @since	06 April 2011
	 */
	public interface IHasSteppedPreloader
	{
		function codePreloadComplete( preloader:IPreloaderView ):void;
	}
}