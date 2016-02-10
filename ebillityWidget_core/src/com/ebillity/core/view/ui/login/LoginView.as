package com.ebillity.core.view.ui.login
{

	import com.ebillity.core.controler.commands.base.signal.SignalParams;

	import flash.events.MouseEvent;

	import spark.components.Button;
	import spark.components.TextInput;
	import spark.components.supportClasses.SkinnableComponent;

	import org.osflash.signals.Signal;

	public class LoginView extends SkinnableComponent
	{

		[SkinPart( required = "true" )]
		public var email:TextInput;

		[SkinPart( required = "true" )]
		public var password:TextInput;

		[SkinPart( required = "true" )]
		public var submit:Button;

		public var submitSignal:Signal = new Signal( SignalParams );

		override protected function getCurrentSkinState():String
		{
			return super.getCurrentSkinState();
		}

		override protected function partAdded( partName:String, instance:Object ):void
		{
			super.partAdded( partName, instance );

			switch ( instance )
			{
				case submit:
				{
					submit.addEventListener( MouseEvent.CLICK, submit_mouseClickHandler );
					break;
				}

				default:
				{
					break;
				}
			}
		}

		protected function submit_mouseClickHandler( event:MouseEvent ):void
		{
			submitSignal.dispatch( new SignalParams( "email", email.text, "password", password.text ));
		}

		override protected function partRemoved( partName:String, instance:Object ):void
		{
			super.partRemoved( partName, instance );
		}
	}
}
