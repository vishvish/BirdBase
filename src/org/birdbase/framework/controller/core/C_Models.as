package org.birdbase.framework.controller.core
{
	import org.birdbase.framework.controller.boot.BootManagement;
	import org.birdbase.framework.model.*;
	import org.birdbase.framework.service.*;
	import org.birdbase.framework.service.text.*;
	import org.birdbase.framework.signals.*;
	import org.robotlegs.mvcs.SignalCommand;
	import org.robotlegs.utilities.statemachine.StateEvent;
	
	/**
	 * The Models command adds the models and associated helpers to the Dependency Injection.
	 * 
	 * @author	Vish Vishvanath
	 * @since	31 March 2011
	 */
	public class C_Models extends SignalCommand
	{
		public function C_Models()
		{
			super();
		}
		
		/**
		 * @inheritDoc
		 */
		override public function execute():void
		{
			status();
			
			// map models
			
			injector.mapSingletonOf( IAssetModel, AssetModel );
			injector.mapSingletonOf( IConfigurationModel, ConfigurationModel );
			injector.mapSingletonOf( INavigationModel, NavigationModel );
			injector.mapSingletonOf( IConfigurationService, ConfigurationService );
			injector.mapSingletonOf( ITextService, TextService );
			injector.mapSingletonOf( IRSSModel, RSSModel );
			
			// map classes
			
			injector.mapClass( ListOfUpdateableTextComponents, ListOfUpdateableTextComponents );
			
			// end
			
			onComplete();
		}
		
		private function onComplete():void
		{
			eventDispatcher.dispatchEvent( 
				new StateEvent( StateEvent.ACTION, BootManagement.CONFIGURING_MODELS_COMPLETE ) );
		}
	}
}