package org.birdbase.framework.service
{
	import flash.utils.Dictionary;

	public interface ITextService
	{
		function register( item:ITextIsUpdateable, key:String, ...args ):Boolean;
		function unregister( item:ITextIsUpdateable ):Boolean;
		
		function set strings( d:Dictionary ):void;
	}
}