package org.birdbase.framework.model.lists
{
	import org.birdbase.framework.service.ITextUpdateable;

	public interface IUpdateableTextComponent
	{
		
		function get item():ITextUpdateable;

		function set item( value:ITextUpdateable ):void;

		function get args():Array;

		function set args( value:Array ):void;
	}
}