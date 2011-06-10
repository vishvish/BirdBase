package org.birdbase.framework.controller.core
{
	import org.birdbase.framework.controller.boot.BootManagement;
	import org.birdbase.framework.model.*;
	import org.birdbase.framework.service.*;
	import org.birdbase.framework.service.text.*;
	import org.robotlegs.mvcs.Command;
	import org.robotlegs.utilities.statemachine.StateEvent;
	
	/**
	 * The Models command adds the models and associated helpers to the Dependency Injection.
	 * 
	 * @author	Vish Vishvanath
	 * @since	31 March 2011
	 */
	public class C_Models extends Command
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
			
			// map classes
			
			injector.mapClass( UpdateableTextComponentList, UpdateableTextComponentList );
			
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