package
{
	import com.vishvish.demoApplication.MainContext;
	
	import flash.display.Sprite;
	
	/**
	 *	Entry point for BirdBase application.
	 *	
	 *	@author 	Vish Vishvanath
	 *	@email 		vish.vishvanath@gmail.com
	 *	@since 		11 January 2011
	 */
	[SWF(width="960", height="600", frameRate="31", backgroundColor="#F6F6F6")]
	[Frame(factoryClass="org.birdbase.Preloader")]
	public class Main extends Sprite
	{
		protected var context:MainContext;
		
		public function Main()
		{
			context = new MainContext( this );
		}
	}
}
