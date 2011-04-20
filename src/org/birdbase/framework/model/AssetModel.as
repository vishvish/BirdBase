package org.birdbase.framework.model
{
	import flash.display.DisplayObject;
	
	import org.assetloader.core.IAssetLoader;
	import org.assetloader.signals.*;
	import org.birdbase.framework.controller.boot.BootManagement;
	import org.birdbase.support.utils.DynamicSprite;
	import org.robotlegs.mvcs.Actor;
	import org.robotlegs.utilities.statemachine.StateEvent;
	
	/**
	 * Implements a model class to load and retain design/media assets
	 * 
	 * @author	Vish Vishvanath
	 * @since	31 March 2011
	 * 
	 */
	public class AssetModel extends Actor implements IAssetModel
	{
		[Inject]
		public var settings:Settings;

		[Inject(name="loaded")]
		public var assetLoader:IAssetLoader;

		public function AssetModel()
		{
			super();
		}
		
		[PostConstruct]
		public function init():void
		{
			assetLoader.onConfigLoaded.add( onConfigLoaded );
			assetLoader.onError.add( onError );
			assetLoader.onComplete.add( onComplete );
			
			var BASE:String = 				settings.getSetting( "base" );
			var DYNAMIC_LIBRARY:String = 	settings.getSetting( "dynamic_library" );
			var assets:Array = 				settings.getSetting( "assets" );
			
			var loaderConfig:XML =
				<loader base={BASE} preventCache="true" >	
				</loader>;
			
			var it:Object = null;
			var key:String = null;
			var uri:String = null;
			for( var i:int = 0;i < assets.length;i++ )
			{
				it = assets[ i ].item;
				key = it.key;
				uri = it.uri;
				loaderConfig.appendChild( <asset id={key} src={uri} /> );
			}
			assetLoader.addConfig( loaderConfig );
			assetLoader.start();
		}
		
		/**
		 * @inheritDoc
		 */
		public function getAssetById( id:String ):*
		{
			return assetLoader.getAsset( id );
		}
		
		/**
		 * @private
		 */
		protected function onConfigLoaded( signal:LoaderSignal ):void
		{
			info();
			signal.loader.start();
			assetLoader.onConfigLoaded.remove( onConfigLoaded );
		}
		
		/**
		 * @private
		 */
		protected function onError( signal:ErrorSignal ):void
		{
			error( signal.message + " / " + signal.loader.request );
		}

		/**
		 * @private
		 */
		protected function onComplete( signal:LoaderSignal, data:* ):void
		{
			for( var s:String in data )
			{				
				if( s.indexOf( "dynamic" ) == 0 )
				{
					DynamicSprite.update( s, assetLoader.getAsset( s ) as DisplayObject );
				}	
			}
			// fires event to hand control back to BootManagement.
			eventDispatcher.dispatchEvent( new StateEvent( StateEvent.ACTION, BootManagement.LOAD_ASSETS_COMPLETE ) );
		}
	}
}