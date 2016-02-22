package com.ebillity.core.view.ui.login
{
	import com.ebillity.core.controler.commands.base.signal.SignalParams;
	import flash.events.MouseEvent;
	import mx.controls.LinkButton;
	import mx.events.ValidationResultEvent;
	import mx.validators.EmailValidator;
	import mx.validators.Validator;
	import org.osflash.signals.Signal;
	import spark.components.Button;
	import spark.components.FormItem;
	import spark.components.Label;
	import spark.components.TextInput;
	import spark.components.supportClasses.SkinnableComponent;

	public class LoginView extends SkinnableComponent
	{

		[SkinPart( required = "true" )]
		public var email:TextInput;

		[SkinPart( required = "true" )]
		public var emailFormItem:FormItem;

		[SkinPart( required = "true" )]
		public var emailValidattor:EmailValidator;

		[Bindable]
		public var errorMessage:String;

		[SkinPart( required = "true" )]
		public var failCredential:spark.components.Label;

		public var forgotPassSignal:Signal = new Signal( SignalParams );

		[SkinPart( required = "true" )]
		public var forgotPassword:LinkButton;

		[SkinPart( required = "true" )]
		public var password:TextInput;

		[SkinPart( required = "true" )]
		public var passwordFormItem:FormItem;

		[SkinPart( required = "true" )]
		public var passwordValidator:Validator;

		[SkinPart( required = "true" )]
		public var submit:Button;

		public var submitSignal:Signal = new Signal( SignalParams );

		public function loginUser_faultHandler( errorMessage:String ):void
		{
			validateForm( errorMessage );
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
				case emailValidattor:
				{
					emailValidattor.addEventListener( ValidationResultEvent.VALID, validattor_validHandler );
					emailValidattor.addEventListener( ValidationResultEvent.INVALID, validattor_invalidHandler );
					break;
				}
				case passwordValidator:
				{
					passwordValidator.addEventListener( ValidationResultEvent.VALID, validattor_validHandler );
					passwordValidator.addEventListener( ValidationResultEvent.INVALID, validattor_invalidHandler );
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
				case emailValidattor:
				{
					emailValidattor.removeEventListener( ValidationResultEvent.VALID, validattor_validHandler );
					emailValidattor.removeEventListener( ValidationResultEvent.INVALID, validattor_invalidHandler );
					break;
				}
				case passwordValidator:
				{
					passwordValidator.removeEventListener( ValidationResultEvent.VALID, validattor_validHandler );
					passwordValidator.removeEventListener( ValidationResultEvent.INVALID, validattor_invalidHandler );
					break;
				}
			}
		}

		protected function submit_mouseClickHandler( event:MouseEvent ):void
		{
			var isValidForm:Boolean = validateForm();

			if ( !isValidForm )
				return;

			submitSignal.dispatch( new SignalParams( "mail", email.text, "password", password.text ));
		}

		protected function validattor_invalidHandler( event:ValidationResultEvent ):void
		{
			var validator:Validator = event.target as Validator;
			var source:TextInput = validator.source as TextInput;
			source.text = "";

			switch ( source )
			{
				case email:
				{
					emailFormItem.setStyle( "color", "red" );
					break;
				}
				case password:
				{
					passwordFormItem.setStyle( "color", "red" );
					break;
				}
			}
			failCredential.visible = true;
		}

		protected function validattor_validHandler( event:ValidationResultEvent ):void
		{
			var validator:Validator = event.target as Validator;
			var source:TextInput = validator.source as TextInput;

			switch ( source )
			{
				case email:
				{
					emailFormItem.setStyle( "color", "black" );
					break;
				}
				case password:
				{
					passwordFormItem.setStyle( "color", "black" );
					break;
				}
			}
			failCredential.visible = false;
		}

		private function clearForm():void
		{
			password.text = "";
			email.text = "";
		}

		private function validateForm( errorMessage:String = "" ):Boolean
		{
			if ( errorMessage )
			{
				this.clearForm();
				this.errorMessage = errorMessage;
				return false
			}

			var validationArray:Array = Validator.validateAll([ emailValidattor,passwordValidator ]);
			var isValidForm:Boolean = validationArray.length == 0;

			if ( !isValidForm )
			{
				var err:ValidationResultEvent;
				var errorMessageArray:Array = [];

				for each ( err in validationArray )
				{
					errorMessage += err.message;
					errorMessage += "\n";
				}
			}

			if ( errorMessage != "" )
			{
				this.errorMessage = errorMessage;
				return false
			}
			return true;
		}
	}
}
