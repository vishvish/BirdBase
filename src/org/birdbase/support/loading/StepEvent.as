package org.birdbase.support.loading
{
	import flash.events.Event;
	
	/**
	 * A load step event.
	 *  
	 * @author	Vish Vishvanath
	 * @since	30 March 2011
	 */
	public class StepEvent extends Event
	{
		private var _totalSteps:int;
		
		public static var NUMBER_STEPS:String = "NumberSteps";
		public static var STEP:String = "Step";
		
		public function StepEvent( type:String, totalSteps:int = 0 )
		{
			_totalSteps = totalSteps;
			
			super( type );
		}

		public function get totalSteps():int
		{
			return _totalSteps;
		}
	}
}