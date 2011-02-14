package org.birdbase.framework.model.lists
{
	import org.birdbase.framework.service.ITextIsUpdateable;

	public class UpdateableTextListComponent implements IUpdateableTextListComponent
	{
		private var _item:ITextIsUpdateable;
		
		private var _args:Array;
		
		public function get item():ITextIsUpdateable
		{
			return _item;
		}

		public function set item(value:ITextIsUpdateable):void
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

		public function UpdateableTextListComponent( item:ITextIsUpdateable, ...args )
		{
			this.item = item;
			this.args = args;
		}
	}
}