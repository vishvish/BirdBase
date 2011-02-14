package org.birdbase.framework.service
{
	import flash.utils.Dictionary;

	public interface ITextService
	{
		function register( key:String, item:ITextUpdatable ):Boolean;
		function unregister( item:ITextUpdatable ):Boolean;
		
		function set strings( d:Dictionary ):void;
	}
}