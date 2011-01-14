package org.birdbase.application.controller
{
	import org.as3commons.logging.ILogger;
	import org.birdbase.application.controller.state.ApplicationStateChangedCommand;
	import org.birdbase.application.view.MainContainerView;
	import org.birdbase.framework.model.PreferencesModel;
	import org.birdbase.framework.utils.swfaddress.SWFAddress;
	import org.birdbase.modules.slideshow.SlideshowContext;
	import org.birdbase.modules.slideshow.controller.LoadSlideshowCommand;
	import org.birdbase.modules.slideshow.signals.LoadSlideshow;
	import org.osflash.signals.Signal;
	import org.robotlegs.mvcs.SignalCommand;

	/**
	 *	// TODO ApplicationBootstrapCommand 
	 *	
	 *	// TODO @example 
	 *	
	 *	// TODO @exampleText 
	 *	
	 *	@author 	Vish Vishvanath
	 *	@email 		vish.vishvanath@gmail.com
	 *	@since 		11 January 2011
	 */
	public class ApplicationBootstrapCommand extends SignalCommand
	{
		[Inject]
		public var logger:ILogger;
		
		[Inject]
		public var pm:PreferencesModel;
		
		[Inject]
		public var swfAddress:SWFAddress;
		
		/**
		 *	// TODO execute 
		 *	
		 *	@return void	
		 */
		override public function execute():void
		{
			logger.info( "ApplicationBootstrapCommand::execute" );
			
			logger.info( "Birdbase is handing control over to the Application: Booting..." );
			logger.info( "Author: " + pm.getProperty( "application.author" ) );
			logger.info( "Version: " + pm.getProperty( "application.version" ) );
			
//			signalCommandMap.mapSignalClass( LoadSlideshow, LoadSlideshowCommand );
			
			var view:MainContainerView = new MainContainerView();
			contextView.addChild( view );
			var s:Signal = new Signal();
			s.add( function():void 
			{
				signalCommandMap.mapSignal( swfAddress.change, ApplicationStateChangedCommand );
			});
			view.show( s );
			
//			var slideshowContext:SlideshowContext = new SlideshowContext( contextView, injector );
//			injector.mapValue( SlideshowContext, slideshowContext );
		}
		
	}
}