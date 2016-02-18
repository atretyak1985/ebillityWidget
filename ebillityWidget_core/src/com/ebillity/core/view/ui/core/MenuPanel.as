package com.ebillity.core.view.ui.core
{
	import com.ebillity.core.constants.MenuConstants;
	import com.ebillity.core.controler.commands.base.signal.SignalParams;

	import mx.controls.PopUpMenuButton;
	import mx.events.MenuEvent;

	import spark.components.supportClasses.SkinnableComponent;

	import org.osflash.signals.Signal;

	public class MenuPanel extends SkinnableComponent
	{
		public static const STATE_FIRM:String = "firm";

		public static const STATE_MENU:String = "menu";

		[SkinPart( required = "true" )]
		public var menuButton:PopUpMenuButton;

		public var selectMenuSignal:Signal = new Signal( SignalParams );

		private var _state:String = STATE_MENU;

		public function get state():String
		{
			return _state;
		}

		public function set state( value:String ):void
		{
			_state = value;
			this.invalidateSkinState();
		}

		override protected function getCurrentSkinState():String
		{
			return state;
		}

		protected function menuButton_itemClickHandler( event:MenuEvent ):void
		{
			var selectedMenu:String = event.item && event.item.hasOwnProperty( "id" ) ? event.item.id : "";
			selectMenuSignal.dispatch( new SignalParams( "selectManu", selectedMenu ));
		}

		override protected function partAdded( partName:String, instance:Object ):void
		{
			super.partAdded( partName, instance );

			switch ( instance )
			{
				case menuButton:
				{
					menuButton.dataProvider = MenuConstants.ALL_ADMIN_MENU;
					menuButton.addEventListener( MenuEvent.ITEM_CLICK, menuButton_itemClickHandler );
					break;
				}
			}
		}

		override protected function partRemoved( partName:String, instance:Object ):void
		{
			super.partRemoved( partName, instance );

			switch ( instance )
			{
				case menuButton:
				{
					menuButton.removeEventListener( MenuEvent.ITEM_CLICK, menuButton_itemClickHandler );
					break;
				}
			}
		}

		public function selectMenu( selectedMenu:String ):void
		{
			if ( !menuButton )
				return;

			if ( selectedMenu != menuButton.selectedField )
				menuButton.selectedField = selectedMenu;

		}
	}
}
