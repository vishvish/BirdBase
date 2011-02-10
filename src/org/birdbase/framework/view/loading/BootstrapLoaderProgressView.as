package org.birdbase.framework.view.loading
{
	import com.bit101.components.ProgressBar;
	import com.bit101.components.Text;
	
	import flash.display.Sprite;
	
	import org.as3commons.logging.ILogger;
	import org.as3commons.logging.LoggerFactory;
	
	/**
	 *	// TODO LoadingUI 
	 *	
	 *	// TODO @example 
	 *	
	 *	// TODO @exampleText 
	 *	
	 *	@author 	Vish Vishvanath
	 *	@email 		vish.vishvanath@gmail.com
	 *	@since 		11 January 2011
	 */
	public class BootstrapLoaderProgressView extends Sprite
	{
		protected var _loadingProgress:ProgressBar;
		
		protected var _progress:Number;
		private var logger:ILogger;

		public function BootstrapLoaderProgressView()
		{
			super();
			logger = LoggerFactory.getLogger( "views" );
		}
		
		public function start():void
		{
			stop();	
			
			_progress = 0;
			_loadingProgress = new ProgressBar();
			_loadingProgress.width = 960;
			_loadingProgress.height = 600;
			_loadingProgress.maximum = 100;
			
			addChild( _loadingProgress );
		}
		
		public function update( progress:Number ):void
		{
//			logger.info( this.name + " LoadingView::update " + progress );
			_progress = progress;
			_loadingProgress.value = _progress;
		}
		
		public function stop( callback:Function = null ):void
		{
			if( _loadingProgress )
			{
				removeChild( _loadingProgress );
				_loadingProgress = null;
			}
			if( callback != null )
			{
				callback.call();
			}
		}
		
	}
}