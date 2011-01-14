/**
 * SWFAddress 2.4: Deep linking for Flash and Ajax <http://www.asual.com/swfaddress/>
 *
 * SWFAddress is (c) 2006-2009 Rostislav Hristov and contributors
 * This software is released under the MIT License <http://www.opensource.org/licenses/mit-license.php>
 *
 */

/**
 * @author Rostislav Hristov <http://www.asual.com>
 * @author Mark Ross <http://www.therossman.org>
 * @author Piotr Zema <http://felixz.marknaegeli.com>
 * @author Alex Petrescu <http://www.kilometer0.com>
 */
package org.birdbase.framework.utils.swfaddress {
	
	import flash.events.TimerEvent;
	import flash.external.ExternalInterface;
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	import flash.system.Capabilities;
	import flash.utils.Timer;
	
	import org.osflash.signals.Signal;
	
	
	/**
	 * SWFAddress class. 
	 */ 
	public class SWFAddress {
		
		private var _init:Boolean = false;
		private var _initChange:Boolean = false;
		private var _initChanged:Boolean = false;
		private var _strict:Boolean = true;
		private var _value:String = '';
		private var _queue:Array = new Array();
		private var _queueTimer:Timer = new Timer(10);
		private var _initTimer:Timer = new Timer(10);
		private var _availability:Boolean = ExternalInterface.available;
		
		/**
		 * Dispatched when <code>SWFAddress</code> initializes.
		 */
		public var init:Signal;
		/**
		 * Dispatched when any value change.
		 */
		public var change:Signal;
		/**
		 * Dispatched when value was changed by Flash.
		 */
		public var internalChange:Signal;
		/**
		 * Dispatched when value was changed by Browser.
		 */
		public var externalChange:Signal;
		
		public function SWFAddress() {
			init = new Signal();
			change = new Signal();
			internalChange = new Signal();
			externalChange = new Signal();
		}
		
		private function _initialize():Boolean {
			if (_availability) {
				try {
					_availability = 
						ExternalInterface.call('function() { return (typeof SWFAddress != "undefined"); }') 
						as Boolean;
					ExternalInterface.addCallback('getSWFAddressValue', 
						function():String {return _value});
					ExternalInterface.addCallback('setSWFAddressValue',
						_setValue);
				} catch (e:Error) {
					_availability = false;
				}
			}
			_queueTimer.addEventListener(TimerEvent.TIMER, _callQueue);      
			_initTimer.addEventListener(TimerEvent.TIMER, _check);
			_initTimer.start();
			return true;
		}
		private var _initializer:Boolean = _initialize();
		
		private function _check(event:TimerEvent):void {
			if ((init.numListeners > 0) && !_init) {
				_setValueInit(_getValue());
				_init = true;
			}
			
			if (change.numListeners > 0 || externalChange.numListeners > 0) {
				_initTimer.stop();
				_init = true;
				_setValueInit(_getValue());
			}
		}
		
		private function _strictCheck(value:String, force:Boolean):String {
			if (getStrict()) {
				if (force) {
					if (value.substr(0, 1) != '/') value = '/' + value;
				} else {
					if (value == '') value = '/';
				}
			}
			return value;
		}
		
		private function _getValue():String {
			var value:String, ids:String = null;
			if (_availability) { 
				value = ExternalInterface.call('SWFAddress.getValue') as String;
				var arr:Array = ExternalInterface.call('SWFAddress.getIds') as Array;
				if (arr != null)
					ids = arr.toString(); 
			}
			if (ids == null || !_availability || _initChanged) {
				value = _value;
			} else if (value == 'undefined' || value == null) {
				value = '';
			}
			return _strictCheck(value || '', false);
		}
		
		private function _setValueInit(value:String):void {
			_value = value;
			if (!_init) {
				init.dispatch();
			} else {
				change.dispatch();
				externalChange.dispatch();
			}
			_initChange = true;
		}    
		
		private function _setValue(value:String):void {    
			if (value == 'undefined' || value == null) value = '';
			if (_value == value && _init) return;
			if (!_initChange) return;
			_value = value;
			if (!_init) {
				_init = true;
				init.dispatch();
			}
			change.dispatch();
			externalChange.dispatch();
		}
		
		private function _callQueue(event:TimerEvent):void {
			if (_queue.length != 0) {
				var script:String = '';
				for (var i:int = 0, obj:Object; obj = _queue[i]; i++) {
					if (obj.param is String) obj.param = '"' + obj.param + '"';
					script += obj.fn + '(' + obj.param + ');';
				}
				_queue = new Array();
				navigateToURL(new URLRequest('javascript:' + script + 'void(0);'), '_self');
			} else {
				_queueTimer.stop();
			}
		}
		
		private function _call(fn:String, param:Object=''):void {
			if (_availability) {
				fn = "SWFAddress."+fn;
				if (Capabilities.os.indexOf('Mac') != -1) {
					if (_queue.length == 0) {
						_queueTimer.start();
					}
					_queue.push({fn: fn, param: param});
				} else {
					ExternalInterface.call(fn, param);
				}
			}
		}
		
		/**
		 * Loads the previous URL in the history list.
		 */
		public function back():void {
			_call('back');
		}
		
		/**
		 * Loads the next URL in the history list.
		 */
		public function forward():void {
			_call('forward');
		}
		
		/**
		 * Navigates one level up in the deep linking path.
		 */
		public function up():void {
			var path:String = getPath();
			setValue(path.substr(0, path.lastIndexOf('/', path.length - 2) + (path.substr(path.length - 1) == '/' ? 1 : 0)));
		}
		
		/**
		 * Loads a URL from the history list.
		 * @param delta An integer representing a relative position in the history list.
		 */
		public function go(delta:int):void {
			_call('go', delta);
		}
		
		/**
		 * Opens a new URL in the browser. 
		 * @param url The resource to be opened.
		 * @param target Target window.
		 */
		public function href(url:String, target:String = '_self'):void {
			if (_availability && Capabilities.playerType == 'ActiveX') {
				ExternalInterface.call('SWFAddress.href', url, target);
				return;
			}
			navigateToURL(new URLRequest(url), target);
		}
		
		/**
		 * Opens a browser popup window. 
		 * @param url Resource location.
		 * @param name Name of the popup window.
		 * @param options Options which get evaluted and passed to the window.open() method.
		 * @param handler Optional JavsScript handler code for popup handling.  
		 */
		public function popup(url:String, name:String='popup', options:String='""', handler:String=''):void {
			if (_availability && (Capabilities.playerType == 'ActiveX' || ExternalInterface.call('asual.util.Browser.isSafari'))) {
				ExternalInterface.call('SWFAddress.popup', url, name, options, handler);
				return;
			}
			navigateToURL(new URLRequest('javascript:popup=window.open("' + url + '","' + name + '",' + options + ');' 
				+ handler + ';void(0);'), '_self');
		}
		
		/**
		 * Provides the base address of the document. 
		 */
		public function getBaseURL():String {
			var url:String = null;
			if (_availability)
				url = String(ExternalInterface.call('SWFAddress.getBaseURL'));
			return (url == null || url == 'null' || !_availability) ? '' : url;
		}
		
		/**
		 * Provides the state of the strict mode setting. 
		 */
		public function getStrict():Boolean {
			var strict:String = null;
			if (_availability)
				strict = ExternalInterface.call('SWFAddress.getStrict') as String;
			return (strict == null) ? _strict : (strict == 'true');
		}
		
		/**
		 * Enables or disables the strict mode.
		 * @param strict Strict mode state.
		 */
		public function setStrict(strict:Boolean):void {
			_call('setStrict', strict);
			_strict = strict;
		}
		
		/**
		 * Provides the state of the history setting. 
		 */
		public function getHistory():Boolean {
			return (_availability) ? 
				ExternalInterface.call('SWFAddress.getHistory') as Boolean : false;
		}
		
		/**
		 * Enables or disables the creation of history entries.
		 * @param history History state.
		 */
		public function setHistory(history:Boolean):void {
			_call('setHistory', history);
		}
		
		/**
		 * Provides the tracker function.
		 */
		public function getTracker():String {
			return (_availability) ? 
				ExternalInterface.call('SWFAddress.getTracker') as String : '';
		}
		
		/**
		 * Sets a function for page view tracking. The default value is 'urchinTracker'.
		 * @param tracker Tracker function.
		 */
		public function setTracker(tracker:String):void {
			_call('setTracker', tracker);
		}
		
		/**
		 * Provides the title of the HTML document.
		 */
		public function getTitle():String {
			var title:String = (_availability) ? 
				ExternalInterface.call('SWFAddress.getTitle') as String : '';
			if (title == 'undefined' || title == null) title = '';
			return decodeURI(title);
		}
		
		/**
		 * Sets the title of the HTML document.
		 * @param title Title value.
		 */
		public function setTitle(title:String):void {
			_call('setTitle', encodeURI(decodeURI(title)));
		}
		
		/**
		 * Provides the status of the browser window.
		 */
		public function getStatus():String {
			var status:String = (_availability) ? 
				ExternalInterface.call('SWFAddress.getStatus') as String : '';
			if (status == 'undefined' || status == null) status = '';
			return decodeURI(status);
		}
		
		/**
		 * Sets the status of the browser window.
		 * @param status Status value.
		 */
		public function setStatus(status:String):void {
			_call('setStatus', encodeURI(decodeURI(status)));
		}
		
		/**
		 * Resets the status of the browser window.
		 */
		public function resetStatus():void {
			_call('resetStatus');
		}
		
		/**
		 * Provides the current deep linking value.
		 */
		public function getValue():String {
			return decodeURI(_strictCheck(_value || '', false));
		}
		
		/**
		 * Sets the current deep linking value.
		 * @param value A value which will be appended to the base link of the HTML document.
		 */
		public function setValue(value:String):void {
			if (value == 'undefined' || value == null) value = '';
			value = encodeURI(decodeURI(_strictCheck(value, true)));
			if (_value == value) return;
			_value = value;
			_call('setValue', value);
			if (_init) {
				change.dispatch();
				internalChange.dispatch();
			} else {
				_initChanged = true;
			}
		}
		
		/**
		 * Provides the deep linking value without the query string.
		 */
		public function getPath():String {
			var value:String = getValue();
			if (value.indexOf('?') != -1) {
				return value.split('?')[0];
			} else if (value.indexOf('#') != -1) {
				return value.split('#')[0];
			} else {
				return value;
			}
		}
		
		/**
		 * Provides a list of all the folders in the deep linking path.
		 */
		public function getPathNames():Array {
			var path:String = getPath();
			var names:Array = path.split('/');
			if (path.substr(0, 1) == '/' || path.length == 0)
				names.splice(0, 1);
			if (path.substr(path.length - 1, 1) == '/')
				names.splice(names.length - 1, 1);
			return names;
		}
		
		/**
		 * Provides the query string part of the deep linking value.
		 */
		public function getQueryString():String {
			var value:String = getValue();
			var index:Number = value.indexOf('?');
			if (index != -1 && index < value.length) {
				return value.substr(index + 1);
			}
			return null;
		}
		
		/**
		 * Provides the value of a specific query parameter as a string or array of strings.
		 * @param param Parameter name.
		 */
		public function getParameter(param:String):Object {
			var value:String = getValue();
			var index:Number = value.indexOf('?');
			if (index != -1) {
				value = value.substr(index + 1);
				var params:Array = value.split('&');
				var p:Array;
				var i:Number = params.length;
				var r:Array = new Array();
				while(i--) {
					p = params[i].split('=');
					if (p[0] == param) {
						r.push(p[1]);
					}
				}
				if (r.length != 0) {
					return r.length != 1 ? r : r[0];
				}
			}
			return null;
		}
		
		/**
		 * Provides a list of all the query parameter names.
		 */
		public function getParameterNames():Array {
			var value:String = getValue();
			var index:Number = value.indexOf('?');
			var names:Array = new Array();
			if (index != -1) {
				value = value.substr(index + 1);
				if (value != '' && value.indexOf('=') != -1) {
					var params:Array = value.split('&');
					var i:Number = 0;
					while(i < params.length) {
						names.push(params[i].split('=')[0]);
						i++;
					}
				}
			}
			return names;
		}
	}
}