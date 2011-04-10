package org.birdbase.framework.view
{
	import flash.text.TextField;
	
	import org.birdbase.framework.service.text.IHaveUpdateableText;
	

	/**
	* 	Represents a text field that can be bound to a source
	* 	string value.
	*/
	public class UpdateableTextField extends TextField implements IHaveUpdateableText
	{
		/**
		* 	Creates an <code>UpdatableTextField</code> instance.
		*/
		public function UpdateableTextField()
		{
			super();
		}
		
		/**
		* 	
		*/
		public function setText( value:String ):void
		{
			this.text = value;
		}
	}
}