package org.birdbase.framework.service
{
	import flash.utils.Dictionary;

	public interface ITextService
	{
		function register( item:ITextUpdateable, key:String, ...args ):Boolean;
		function unregister( item:ITextUpdateable ):Boolean;
		
		function set strings( d:Dictionary ):void;
	}
}