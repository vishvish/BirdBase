package org.birdbase.framework.service.text
{
	import org.birdbase.framework.service.text.IHaveUpdateableText;

	/**
	 *	UpdateableTextListComponent TODO
	 *	
	 *	@example TODO
	 *	
	 *	@exampleText TODO
	 *	
	 *	@author 	Vish Vishvanath
	 *	@email 		vish.vishvanath@gmail.com
	 *	@since 		22 February 2011
	 */
	public class UpdateableTextComponent implements IUpdateableTextComponent
	{
		/**
		 *	_item TODO
		 */
		private var _item:IHaveUpdateableText;
		
		/**
		 *	_args TODO
		 */
		private var _args:Array;
		
		/**
		 * item TODO
		 */
		public function get item():IHaveUpdateableText
		{
			return _item;
		}

		/**
		 * @private
		 */
		public function set item(value:IHaveUpdateableText):void
		{
			_item = value;
		}

		/**
		 * args TODO
		 */
		public function get args():Array
		{
			return _args;
		}

		/**
		 * @private
		 */
		public function set args(value:Array):void
		{
			_args = value;
		}

		/**
		 *	UpdateableTextListComponent TODO
		 *	
		 *	@param item 
		 *	@param ...args 
		 *	
		 *	@return 	
		 */
		public function UpdateableTextComponent( item:IHaveUpdateableText, ...args )
		{
			this.item = item;
			this.args = args;
		}
	}
}