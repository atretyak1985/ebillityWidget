package com.ebillity.core.view.ui.core
{
	import com.ebillity.core.constants.MenuConstants;
	import com.ebillity.core.controler.commands.base.signal.SignalParams;
	
	import mx.controls.PopUpMenuButton;
	import mx.events.MenuEvent;
	
	import org.osflash.signals.Signal;
	
	import spark.components.Button;
	import spark.components.Label;
	import spark.components.supportClasses.SkinnableComponent;

	public class MenuPanel extends SkinnableComponent
	{
		public static const STATE_FIRM:String = "firms";

		public static const STATE_MENU:String = "menu";

		[SkinPart( required = "true" )]
		public var header:Label;

		[SkinPart( required = "true" )]
		public var menu:PopUpMenuButton;

		[Bindable]
		public var headerText:String;
		
		[SkinPart( required = "true" )]
		public var backButton:Button;
		

		public var selectMenuSignal:Signal = new Signal( SignalParams );

		private var _firmName:String;

		private var _isFirmName:Boolean;

		private var _state:String = STATE_MENU;

		[Bindable]
		public function get firmName():String
		{
			return _firmName;
		}

		public function set firmName( value:String ):void
		{
			if ( _firmName != value )
			{
				_firmName = value;
				_isFirmName = true;
				this.invalidateProperties();
			}
		}

		public function selectMenu( selectedMenu:String ):void
		{
			if ( !menu )
				return;

			if ( selectedMenu != menu.selectedField )
			{
				menu.selectedField = selectedMenu;
				changeHeader( selectedMenu );
			}

		}

		public function get state():String
		{
			return _state;
		}

		public function set state( value:String ):void
		{
			_state = value;
			this.invalidateSkinState();
		}

		override protected function commitProperties():void
		{
			if ( _isFirmName )
			{
				_isFirmName = false;
				this.headerText = _firmName;
			}

			super.commitProperties();
		}

		override protected function getCurrentSkinState():String
		{
			return state;
		}

		private function changeHeader( value:String ):void
		{
			//change header name
			switch ( value )
			{
				case MenuConstants.DASHBOARD:
				{
				
					backButton.visible=false;
					this.headerText = _firmName;
					break;
				}
				case MenuConstants.ADD_EXPENSE:
				{
					backButton.visible=true;
					this.headerText = "Expense Entry";
					break;
				}
				case MenuConstants.TRACK_TIME:
				{
					backButton.visible=true;
					this.headerText = "Time Entry";
					break;
				}
				case MenuConstants.TEAM_ENTRIES:
				{
					backButton.visible=true;
					this.headerText = "Manage Team Entries";
					break;
				}
				case MenuConstants.MY_ENTRIES:
				{
					backButton.visible=true;
					this.headerText = "Manage My Entries";
					break;
				}
				case MenuConstants.MY_ENTRIES:
				{
					backButton.visible=true;
					this.headerText = "Settings";
					break;
				}
			}
		}

		protected function menuButton_itemClickHandler( event:MenuEvent ):void
		{
			var selectedMenu:String = event.item && event.item.hasOwnProperty( "id" ) ? event.item.id : "";
			selectMenuSignal.dispatch( new SignalParams( "selectManu", selectedMenu ));

			changeHeader( selectedMenu );
		}

		override protected function partAdded( partName:String, instance:Object ):void
		{
			super.partAdded( partName, instance );

			switch ( instance )
			{
				case menu:
				{	
					menu.dataProvider = MenuConstants.ALL_ADMIN_MENU;
					menu.addEventListener( MenuEvent.ITEM_CLICK, menuButton_itemClickHandler );
					break;
				}
			}
		}

		override protected function partRemoved( partName:String, instance:Object ):void
		{
			super.partRemoved( partName, instance );

			switch ( instance )
			{
				case menu:
				{
					menu.removeEventListener( MenuEvent.ITEM_CLICK, menuButton_itemClickHandler );
					break;
				}
			}
		}
	}
}
