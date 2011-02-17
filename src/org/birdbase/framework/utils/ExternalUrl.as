package org.birdbase.framework.utils
{
	import flash.net.URLRequest;
	import flash.net.navigateToURL;

	public class ExternalUrl
	{
		public static function openURL( destination:String, ...args ):void
		{
			var urlRequest:URLRequest = new URLRequest( destination );
			navigateToURL( urlRequest );
		}
	}
}