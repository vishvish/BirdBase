package com.tfto.utils
{

	/**
	 * @author Mike Almond - MadeByPi
	 * @version 1.0
	 *
	 * Parser for Java-style .properties text
	 * Parses to Properties - name/value pairs
	 *
	 * Parsing overview:
	 *
	 * Lines starting with # or ! are ignored as comments
	 * Lines containing only empty space are ignored
	 * Whitespace is trimmed from names/values
	 * The properties are split into name/value pairs on either '=' or ':', whichever comes first
	 *
	 * Variables can be split over multiple lines using the '\' delimiter at the end of a line
	 * Variables can reference other variables using the ${varName} syntax - as long as they're already defined (parsing flow is top to bottom)
	 *
	 * @usage Use PropertiesParser.parse() to get a Properties instance, then...
	 *
	 * The token '{n}', where n is a non-zero integer, can be replaced at runtime with any value passed into the args of getProperty(name, ...args:*)
	 * Eg, for the example properties below;
	 *
	 * // For property text - hello.name = Hello {1}, how are you?
	 *
	 * properties.getProperty("hello.name", "Mike");
	 * // returns "Hello Mike, how are you?"
	 *
	 * // For property text - one.to.five = here are some things: {1}, {2}, {3}, {5}, {4}
	 * properties.getProperty("one.to.five", "apple", "bananna", "carrot", "date", "egg");
	 * // returns "here are some things: apple, bananna, carrot, egg, date"
	 *
	 */

	/**
	 *	// TODO PropertiesParser 
	 *	
	 *	// TODO @example 
	 *	
	 *	// TODO @exampleText 
	 *	
	 *	@author 	Vish Vishvanath
	 *	@email 		vish.vishvanath@gmail.com
	 *	@since 		11 January 2011
	 */
	public class PropertiesParser
	{

		/**
		 *	// TODO PropertiesParser 
		 *	
		 *	@param l 
		 *	
		 *	@return 	
		 */
		public function PropertiesParser( l:Lock )
		{
			
		}

		/**
		 * @param	value	The loaded string of a java/ant style .proerties file
		 * @return	Proterties instance parsed from the input string
		 */
		public static function parse( value:String = null ):Array
		{

			if ( value == null )
			{
				throw new ReferenceError( "Unabled to parse properties - parameter was null" );
				return;
			}

			var props:Array=[];
			var lines:Array;
			var i:int=-1;
			var s:String;
			var multiline:Boolean=false;

			const CR:String=String.fromCharCode( 13 );
			const LF:String=String.fromCharCode( 10 );
			const hasCR:Boolean=value.indexOf( CR ) > -1;
			const hasLF:Boolean=value.indexOf( LF ) > -1;

			// remove tabs
			value=value.replace( new RegExp( String.fromCharCode( 3 ), "g" ), "" );

			// split into lines (depending on the line-end type, will split on CRLF, CR, or LF)
			lines=value.split( ( hasCR && hasLF ) ? CR + LF : hasCR ? CR : LF );

			// build into array with each property
			while ( ++i < lines.length )
			{
				s = stripWhitespace( String( lines[ i ] ) );
				if ( s.length > 1 && s.charAt( 0 ) != "#" && s.charAt( 0 ) != "!" )
				{ //Ignore comments and empty lines

					// if it's a multiline var, add this to the last one
					if ( multiline )
					{
						props[ props.length - 1 ] = String( props[ props.length - 1 ] ).substr( 0, -1 ) + s;
					}
					else
					{
						props.push(s);
					}

					//does the property extend over more than one line?
					multiline = s.charAt( s.length - 1 ) == "\\";
				}
			}

			// parse into name / value pairs
			i = props.length;
			var splitIndex:int;
			var name:String;
			while ( --i > -1 )
			{
				s = props[ i ];
				splitIndex = getSplitIndex( s );

				if ( splitIndex == -1 )
				{
					props.splice( i, 1 );
					continue;
				}

				// extract and clean whitespace
				name = s.substring( 0, splitIndex );
				name = stripWhitespace( name );
				//
				value = s.substring( splitIndex + 1 );
				value = stripWhitespace( value );
				//
				props[ i ] = { name: name, value: value };
			}

			substituteVars( props );

			return props;
		}

		/**
		 * Get the index to split a string into name and value
		 * @param	value
		 * @return
		 */
		static private function getSplitIndex( value:String ):int
		{
			const s:Array=[ "=", ":" ]; // can split on '=' or ':'
			var n:int = 2;
			var index1:int;
			var index2:int = value.length;
			while ( --n > -1 )
			{
				index1 = value.indexOf( s[ n ] );
				if ( index1 > -1 && index1 < index2 )
				{
					index2 = index1;
				}
			}
			return ( index2 == value.length - 1 ) ? -1 : index2;
		}

		/**
		 * Replace ${ ... } vars in each property value with the corresponding value (if it exists)
		 * @param	props	Array of properties to process
		 */
		static private function substituteVars( props:Array ):void
		{

			var n:int = props.length;
			var i:int = -1;

			var name:String;
			var value:String;

			var j:int;
			var found:Boolean;
			var matches:Array;
			var sv:String;

			//match strings between ${ and } to extract variable names
			/**
			 *	// TODO Pattern 
			 */
			const varPattern:RegExp = /\${(.+?)\}/s;

			while ( ++i < n )
			{
				name=props[i].name;
				value=props[i].value;
				matches=value.match(varPattern);
				if (matches != null && (matches && matches[1] != null))
				{
					while (true)
					{
						sv=matches[1];
						found=false;
						j=-1;
						while (++j < n)
						{
							if (props[j].name == sv)
							{
								value=value.replace(varPattern, props[j].value);
								found=true;
							}
						}
						matches=value.match(varPattern);
						if (!found || matches == null || (matches && matches[1] == null))
							break;
					}
					//if we've had a positive match, go back and try again on this string until we replace all variables
					if (found)
						props[i--].value=value;
				}
			}
		}

		/**
		 *	// TODO stripWhitespace 
		 *	
		 *	@param value 
		 *	
		 *	@return String	
		 */
		private static function stripWhitespace(value:String):String
		{
			// strip empty space left and right, and consecutive spaces
			return value.replace(/^[ \s]+|[ \s]+$/g, "");
		}
	}
}

/**
 *	// TODO Lock 
 *	
 *	// TODO @example 
 *	
 *	// TODO @exampleText 
 *	
 *	@author 	Vish Vishvanath
 *	@email 		vish.vishvanath@gmail.com
 *	@since 		11 January 2011
 */
internal class Lock
{
}
;