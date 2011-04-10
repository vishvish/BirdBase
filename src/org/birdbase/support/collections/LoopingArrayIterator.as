package org.birdbase.support.collections
{
	import org.as3commons.collections.iterators.ArrayIterator;
	
	public class LoopingArrayIterator extends ArrayIterator
	{
		public function LoopingArrayIterator( array:Array, index:uint = 0 )
		{
			super( array, index );
		}
		
		override public function next():*
		{
			if( this.hasNext() )
			{
				return super.next();
			}
			else
			{
				this.start();
				return super.next();
			}
		}
		
		override public function previous():*
		{
			if( this.hasPrevious() )
			{
				return super.previous();
			}
			else
			{
				this.end();
				return super.previous();
			}
		}
	}
}