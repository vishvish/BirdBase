package org.birdbase.framework.model
{
	import com.vishvish.demoApplication.view.*;
	
	import flash.utils.Dictionary;
	import flash.utils.getDefinitionByName;
	
	import org.as3commons.logging.ILogger;
	import org.robotlegs.mvcs.Actor;
	
	public class NavigationModel extends Actor
	{
		[Inject]
		public var logger:ILogger;
		
		[Inject]
		public var bm:BootstrapModel;
		
		private var _navigation:Array;
		
		private var _viewMap:Dictionary;
		
		public function NavigationModel()
		{
			super();
		}
		
		[PostConstruct]
		public function init():void
		{
			_viewMap = new Dictionary();
		}
		
		/**
		 * Returns a dictionary tree of navigation items for the specified view name.
		 *  
		 * @param item
		 * @return 
		 * 
		 */
//		public function getNavigationFor( item:String ):Dictionary
//		{
//			
//		}
		
		protected function iterateDictionary( d:Dictionary, parent:String = null ):void
		{
			for each( var item:* in d )
			{
				try
				{
//					trace( "NavigationModel::iterateDictionary --> Item:", "/", parent, "/", item.label, "-->", item.view );
					addView( item.destination, item.label, item.view )
					
					if( item.subviews )
					{
						for each( var subview:* in item.subviews )
						{
							iterateDictionary( subview, item.label );
						}
					}
				}
				catch( e:Error )
				{
					logger.error( e.message );
				}
				finally
				{
					
				}
			}
		}

		public function getView( name:String ):Class
		{
			logger.debug( "NavigationModel::" + name + ": Found Class " +  _viewMap[ name ] );
			return _viewMap[ name ] as Class;
		}

		private function addView( destination:String, label:String, view:String ):void
		{
			try
			{
				var fqcn:String = bm.getPreference( "viewpath" ) + "::" + view
				var c:Class = getDefinitionByName( fqcn ) as Class;
				_viewMap[ destination ] = c;
				
			}
			catch( e:Error )
			{
				logger.error( e.message );
			}
		}
		
		public function get navigation():Array
		{
			return _navigation;
		}

		public function set navigation( value:Array ):void
		{
			_navigation = value;
			var i:int = 0;
			while( i < _navigation.length )
			{
				iterateDictionary( _navigation[ i ] );
				i++;
			}
		}

		public function get viewMap():Object
		{
			return _viewMap;
		}
	}
}