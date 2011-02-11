package org.birdbase.framework.controller.abstract
{
	import org.as3commons.logging.ILogger;
	import org.robotlegs.mvcs.Command;
	
	/**
	 *	// TODO BirdbaseCommand 
	 *	
	 *	// TODO @example 
	 *	
	 *	// TODO @exampleText 
	 *	
	 *	@author 	Vish Vishvanath
	 *	@email 		vish.vishvanath@gmail.com
	 *	@since 		11 January 2011
	 */
	public class BirdbaseCommand extends Command
	{
		[Inject(name="birdbase")]
		public var logger:ILogger;
		
		/**
		 *	// TODO BirdbaseCommand 
		 */
		public function BirdbaseCommand()
		{
			super();
		}
	}
}