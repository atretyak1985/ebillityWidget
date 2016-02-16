package com.ebillity.core.view.ui.core
{
	import com.ebillity.core.view.ui.controls.StatusLabel;

	import flash.events.MouseEvent;

	import spark.components.Button;
	import spark.components.supportClasses.SkinnableComponent;

	import org.osflash.signals.Signal;

	public class ApprovePanel extends SkinnableComponent
	{

		public static const STATE_APPROVED:String = "approved";

		public static const STATE_BILLED:String = "billed";

		public static const STATE_PENDING:String = "pending";

		public static const STATE_PREBILLED:String = "prebilled";

		public static const STATE_QUEUE:String = "queue";

		public static const STATE_SYNCED:String = "synced";


		[SkinPart( required = "true" )]
		public var rejectButton:Button;

		[SkinPart( required = "true" )]
		public var toPendingButton:Button;

		[SkinPart( required = "true" )]
		public var approveButton:Button;

		[SkinPart( required = "true" )]
		public var toQueueButton:Button;

		[SkinPart( required = "true" )]
		public var unQueueButton:Button;

		[SkinPart( required = "true" )]
		public var approveStatus:StatusLabel;

		[SkinPart( required = "true" )]
		public var syncStatus:StatusLabel;

		[SkinPart( required = "true" )]
		public var billStatus:StatusLabel;

		private var _state:String = STATE_PENDING;

		public function get state():String
		{
			return _state;
		}

		public function set state( value:String ):void
		{
			_state = value;
			approveStateSignal.dispatch( value );
			this.invalidateSkinState();
		}

		public var approveStateSignal:Signal = new Signal( String );

		override protected function getCurrentSkinState():String
		{
			return state;
		}

		override protected function partAdded( partName:String, instance:Object ):void
		{
			super.partAdded( partName, instance );

			switch ( instance )
			{
				case rejectButton:
				{
					rejectButton.addEventListener( MouseEvent.CLICK, button_clickEventHandler );
					break;
				}
				case toPendingButton:
				{
					toPendingButton.addEventListener( MouseEvent.CLICK, button_clickEventHandler );
					break;
				}
				case approveButton:
				{
					approveButton.addEventListener( MouseEvent.CLICK, button_clickEventHandler );
					break;
				}
				case toQueueButton:
				{
					toQueueButton.addEventListener( MouseEvent.CLICK, button_clickEventHandler );
					break;
				}
				case unQueueButton:
				{
					unQueueButton.addEventListener( MouseEvent.CLICK, button_clickEventHandler );
					break;
				}
			}
		}

		private function showRejectPopup():void
		{

		}

		protected function button_clickEventHandler( event:MouseEvent ):void
		{
			switch ( event.target )
			{
				case rejectButton:
				{
					showRejectPopup();
					break;
				}
				case toPendingButton:
				{
					state = STATE_PENDING;
					break;
				}
				case approveButton:
				{
					state = STATE_APPROVED;
					break;
				}
				case toQueueButton:
				{
					state = STATE_QUEUE;
					break;
				}
				case unQueueButton:
				{
					state = STATE_APPROVED;
					break;
				}
			}
		}

		override protected function partRemoved( partName:String, instance:Object ):void
		{
			super.partRemoved( partName, instance );

			switch ( instance )
			{
				case rejectButton:
				{
					rejectButton.removeEventListener( MouseEvent.CLICK, button_clickEventHandler );
					break;
				}
				case toPendingButton:
				{
					toPendingButton.removeEventListener( MouseEvent.CLICK, button_clickEventHandler );
					break;
				}
				case approveButton:
				{
					approveButton.removeEventListener( MouseEvent.CLICK, button_clickEventHandler );
					break;
				}
				case toQueueButton:
				{
					toQueueButton.removeEventListener( MouseEvent.CLICK, button_clickEventHandler );
					break;
				}
				case unQueueButton:
				{
					unQueueButton.removeEventListener( MouseEvent.CLICK, button_clickEventHandler );
					break;
				}
			}
		}
	}
}
