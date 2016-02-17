package com.ebillity.core.view.ui.login
{
	import com.ebillity.core.controler.commands.base.signal.SignalParams;

	import flash.events.MouseEvent;

	import mx.controls.Alert;
	import mx.controls.LinkButton;

	import spark.components.Button;
	import spark.components.TextInput;
	import spark.components.supportClasses.SkinnableComponent;

	import org.osflash.signals.Signal;

	public class LoginView extends SkinnableComponent
	{

		[SkinPart( required = "true" )]
		public var email:TextInput;

		public var forgotPassSignal:Signal = new Signal( SignalParams );

		[SkinPart( required = "true" )]
		public var forgotPassword:LinkButton;

		[SkinPart( required = "true" )]
		public var password:TextInput;

		[SkinPart( required = "true" )]
		public var submit:Button;

		public var submitSignal:Signal = new Signal( SignalParams );

		public function loginUser_faultHandler( errorMessage:String ):void
		{
			Alert.show( errorMessage );
		}

		protected function forgotPassword_mouseClickHandler( event:MouseEvent ):void
		{
			//forgotPassSignal.dispatch( new SignalParams( "email", email.text, "password", password.text ));
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
				case submit:
				{
					submit.addEventListener( MouseEvent.CLICK, submit_mouseClickHandler );
					break;
				}
				case forgotPassword:
				{
					forgotPassword.addEventListener( MouseEvent.CLICK, forgotPassword_mouseClickHandler );
					break;
				}
			}
		}

		override protected function partRemoved( partName:String, instance:Object ):void
		{
			super.partRemoved( partName, instance );

			switch ( instance )
			{
				case submit:
				{
					submit.removeEventListener( MouseEvent.CLICK, submit_mouseClickHandler );
					break;
				}
				case forgotPassword:
				{
					forgotPassword.removeEventListener( MouseEvent.CLICK, forgotPassword_mouseClickHandler );
					break;
				}
			}
		}

		protected function submit_mouseClickHandler( event:MouseEvent ):void
		{
			submitSignal.dispatch( new SignalParams( "mail", email.text, "password", password.text ));
		}
	}
}
