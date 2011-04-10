package com.addthis.share {
	import flash.display.Sprite;

	/**
    * Entry point for share library
    * 
    * Exposes share call which allows the user to share using 
    * AddThis oexchange endpoints
    * @see http://www.addthis.com/help/sharing-api
    * @see http://www.addthis.com/help/embedded-content
    */
	public class Main extends Sprite {
		//Share class
		public var shareApi:ShareAPI;
		
		//AddThis Username
		private var username:String;
		
		/**
		* Constructor
		* Share instantiation 
		**/  
		public function Main() {
			username = loaderInfo.parameters.username ? loaderInfo.parameters.username : "";
			shareApi = new ShareAPI(username);
        }
        
        /**
        * Exposed share call to share to a destination using 
        * AddThis oexchange end points
        * 
        * params expects an object like the following
        * 
        * var params:Object = {
        *   swfurl      : '[swf url to share]',
        *   width       : '[swf width]',
        *   height      : '[swf height]',
        *   title       : '[title to be shared]',
        *   description : '[description to be shared]',
        *   screenshot  : '[screenshot image to be shared]' };
        **/ 
        public function share(url:String, destination:String, params:Object):void{
        	shareApi.share(url,destination,params);
        }
	}
}
