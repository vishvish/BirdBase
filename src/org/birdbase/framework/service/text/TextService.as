package org.birdbase.framework.service.text
{
	import flash.utils.Dictionary;
	
	import org.as3commons.collections.framework.IMapIterator;
	import org.birdbase.support.utils.Sprintf;
	import org.robotlegs.mvcs.Actor;

	/**
	 * This service allows text components to register with it, and have their text property automatically
	 * updated when the service is loaded or refreshed.
	 * 
	 * @author	Vish Vishvanath
	 * @since	13 February 2011
	 * 
	 */
	public class TextService extends Actor implements ITextService
	{
		[Inject]
		public var registeredComponents:UpdateableTextComponentList;

		protected var _strings:Dictionary;

		public function TextService()
		{
			super();
		}

		/**
		 * @inheritDoc
		 */
		public function register( item:IHaveUpdateableText, key:String, ...args ):Boolean
		{
			if( item == null )
			{
				return false;
			}
			
			if( registeredComponents.has( item ) )
			{
				warn( "This component " + item + " is already registered" );
			}
			else
			{			
				registeredComponents.addComponent( key, item, args );
			
				if( _strings != null )
				{
					var value:String = _strings[ key ] as String;
					if( value != null )
					{
						if( args.length > 0 )
						{
							item.setText( Sprintf( value, args ) );
						}
						else
						{
							item.setText( value );
						}
					
						return true;
					}else{
						error( "No string available for key '" + key + "'." );
					}
				}else{
					error( "No string information available." );
				}
			}
			
			return false;
		}
		
		/**
		 * @inheritDoc
		 */
		public function unregister( item:IHaveUpdateableText ):Boolean
		{
			if( item is IHaveUpdateableText )
			{
				if( registeredComponents.has( item ) )
				{
					registeredComponents.remove( item );
					return true;
				}
				else
				{
					warn( "This component " + item + " is not registered" );
					return false;
				}
			}
			return false;
		}
		
		/**
		 * Internal method that iterates through all registered objects and updates their text fields with the
		 * appropriate string. 
		 */
		protected function updateComponents():void
		{
			if( registeredComponents.size > 0 && _strings )
			{
				while( registeredComponents.iterator().hasNext() )
				{
					var key:String = IMapIterator( registeredComponents.iterator().next() ).key as String;
					var component:IUpdateableTextComponent 
						= IMapIterator( registeredComponents.iterator().next() ) as IUpdateableTextComponent;
					
					var string:String = _strings[ key ];

					if( component.args.length > 0 )
					{
						component.item.setText( Sprintf( string, component.args ) );
					}
					else
					{
						component.item.setText( string );
					}
				}
				debug( "Finished updating " + registeredComponents.size + " components." );
			}
			else
			{
				debug( "Not updating text components." );
			}
		}
		
		/**
		 * @inheritDoc
		 */
		public function set strings( d:Dictionary ):void
		{
			_strings = d;
			updateComponents();
		}
		
		/**
		 * @inheritDoc
		 */
		public function getString( key:String ):String
		{
			if( _strings[ key ] )
			{
				return _strings[ key ];
			}
			else
			{
				return "No String";
			}
		}
	}
}