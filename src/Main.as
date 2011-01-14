package
{
	import org.birdbase.application.MainContext;
	
	import flash.display.Sprite;
	
	/**
	 *	// TODO Main 
	 *	
	 *	// TODO @example 
	 *	
	 *	// TODO @exampleText 
	 *	
	 *	@author 	Vish Vishvanath
	 *	@email 		vish.vishvanath@gmail.com
	 *	@since 		11 January 2011
	 */
	[SWF(width="960", height="600", frameRate="31", backgroundColor="#F6F6F6")]
	public class Main extends Sprite
	{
		/**
		 *	// TODO context 
		 */
		protected var context:MainContext;
		
		/**
		 *	// TODO Main 
		 */
		public function Main()
		{
			context = new MainContext( this );
		}
	}
}
