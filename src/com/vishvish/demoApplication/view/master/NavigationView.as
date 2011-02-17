package com.vishvish.demoApplication.view.master
{
	import com.bit101.components.HBox;
	import com.bit101.components.VBox;
	import com.vishvish.demoApplication.view.components.NavigationButton;
	
	import flash.display.Sprite;
	import flash.utils.Dictionary;
	
	import org.birdbase.framework.action.Action;
	import org.birdbase.framework.view.IView;
	import org.birdbase.framework.view.helpers.ViewHelper;
	import org.osflash.signals.Signal;
	
	public class NavigationView extends Sprite implements IView
	{
		public var navigationContainer:HBox;
		
		public var helper:ViewHelper;

		public function NavigationView()
		{
			super();
		}
		
		
		public function main():void
		{
			
		}
		
		/**
		 * TODO refactor into a recursive function to iterate the entire navigation tree 
		 * 
		 */
		public function buildNavigation():void
		{
			var navigation:Array = helper.navigation;
			navigationContainer = new HBox( this );
			
			for( var i:int = 0; i < navigation.length; i++ )
			{
				// for every item in array, add item to hbox
				var item:Object = Dictionary( navigation[ i ] ).item;
				var action:Action = new Action( item.destination, item.label );
				
				if( item.subviews )
				{
					var vbox:VBox = new VBox( navigationContainer );
					var button:NavigationButton = new NavigationButton( vbox );
					button.action = action;
					navigationContainer.draw();
					for( var j:int = 0; j < item.subviews.length; j++ )
					{
						var button:NavigationButton = new NavigationButton( vbox );
						var action:Action = new Action( item.subviews[ j ].item.destination, item.subviews[j].item.label );
						button.action = action;
					}
				}
				else
				{
					var button:NavigationButton = new NavigationButton( navigationContainer );
					button.action = action;
					navigationContainer.draw();
				}
			}
			navigationContainer.draw();
		}

		public function show( signal:Signal ):void
		{
			// TODO Auto-generated method stub
		}

		public function hide( signal:Signal ):void
		{
			// TODO Auto-generated method stub
		}
		
		
		// unless item has subviews
		
		// in which case add vbox
		
		// add item for each subview to vbox
		
		// add subview item appear on rollover to parent
		
		// add subview item disappear on rollout of vbox
		
		
		
	}
}