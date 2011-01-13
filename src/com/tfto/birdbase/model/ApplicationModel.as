package com.tfto.birdbase.model
{
	import org.as3commons.logging.ILogger;
	import org.robotlegs.mvcs.Actor;
	
	/**
	 *	// TODO ApplicationModel 
	 *	
	 *	// TODO @example 
	 *	
	 *	// TODO @exampleText 
	 *	
	 *	@author 	Vish Vishvanath
	 *	@email 		vish.vishvanath@gmail.com
	 *	@since 		11 January 2011
	 */
	public class ApplicationModel extends Actor
	{
		/**
		 *	// TODO option1 
		 */
		public var option1:String;
		/**
		 *	// TODO option2 
		 */
		public var option2:String;
		
		/**
		 *	// TODO _locale 
		 */
		protected var _locale:String = "en_GB";

		/**
		 *	// TODO _props 
		 */
		protected var _props:Array;

		[Inject]
		public var logger:ILogger;

		/**
		 *	// TODO ApplicationModel 
		 */
		public function ApplicationModel()
		{
			super();
		}

		/**
		 * Get a property String
		 * @param	name	Name of the property to retrive
		 * @param	...args	Replace any tokens {n} with these values
		 * @return
		 */
		public function getProperty( name:String, ...args:* ):String
		{
			var n		:int 	= _props.length;
			var m		:int 	= args.length;
			var value	:String = null;
			
			while( --n > -1 )
			{
				if( String( _props[ n ].name ) == name )
				{
					value = String(_props[n].value);
					// replace any numerical tokens in the property with values passed in via the args parameter
					while (--m > -1) value = value.split("{" + (m + 1) + "}").join(args[m]);
				}
			}
			
			if (value != null && (value == "" || value.length == 0)) value = "";
			return value;
		}
		
		/**
		 *	// TODO setProperty 
		 *	
		 *	@param name 
		 *	@param value 
		 *	
		 *	@return void	
		 */
		public function setProperty(name:String, value:String):void
		{
			var i:int = getPropertyIndex(name);
			if(i == -1){
				_props.push( { name:name, value:value } );
			} else {
				_props[i] = { name:name, value:value };
			}
		}
		
		/**
		 *	// TODO removeProperty 
		 *	
		 *	@param name 
		 *	
		 *	@return void	
		 */
		public function removeProperty(name:String):void
		{
			var i:int = getPropertyIndex(name);
			if (i != -1) _props.splice(i, 1);
		}
		
		/**
		 *	// TODO getPropertyIndex 
		 *	
		 *	@param name 
		 *	
		 *	@return int	
		 */
		private function getPropertyIndex(name:String):int
		{
			var n:int = _props.length;
			while (--n > -1) {
				if (String(_props[n].name) == name) return n;
			}
			return -1;
		}

		/**
		 * props // TODO 
		 */
		public function get props():Array
		{
			return _props;
		}

		/**
		 * @private
		 */
		public function set props(value:Array):void
		{
			_props = value;
		}

		/**
		 * locale // TODO 
		 */
		public function get locale():String
		{
			return _locale;
		}

		/**
		 * @private
		 */
		public function set locale(value:String):void
		{
			_locale = value;
		}
	}
}