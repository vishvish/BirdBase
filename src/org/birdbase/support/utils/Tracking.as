package org.birdbase.support.utils
{
	import flash.external.ExternalInterface;

	/**
	 * A basic wrapper for calling out to an external tracking/analytics function in Javascript.
	 *  
	 * @author	Vish Vishvanath
	 * @since	21 March 2011
	 */
	public class Tracking
	{
		/**
		 * Proxies out to a javascript function "track".
		 * 
		 * Examples:
		 * 
		 * BirdbaseTracking.track( "video", "play", "True Blood S02E12" );
		 * BirdbaseTracking.track( "video", "stop", "The Big Bang Theory S04E08" );
		 * BirdbaseTracking.track( "document", "download", "Dante Alighiery - La Divina Commedia.pdf" );
		 * BirdbaseTracking.track( "button", "click", "Game start" );
		 *  
		 * @param category
		 * @param tag
		 * @param label
		 */
		public static function track( category:String, tag:String, label:String ):void
		{
			ExternalInterface.call( "track", category, tag, label );
		}
	}
}