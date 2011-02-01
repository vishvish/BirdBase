package org.birdbase.framework.action
{
	public interface IAction
	{
		function get destination():String;

		function set destination(value:String):void;

		function get label():String;

		function set label(value:String):void;
	}
}