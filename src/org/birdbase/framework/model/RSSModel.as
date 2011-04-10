package org.birdbase.framework.model
{
	import com.adobe.xml.syndication.rss.*;
	
	import flash.events.*;
	import flash.net.*;

	/**
	 * Implements a non-blocking RSS model/service which accepts a URL and a callback.
	 *   
	 * @author	Vish Vishvanath
	 * @since	10 March 2011
	 */
	public class RSSModel implements IRSSModel
	{
		private var _callback:Function;
		
		private var _loader:URLLoader;
		
		public function RSSModel()
		{
			super();
		}
		
		/**
		 * @inheritDoc
		 */
		public function loadFeed( uri:String, callback:Function ):void
		{
			_callback = callback;
			
			_loader = new URLLoader();
			_loader.addEventListener( Event.COMPLETE, onDataLoaded );
			_loader.addEventListener( IOErrorEvent.IO_ERROR, onIOError );
			_loader.addEventListener( SecurityErrorEvent.SECURITY_ERROR, onSecurityError );
			
			var request:URLRequest = new URLRequest( uri );
			request.method = URLRequestMethod.GET;
			_loader.load( request );
		}

		private function onDataLoaded( e:Event ):void
		{
			var data:String = URLLoader( e.target ).data;
			parseFeed( data );
		}

		private function onIOError( e:IOErrorEvent ):void
		{
			error( e );
		}

		private function onSecurityError( e:SecurityErrorEvent ):void
		{
			
		}
		
		private function parseFeed( data:String ):void
		{
			//XMLSyndicationLibrary does not validate that the data contains valid
			//XML, so you need to validate that the data is valid XML.
			//We use the XMLUtil.isValidXML API from the corelib library.
//			if(!XMLUtil.isValidXML(data))
//			{
//				writeOutput("Feed does not contain valid XML.");
//				return;
//			}	
			
			//create RSS20 instance
			var rss:RSS20 = new RSS20();
			
			//parse the raw rss data
			rss.parse( data );
			
			//get all of the items within the feed
			var items:Array = rss.items;
			_callback( items );
		}
	}
}