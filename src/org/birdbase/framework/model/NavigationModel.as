package org.birdbase.framework.model
{
	import com.asual.swfaddress.*;
	
	import flash.utils.Dictionary;
	import flash.utils.getDefinitionByName;
	
	import org.as3commons.collections.Map;
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
	public class NavigationModel extends Actor implements INavigationModel
	{
		[Inject]
		public var cm:IConfigurationModel;
		
		protected var _navigation:Array;
		
		protected var _viewClassMap:Map;

		protected var _viewDestinationMap:Map;
		
		public function NavigationModel()
		{
			super();
		}
		
		[PostConstruct]
		public function init():void
		{
			_viewClassMap = new Map();
			_viewDestinationMap = new Map();
		}
		
		/**
		 * @inheritDoc
		 */
		public function getViewForDestination( name:String ):Class
		{
			debug( name + ": Found Class " +  _viewClassMap[ name ] );
			return _viewClassMap.itemFor( name ) as Class;
		}

		/**
		 * @inheritDoc
		 */
		public function getDestinationForView( view:Class ):Array
		{
			return _viewDestinationMap.itemFor( view ) as Array;
		}
		
		/**
		 * @inheritDoc
		 */
		public function get navigationArray():Array
		{
			return _navigation;
		}
		
		public function set navigationArray( value:Array ):void
		{
			_navigation = value;
			var i:int = 0;
			while( i < _navigation.length )
			{
				searchTree( _navigation[ i ] );
				i++;
			}
		}
		
		/**
		 * @inheritDoc 
		 */
		public function _get( name:String ):*
		{
			try
			{
				return _navigation[ name ];
			}
			catch( e:Error )
			{
				error( e.message );
				return "This navigation element does not exist.";
			}
		}
		
		/**
		 *	Builds the internal maps for views and destinations.
		 *	
		 *	@param destination 
		 *	@param label 
		 *	@param view 
		 *	
		 *	@return void	
		 */
		protected function mapView( destination:Array, label:String, view:String ):void
		{
			try
			{
				var fqcn:String = Settings.restricted.getSetting( "view_package" ) + "::" + view
				var c:Class = getDefinitionByName( fqcn ) as Class;
				_viewClassMap.add( destination, c );
				_viewDestinationMap.add( c, destination );
			}
			catch( e:Error )
			{
				error( e.message + "-" + destination + "-" + label + "-" + view );
			}
		}
		
		/**
		 * Recursive function to trawl the navigation tree, although perfectly capable of traversing any other tree.
		 *  
		 * @param d
		 * @param parent
		 */
		protected function searchTree( d:Dictionary, parent:String = null ):void
		{
			for each( var item:* in d )
			{
				try
				{
					//info( item.label + ": " + item.view );
					mapView( item.destination, item.label, item.view )
					
					if( item.subviews )
					{
						for each( var subview:* in item.subviews )
						{
							searchTree( subview, item.destination );
						}
					}
				}
				catch( e:Error )
				{
					error( e.message );
				}
				finally
				{
					
				}
			}
		}
	}
}