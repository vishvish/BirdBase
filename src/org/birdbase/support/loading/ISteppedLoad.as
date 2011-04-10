package org.birdbase.support.loading
{
	import flash.events.IEventDispatcher;
	
	import org.assetloader.signals.*;

	/**
	 * Describes an object that handles multiple items being loaded.
	 * 
	 * @author	Vish Vishvanath
	 * @since	30 March 2011
	 */
	public interface ISteppedLoad extends IEventDispatcher
	{
		/**
		 * Error handler from IAssetLoader. 
		 * 
		 * @param signal
		 * @param data
		 */
		function handleError( signal:ErrorSignal, data:* = null ):void;
		
		/**
		 * Load start handler from IAssetLoader.
		 * 
		 * @param signal
		 */
		function handleLoadStarted( signal:LoaderSignal ):void;
		
		/**
		 * Load progress handler from IAssetLoader.
		 *  
		 * @param signal
		 */
		function handleLoadProgress( signal:ProgressSignal ):void;
		
		/**
		 * Step complete handler from IAssetLoader.
		 *  
		 * @param signal
		 * @param data
		 */
		function handleStepCompleted( signal:LoaderSignal, data:* = null ):void;
		
		/**
		 * Handle entire load complete from IAssetLoader.
		 *  
		 * @param signal
		 * @param data
		 */
		function handleLoadCompleted( signal:LoaderSignal, data:* = null ):void;
	}
}