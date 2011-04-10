package org.birdbase.framework.service.text
{
	import flash.utils.Dictionary;

	/**
	 * Describes a text service that accepts and registers ITextIsUpdateable objects against keys, and updates their
	 * text fields when the strings are loaded and ready.
	 * 
	 * @author	Vish Vishvanath
	 * @since	31 March 2011
	 */
	public interface ITextService
	{
		/**
		 * Register an ITextIsUpdateable object against a key. Accepts optional extra keys for the service to perform
		 * SprintF type replacements on the entire string.
		 *  
		 * @example				ITextService::register( view.textTF, "welcome_message",
		 *													"Gil Scott-Heron",
		 *													"61" );
		 * Where welcome_message = "Hello %s, you are %s years old. Welcome to the site!"
		 *
		 * 
		 * @param key	The id of the string this item is interested in.
		 * @param item	Reference to the ITextUpdatable.
		 * @param args
		 * @return 
		 */
		function register( item:IHaveUpdateableText, key:String, ...args ):Boolean;
		
		/**
		 * Removes an ITextIsUpdateable from the list of registered objects.
		 * 
		 * @param item
		 * @return 
		 */		
		function unregister( item:IHaveUpdateableText ):Boolean;

		/**
		 * The strings dictionary.
		 *  
		 * @param d
		 */
		function set strings( d:Dictionary ):void;
		
		/**
		 * Shortcut method to retrieve a string by its key.
		 *  
		 * @param key
		 * @return 
		 */
		function getString( key:String ):String;
	}
}