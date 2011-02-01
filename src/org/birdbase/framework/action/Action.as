package org.birdbase.framework.action
{

	public class Action implements IAction
	{
		private var _destination:String;
		private var _label:String;
		
		public function Action( destination:String = null, label:String = null )
		{
			if( destination )
			{
				_destination = destination;
			}
			
			if( label )
			{
				_label = label;
			}
		}

		public function get destination():String
		{
			return _destination;
		}

		public function set destination(value:String):void
		{
			_destination = value;
		}

		public function get label():String
		{
			return _label;
		}

		public function set label(value:String):void
		{
			_label = value;
		}

	}
}