package org.birdbase.framework.action
{
	/**
	 * An action object which represents a call to action, and wraps around a destination and its label.
	 * 
	 * The destination need not be a URL state, but could also represent an internal action.
	 * 
	 * @author	Vish Vishvanath
	 * @since	22 February 2011
	 */
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

		/**
		 * @inherit
		 */
		public function get destination():String
		{
			return _destination;
		}

		/**
		 * @inherit
		 */
		public function set destination(value:String):void
		{
			_destination = value;
		}

		/**
		 * @inherit
		 */
		public function get label():String
		{
			return _label;
		}

		/**
		 * @inherit
		 */
		public function set label(value:String):void
		{
			_label = value;
		}
	}
}