package org.birdbase.framework.model.lists
{
	import org.birdbase.framework.service.ITextIsUpdateable;

	public interface IUpdateableTextListComponent
	{
		
		function get item():ITextIsUpdateable;

		function set item( value:ITextIsUpdateable ):void;

		function get args():Array;

		function set args( value:Array ):void;
	}
}