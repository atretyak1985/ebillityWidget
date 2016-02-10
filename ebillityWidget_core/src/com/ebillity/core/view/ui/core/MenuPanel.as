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

		[SkinPart( required = "true" )]
		public var menuButton:PopUpMenuButton;

		public var selectMenuSignal:Signal = new Signal( SignalParams );

		override protected function getCurrentSkinState():String
		{
			return super.getCurrentSkinState();
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
