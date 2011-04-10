package org.birdbase.support.utils
{
	/**
	 *	Converter responsible for converting an input value to
	 * 	a valid property name.
	 *
	 *	@langversion ActionScript 3.0
	 *	@playerversion Flash 9.0
	 *
	 *	@author Mischa Williamson
	 *	@since  21.10.2010
	 */
	public class PropertyNameConverter
	{
		/**
		 * 	Creates a <code>PropertyNameConverter</code> instance.
		 */
		public function PropertyNameConverter()
		{
			super();
		}
		
		/**
		 * 	@inheritDocDoc
		 */
		public static function convert( value:String ):String
		{
			if( value.indexOf( "-" ) > -1 )
			{
				var parts:Array = value.split( "-" );
				var output:String = "";
				for( var i:int = 0;i < parts.length;i++ )
				{
					output += firstCharToUpperCase( parts[ i ] );
				}
				value = firstCharToLowerCase( output );
			}
			
			return value;
		}
		/**
		 *	Converts the first character of a
		 *	<code>String</code> to lower case.
		 *
		 *	@param input The <code>String</code> to convert.
		 *	
		 *	@return A <code>String</code> with the first character
		 *	converted to lower case.
		 */
		public static function firstCharToLowerCase( input:String = null ):String
		{
			return input.charAt( 0 ).toLowerCase() + input.substr( 1 );
		}
		
		/**
		 *	Converts the first character of a
		 *	<code>String</code> to upper case.
		 *
		 *	@param input The <code>String</code> to convert.
		 *	
		 *	@return A <code>String</code> with the first character
		 *	converted to upper case.
		 */
		public static function firstCharToUpperCase( input:String = null ):String
		{
			return input.charAt( 0 ).toUpperCase() +
				input.substr( 1 );
		}		
	}
}