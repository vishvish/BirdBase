package org.birdbase.support.loading
{
	import org.assetloader.signals.LoaderSignal;

	/**
	 * Describes a generic loader view for BirdBase. Implement this for your custom loader view.
	 *  
	 * @author	Vish Vishvanath
	 * @since	14 March 2011
	 * 
	 */
	public interface ILoaderView
	{
		/**
		 * The three responders.
		 *  
		 * @param s
		 */
		function onStart( s:LoaderSignal ):void;
		function onProgress( s:LoaderSignal ):void;
		function onComplete( s:LoaderSignal, data:* ):void;
	}
}