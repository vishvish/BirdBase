package org.birdbase.framework.service
{
	import flash.utils.Dictionary;
	
	import org.as3commons.collections.framework.IMapIterator;
	import org.as3commons.logging.ILogger;
	import org.birdbase.framework.model.lists.IUpdateableTextComponent;
	import org.birdbase.framework.model.lists.UpdateableTextComponentList;
	import org.birdbase.framework.utils.Sprintf;
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
		[Inject(name="birdbase")]
		public var logger:ILogger;
		
		[Inject]
		public var registeredComponents:UpdateableTextComponentList;
		
		protected var _strings:Dictionary;

		public function TextService()
		{
			super();
		}

		/**
		 *  ITextUpdatable components register with the text service here, by informing the service the id of the string
		 *	they wish to hold. These components are mapped to said id, as a key, and updated
		 * 
		 *	@param key	The id of the string this item is interested in.
		 *	@param item	Reference to the ITextUpdatable.
		 *	@return 
		 * 
		 */
		public function register( item:ITextUpdateable, key:String, ...args ):Boolean
		{
			if( item is ITextUpdateable )
			{
				if( registeredComponents.has( item ) )
				{
					logger.warn( "TextService::register --> This component " + item + " is already registered" );
					return false;
				}
				else
				{
					logger.debug( "TextService::register --> registering " + key );
					registeredComponents.addComponent( key, item, args );
					
					// if the strings are loaded when the component registers, update it straight away.
					if( _strings )
					{
						if( args.length > 0 )
						{
							item.text = Sprintf( _strings[ key], args );
						}
						else
						{
							item.text = _strings[ key ];
						}
					}
					return true;
				}
			}
			else
			{
				return false;
			}
		}

		public function unregister( item:ITextUpdateable ):Boolean
		{
			if( item is ITextUpdateable )
			{
				if( registeredComponents.has( item ) )
				{
					registeredComponents.remove( item );
					return true;
				}
				else
				{
					logger.warn( "TextService::updateComponents --> This component " + item + " is already registered" );
					return false;
				}
			}
			return false;
		}
		
		protected function updateComponents():void
		{
			if( registeredComponents.size > 0 && _strings )
			{
				while( registeredComponents.iterator().hasNext() )
				{
					var key:String = IMapIterator( registeredComponents.iterator().next() ).key as String;
					var component:IUpdateableTextComponent = IMapIterator( registeredComponents.iterator().next() ) as IUpdateableTextComponent;
					
					var string:String = _strings[ key ];

					if( component.args.length > 0 )
					{
						component.item.text = Sprintf( string, component.args );
					}
					else
					{
						component.item.text = string;
					}
				}
				logger.info( "TextService::updateComponents --> Finished updating " + registeredComponents.size + " components." );
			}
			else
			{
				logger.info( "TextService::updateComponents --> Not updating text components." );
			}
		}

		public function set strings( d:Dictionary ):void
		{
			_strings = d;
			updateComponents();
		}
	}
}