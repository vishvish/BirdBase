package
{
	import com.tfto.birdbase.MainContext;
	
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
	[SWF(width="500", height="586", frameRate="31", backgroundColor="#666666")]
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
			trace( "MAIN::", this.loaderInfo.parameters[ "locale" ] );
		}
	}
}
