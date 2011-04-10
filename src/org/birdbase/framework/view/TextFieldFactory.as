package org.birdbase.framework.view
{
	import flash.text.*;
	
	/**
	* 	A factory class for creating text fields.
	*/
	public class TextFieldFactory extends Object
	{
		/**
		* 	Creates a <code>TextFieldFactory</code> instance.
		*/
		public function TextFieldFactory()
		{
			super();
		}
		
		/**
		* 	Creates a text field.
		* 
		* 	@param format A text format to assign to the textfield.
		* 
		* 	@return A new text field.
		*/
		public static function create( format:TextFormat ):TextField
		{
			var txt:TextField = new UpdateableTextField();
			txt.autoSize = TextFieldAutoSize.LEFT;
			txt.embedFonts = true;
			if( format != null )
			{
				txt.defaultTextFormat = format;
			}
			txt.selectable = false;
			
			//offset by the textfield gutters so that paddings
			//are correct
			txt.x = -2;
			txt.y = -3;
			
			//trace("[CREATING TEXT FIELD] TextFieldFactory::create()", txt, format, format.color, format.size );
			
			txt.antiAliasType = AntiAliasType.ADVANCED;
			return txt;
		}
	}
}