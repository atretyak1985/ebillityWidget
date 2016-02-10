package com.ebillity.core.view.ui.components
{
	import com.ebillity.core.constants.MenuConstants;
	import com.ebillity.core.controler.commands.base.signal.SignalParams;
	import flash.events.MouseEvent;
	import org.osflash.signals.Signal;
	import spark.components.Button;
	import spark.components.supportClasses.SkinnableComponent;

	public class Dashboard extends SkinnableComponent
	{

		[SkinPart( required = "true" )]
		public var addExpenseButton:Button;

		[SkinPart( required = "true" )]
		public var myEntriesButton:Button;

		public var selectMenuSignal:Signal = new Signal( SignalParams );

		[SkinPart( required = "true" )]
		public var settingsButton:Button;

		[SkinPart( required = "true" )]
		public var teamEntriesButton:Button;

		[SkinPart( required = "true" )]
		public var trackTimeButton:Button;

		protected function buttonMouseEvent_clickHandler( event:MouseEvent ):void
		{
			switch ( event.target )
			{
				case trackTimeButton:
				{
					selectMenuSignal.dispatch( new SignalParams( "selectManu", MenuConstants.TRACK_TIME ));
					break;
				}
				case addExpenseButton:
				{
					selectMenuSignal.dispatch( new SignalParams( "selectManu", MenuConstants.ADD_EXPENSE ));
					break;
				}
				case teamEntriesButton:
				{
					selectMenuSignal.dispatch( new SignalParams( "selectManu", MenuConstants.TEAM_ENTRIES ));
					break;
				}
				case myEntriesButton:
				{
					selectMenuSignal.dispatch( new SignalParams( "selectManu", MenuConstants.MY_ENTRIES ));
					break;
				}
				case settingsButton:
				{
					selectMenuSignal.dispatch( new SignalParams( "selectManu", MenuConstants.SETTINGS ));
					break;
				}
			}
		}

		override protected function getCurrentSkinState():String
		{
			return super.getCurrentSkinState();
		}

		override protected function partAdded( partName:String, instance:Object ):void
		{
			super.partAdded( partName, instance );

			switch ( instance )
			{
				case trackTimeButton:
				{
					trackTimeButton.addEventListener( MouseEvent.CLICK, buttonMouseEvent_clickHandler );
					break;
				}
				case addExpenseButton:
				{
					addExpenseButton.addEventListener( MouseEvent.CLICK, buttonMouseEvent_clickHandler );
					break;
				}
				case teamEntriesButton:
				{
					teamEntriesButton.addEventListener( MouseEvent.CLICK, buttonMouseEvent_clickHandler );
					break;
				}
				case myEntriesButton:
				{
					myEntriesButton.addEventListener( MouseEvent.CLICK, buttonMouseEvent_clickHandler );
					break;
				}
				case settingsButton:
				{
					settingsButton.addEventListener( MouseEvent.CLICK, buttonMouseEvent_clickHandler );
					break;
				}
			}
		}

		override protected function partRemoved( partName:String, instance:Object ):void
		{
			super.partRemoved( partName, instance );

			switch ( instance )
			{
				case trackTimeButton:
				{
					trackTimeButton.removeEventListener( MouseEvent.CLICK, buttonMouseEvent_clickHandler );
					break;
				}
				case addExpenseButton:
				{
					addExpenseButton.removeEventListener( MouseEvent.CLICK, buttonMouseEvent_clickHandler );
					break;
				}
				case teamEntriesButton:
				{
					teamEntriesButton.removeEventListener( MouseEvent.CLICK, buttonMouseEvent_clickHandler );
					break;
				}
				case myEntriesButton:
				{
					myEntriesButton.removeEventListener( MouseEvent.CLICK, buttonMouseEvent_clickHandler );
					break;
				}
				case settingsButton:
				{
					settingsButton.removeEventListener( MouseEvent.CLICK, buttonMouseEvent_clickHandler );
					break;
				}
			}
		}
	}
}
