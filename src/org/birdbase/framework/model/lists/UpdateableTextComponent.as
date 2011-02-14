package org.birdbase.framework.model.lists
{
	import org.birdbase.framework.service.ITextUpdateable;

	public class UpdateableTextComponent implements IUpdateableTextComponent
	{
		private var _item:ITextUpdateable;
		
		private var _args:Array;
		
		public function get item():ITextUpdateable
		{
			return _item;
		}

		public function set item(value:ITextUpdateable):void
		{
			_item = value;
		}

		public function get args():Array
		{
			return _args;
		}

		public function set args(value:Array):void
		{
			_args = value;
		}

		public function UpdateableTextComponent( item:ITextUpdateable, ...args )
		{
			this.item = item;
			this.args = args;
			trace( "UpdateableTextComponent", item, args );
		}
	}
}