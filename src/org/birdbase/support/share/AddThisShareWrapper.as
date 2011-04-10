package org.birdbase.support.share
{
	import com.addthis.share.ShareAPI;
	
	import flash.external.ExternalInterface;
	
	/**
	* 	A simple wrapper for the add this share API.
	*/
	public class AddThisShareWrapper extends Object
	{
		private var _username:String;
		private var _api:ShareAPI;
		
		/**
		* 	Represents a destination for the facebook service.
		*/
		public static const FACEBOOK:String = "facebook";
		
		/**
		* 	Represents a destination for the twitter service.
		*/
		public static const TWITTER:String = "twitter";
		
		/**
		* 	Represents a destination for the digg service.
		*/
		public static const DIGG:String = "digg";
		
		/**
		* 	Represents a destination for the delicious service.
		*/
		public static const DELICIOUS:String = "delicious";
		
		/**
		* 	Represents a destination for the buzz service.
		*/
		public static const BUZZ:String = "buzz";
		
		/**
		* 	Represents a destination for the stumbleupon service.
		*/
		public static const STUMBLEUPON:String = "stumbleupon";
		
		/**
		* 	Creates an <code>AddThisShareWrapper</code> instance.
		*/
		public function AddThisShareWrapper()
		{
			super();
		}
		
		/**
		* 	The add this username.
		*/
		public function get username():String
		{
			return _username;
		}
		
		public function set username( value:String ):void
		{
			_username = value;
			
			if( value == null )
			{
				_api = null;
			}else
			{
				_api = new ShareAPI( value );
			}
		}
		
		/**
		* 	The API interface instantiated when the username
		* 	is set.
		*/
		public function get api():ShareAPI
		{
			return _api;
		}
		
		/**
		* 	@private
		*/
		private function getDocumentURL():String
		{
			if( !ExternalInterface.available )
			{
				throw new Error( "Cannot ascertain the 'document.location.href' without external interface availability." );
			}
			
			var url:String = ExternalInterface.call( "getDocumentURL" );
			return url;
		}
		
		/**
		* 	Shares the current URL with the service
		* 	specified by the <code>destination</code>.
		* 
		* 	@param destination The name of the service used for
		* 	sharing.
		*/
		public function share( destination:String ):void
		{
			if( _api == null )
			{
				throw new Error(
					"You must specify a username before sharing a document." );
			}
			var url:String = getDocumentURL();
			_api.share( url, destination );
		}
	}
}