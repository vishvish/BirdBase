package org.birdbase.support.utils
{
	import flash.net.URLRequest;
	import flash.net.navigateToURL;

	/**
	 * Helper class to open external URLs. Extend for use with tracking or analytics.
	 *  
	 * @author	Vish Vishvanath
	 * @since	14 March 2011
	 * 
	 */
	public class ExternalUrl
	{
		/**
		 * Static method to open external URL in browser window.
		 *  
		 * @param destination
		 * @param args
		 * 
		 */
		public static function openURL( destination:String, target:String = "_top" ):void
		{
			var urlRequest:URLRequest = new URLRequest( destination );
			navigateToURL( urlRequest, target );
		}
	}
}