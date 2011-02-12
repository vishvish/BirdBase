package com.vishvish.demoApplication.view
{
	import flash.events.MouseEvent;
	
	import org.birdbase.framework.view.AbstractBirdbaseMediator;
	import org.osflash.signals.natives.NativeSignal;
	import com.vishvish.demoApplication.view.mediators.abstract.ApplicationMediator;

	/**
	 *	// TODO SecondViewMediator 
	 *	
	 *	// TODO @example 
	 *	
	 *	// TODO @exampleText 
	 *	
	 *	@author 	Vish Vishvanath
	 *	@email 		vish.vishvanath@gmail.com
	 *	@since 		11 January 2011
	 */
	public class SecondViewMediator extends ApplicationMediator
	{
		[Inject]
		/**
		 *	// TODO view 
		 */
		public var view:SecondView;
				
		/**
		 *	// TODO SecondViewMediator 
		 */
		public function SecondViewMediator()
		{
			super();
		}
		
		/**
		 *	// TODO onRegister 
		 *	
		 *	@return void	
		 */
		override public function onRegister():void
		{
			view.main();
			view.pushbuttonA.label = config.conf.yellowbutton;
			view.pushbuttonB.label = config.conf.purplebutton;
			
			var ns:NativeSignal = new NativeSignal( view.pushbuttonA, MouseEvent.CLICK, MouseEvent );
			ns.add( selectYellowPill );
			
			ns = new NativeSignal( view.pushbuttonB, MouseEvent.CLICK, MouseEvent );
			ns.add( selectPurplePill );
			
			view.textTF.text = "This is the second view of the application." +
				"<br/>You've already selected: " + 
				appModel.map.itemFor( "option1" ) + 
				".<br/>Choose an option below.";
		}
		
		/**
		 *	// TODO selectYellowPill 
		 *	
		 *	@param e 
		 *	
		 *	@return void	
		 */
		protected function selectYellowPill(e:MouseEvent):void
		{
			appModel.addParameter( "option2", "yellow" );
			viewState.viewName = "community";
			modifyApplicationState.dispatch();
		}
		
		/**
		 *	// TODO selectPurplePill 
		 *	
		 *	@param e 
		 *	
		 *	@return void	
		 */
		protected function selectPurplePill(e:MouseEvent):void
		{
			appModel.addParameter( "option2", "purple" );
			viewState.viewName = "community";
			modifyApplicationState.dispatch();
		}	
	}
}