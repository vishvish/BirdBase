package org.birdbase.framework.model
{
	import flash.utils.Dictionary;
	import flash.utils.getDefinitionByName;
	
	import org.as3commons.logging.ILogger;
	import org.robotlegs.mvcs.Actor;
	
	/**
	 * While there is no particular need or desire to have BirdBase provide a conventional tree-like structure
	 * as HTML sites, and I would prefer Flash sites to be more free-flowing and non-linear, the reality is that
	 * navigation trees are here to stay.
	 * 
	 * And as BirdBase is designed to be a practical system, this is a model to assist site structure.
	 * 
	 * The NavigationModel holds the main navigation data configured in the configuration.yml file and returns
	 * classes for the correct view whenever requested. This is a speedy way to build up the site.
	 *  
	 * @author	Vish Vishvanath
	 * @since	11 February 2011
	 * 
	 */
	public class NavigationModel extends Actor
	{
		[Inject(name="birdbase")]
		public var logger:ILogger;
		
		[Inject]
		public var bm:BootstrapModel;
		
		protected var _navigation:Array;
		
		protected var _viewClassMap:Dictionary;
		
		protected var _viewMetadataMap:Dictionary;
		
		public function NavigationModel()
		{
			super();
		}
		
		[PostConstruct]
		public function init():void
		{
			_viewClassMap = new Dictionary();
			_viewMetadataMap = new Dictionary();
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
		
		/**
		 * Returns the Class for the specified view. The view and class name are linked in the configuration.yml file.
		 *  
		 * @param name
		 * @return 
		 * 
		 */
		public function getView( name:String ):Class
		{
			logger.debug( "NavigationModel::" + name + ": Found Class " +  _viewClassMap[ name ] );
			return _viewClassMap[ name ] as Class;
		}
		
		

		protected function mapView( destination:String, label:String, view:String ):void
		{
			try
			{
				var fqcn:String = bm.getPreference( "viewpath" ) + "::" + view
				var c:Class = getDefinitionByName( fqcn ) as Class;
				_viewClassMap[ destination ] = c;
				
			}
			catch( e:Error )
			{
				logger.error( e.message );
			}
		}
		
		/**
		 * Recursive function to trawl the navigation tree, although perfectly capable of traversing any other tree.
		 *  
		 * @param d
		 * @param parent
		 * 
		 */
		protected function iterateDictionary( d:Dictionary, parent:String = null ):void
		{
			for each( var item:* in d )
			{
				try
				{
					trace( "NavigationModel::iterateDictionary --> Item:", "/", parent, " --> ", item.label, "-->", item.view );
					mapView( item.destination, item.label, item.view )
					
					if( item.subviews )
					{
						for each( var subview:* in item.subviews )
						{
							iterateDictionary( subview, item.destination );
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
		
		public function get navigation():Array
		{
			return _navigation;
		}

		/**
		 * Whenever the navigation is set, we iterate through and add all the items into the model's map.
		 * 
		 * @param value
		 * 
		 */
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
	}
}