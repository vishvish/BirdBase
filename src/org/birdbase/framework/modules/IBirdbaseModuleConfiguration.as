package org.birdbase.framework.modules
{
	public interface IBirdbaseModuleConfiguration
	{
		function get name():String;
		function set name( value:String ):void;
		
		function get preferencesFilename():String;
		function set preferencesFilename( value:String ):void;
	}
}