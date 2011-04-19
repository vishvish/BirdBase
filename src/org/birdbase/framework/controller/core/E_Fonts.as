package org.birdbase.framework.controller.core
{
	import flash.display.Sprite;
	import flash.net.URLRequest;
	import flash.system.ApplicationDomain;
	import flash.text.Font;
	import flash.utils.describeType;
	import flash.utils.getQualifiedClassName;
	
	import org.assetloader.loaders.SWFLoader;
	import org.assetloader.signals.*;
	import org.birdbase.framework.controller.boot.BootManagement;
	import org.birdbase.framework.model.Settings;
	import org.robotlegs.mvcs.Command;
	import org.robotlegs.utilities.statemachine.StateEvent;
	
	/**
	 * The fonts command loads a fonts.swf and registers the fonts for use.
	 *  
	 * @author	Vish Vishvanath
	 * @since	31 March 2011
	 * 
	 */
	public class E_Fonts extends Command
	{
		/**
		* 	The default name used for the bootstrap load process
		* 	to indicate a swf file contains fonts.
		*/
		public static const DEFAULT_FONTS_NAME:String = "fonts";
		
		private var _swfloader:SWFLoader;
		
		/**
		 *	@inheritDoc
		 */
		override public function execute():void
		{
			status();
			var fontPath:String = Settings.restricted.getSetting( "base" )
				+ Settings.restricted.getSetting( "fonts_file" );
			
			_swfloader = new SWFLoader( new URLRequest(	fontPath ), DEFAULT_FONTS_NAME );	
			_swfloader.onComplete.add( handleComplete );
			_swfloader.start();
		}

		/**
		 *	@private	
		 */
		private function handleError( signal:ErrorSignal ):void
		{
			error( signal.message );
		}
		
		/**
		* 	@private
		*/
		private function handleFontRegistration( o:Object, domain:ApplicationDomain ):void
		{
			var type:XML = null;
			var clazz:Class = null;

			try
			{
				clazz = domain.getDefinition( getQualifiedClassName( o ) ) as Class;
			}catch( e:Error )
			{
				throw e;
			}

			if( clazz )
			{
				type = describeType( clazz );
				var list:XMLList = type..variable;
				var x:XML = null;
				var re:RegExp = new RegExp( "Font$" );
				for each( x in list )
				{
					if( re.test( x.@name ) && x.@type == "Class" )
					{
						var value:Class = Class( clazz[ x.@name ] );
						if( value )
						{
							Font.registerFont( value );
						}
					}
				}
			}
		}		

		/**
		 *	@private	
		 */
		private function handleComplete( signal:LoaderSignal, data:Sprite ):void
		{
			status();
			var loader:SWFLoader = signal.loader as SWFLoader;
			if( loader != null )
			{			
				handleFontRegistration( data, data.loaderInfo.applicationDomain );
			}
			eventDispatcher.dispatchEvent( new StateEvent( StateEvent.ACTION, BootManagement.LOAD_FONTS_COMPLETE ) );
		}
	}
}