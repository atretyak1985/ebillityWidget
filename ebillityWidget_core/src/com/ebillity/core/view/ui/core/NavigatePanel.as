package com.ebillity.core.view.ui.core
{
	import flash.events.MouseEvent;

	import spark.components.supportClasses.SkinnableComponent;

	import org.osflash.signals.Signal;
	import com.ebillity.core.view.ui.controls.ColorButton;

	public class NavigatePanel extends SkinnableComponent
	{

		public static const BUTTON_1:String = "button1";

		public static const BUTTON_2:String = "button2";

		public static const BUTTON_3:String = "button3";

		[SkinPart( required = "true" )]
		public var button1:ColorButton;

		public var button1ClickSignal:Signal = new Signal( String );

		[SkinPart( required = "true" )]
		public var button2:ColorButton;

		public var button2ClickSignal:Signal = new Signal( String );

		[SkinPart( required = "true" )]
		public var button3:ColorButton;

		public var button3ClickSignal:Signal = new Signal( String );

		[SkinPart( required = "true" )]
		public var recycleBin:ColorButton;

		private var _isLabel1Changed:Boolean;

		private var _isLabel2Changed:Boolean;

		private var _isLabel3Changed:Boolean;

		private var _label1:String;

		private var _label2:String;

		private var _label3:String;

		public function set label1( value:String ):void
		{
			if ( _label1 != value )
			{
				_label1 = value;
				_isLabel1Changed = true;
				this.invalidateProperties();
			}
		}

		public function set label2( value:String ):void
		{
			if ( _label2 != value )
			{
				_label2 = value;
				_isLabel2Changed = true;
				this.invalidateProperties();
			}
		}

		public function set label3( value:String ):void
		{
			if ( _label3 != value )
			{
				_label3 = value;
				_isLabel3Changed = true;
				this.invalidateProperties();
			}
		}

		protected function button_clickEventHandler( event:MouseEvent ):void
		{
			switch ( event.target )
			{
				case button1:
				{
					button1ClickSignal.dispatch( BUTTON_1 );
					break;
				}
				case button2:
				{
					button2ClickSignal.dispatch( BUTTON_2 );
					break;
				}
				case button3:
				{
					button3ClickSignal.dispatch( BUTTON_3 );
					break;
				}
			}
		}

		override protected function commitProperties():void
		{
			super.commitProperties();

			if ( _isLabel1Changed )
			{
				_isLabel1Changed = false;
				button1.label = _label1;
				button1.visible = button1.includeInLayout = _label1 && _label1 != "";
			}

			if ( _isLabel2Changed )
			{
				_isLabel2Changed = false;
				button2.label = _label2;
				button2.visible = button2.includeInLayout = _label2 && _label2 != "";
			}

			if ( _isLabel3Changed )
			{
				_isLabel3Changed = false;
				button3.label = _label3;
				button3.visible = button3.includeInLayout = _label3 && _label3 != "";
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
				case button1:
				{
					button1.addEventListener( MouseEvent.CLICK, button_clickEventHandler );
					break;
				}
				case button2:
				{
					button2.addEventListener( MouseEvent.CLICK, button_clickEventHandler );
					break;
				}
				case button3:
				{
					button3.addEventListener( MouseEvent.CLICK, button_clickEventHandler );
					break;
				}
			}
		}

		override protected function partRemoved( partName:String, instance:Object ):void
		{
			super.partRemoved( partName, instance );

			switch ( instance )
			{
				case button1:
				{
					button1.removeEventListener( MouseEvent.CLICK, button_clickEventHandler );
					break;
				}
				case button2:
				{
					button2.removeEventListener( MouseEvent.CLICK, button_clickEventHandler );
					break;
				}
				case button3:
				{
					button3.removeEventListener( MouseEvent.CLICK, button_clickEventHandler );
					break;
				}
			}
		}
	}
}
