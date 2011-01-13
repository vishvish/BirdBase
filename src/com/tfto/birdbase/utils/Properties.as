package com.tfto.birdbase.utils
{
	/**
	 * @author Mike Almond - MadeByPi
	 * @version 1.0
	 *
	 * Container for properties with replaceable numerical tokens - {1}, {2}, {3},... {n}
	 */
	public class Properties {
		
		/**
		 *	// TODO _props 
		 */
		private static var _props:Array;
		/**
		 *	// TODO _instance 
		 */
		private static var _instance:Properties;
		
		/**
		 *	// TODO Properties 
		 *	
		 *	@param properties 
		 *	
		 *	@return 	
		 */
		public function Properties(properties:Array = null)
		{
			_props = properties;
			if ( _props == null )
			{
				_props = [];
			}
		}
		
		/**
		 *	// TODO getInstance 
		 *	
		 *	@param properties 
		 *	
		 *	@return Properties	
		 */
		public static function getInstance( properties:Array = null ):Properties
		{
			if( _instance )
			{
				return _instance;
			}
			else
			{
				_instance = new Properties( properties );
				return _instance;
			}
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
			
			if (value != null && (value == "" || value.length == 0)) value = null;
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
	}
}