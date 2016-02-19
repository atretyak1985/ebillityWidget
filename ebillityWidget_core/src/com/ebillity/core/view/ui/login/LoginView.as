package com.ebillity.core.view.ui.login
{
	import com.ebillity.core.controler.commands.base.signal.SignalParams;
	
	import flash.events.MouseEvent;
	import flash.sampler.NewObjectSample;
	
	import mx.controls.Alert;
	import mx.controls.Label;
	import mx.controls.LinkButton;
	import mx.events.ValidationResultEvent;
	import mx.validators.EmailValidator;
	import mx.validators.Validator;
	
	import org.osflash.signals.Signal;
	
	import spark.components.Button;
	import spark.components.Label;
	import spark.components.TextInput;
	import spark.components.supportClasses.SkinnableComponent;

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

		[SkinPart(required="true")]
		public var failCredential:spark.components.Label;
		
		[SkinPart (required="true")]
		public var emailValidattor:EmailValidator;
		[SkinPart (required="true")]
		public var passwordValidator:Validator;
		
		public var submitSignal:Signal = new Signal( SignalParams );

		public function loginUser_faultHandler( errorMessage:String ):void
		{
			//Alert.show( errorMessage );
			failCredential.visible=true;
			password.text="";
			email.text="";
			var event:ValidationResultEvent = new ValidationResultEvent(ValidationResultEvent.INVALID);
			emailValidattor.dispatchEvent(event);
			passwordValidator.dispatchEvent(event);
			//emailValidattor.validate();
			//passwordValidator.validate();
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
			var validationArray:Array = Validator.validateAll([emailValidattor,passwordValidator]);
			if(validationArray.length>0)
			{
				failCredential.visible=true;
				password.text="";
				email.text="";
				
				return;
			}
			submitSignal.dispatch( new SignalParams( "mail", email.text, "password", password.text ));
		}
	}
}
