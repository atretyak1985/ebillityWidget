package com.ebillity.core.view.mediator.login
{
	import com.ebillity.core.controler.commands.base.signal.SignalParams;
	import com.ebillity.core.controler.commands.signals.SignalLogin;
	import com.ebillity.core.model.dto.UserDTO;
	import com.ebillity.core.model.modelinfo.UserInfoModelLocator;
	import com.ebillity.core.view.ui.login.LoginView;

	import org.robotlegs.mvcs.Mediator;

	public class LoginViewMediator extends Mediator
	{

		[Inject]
		public var view:LoginView;

		[Inject]
		public var loginSignal:SignalLogin;

		[Inject]
		public var userModelLocator:UserInfoModelLocator;

		private function submitSignal_handler( params:SignalParams ):void
		{
			loginSignal.dispatch( params, null );
		}

		override public function onRegister():void
		{
			super.onRegister();
			userModelLocator.userDTOSignal.add( userDTOChanged_signalHandler );


			view.submitSignal.add( submitSignal_handler );
		}

		private function userDTOChanged_signalHandler( userDTO:UserDTO ):void
		{
		}

		override public function onRemove():void
		{
			super.onRemove();
			userModelLocator.userDTOSignal.remove( userDTOChanged_signalHandler );
		}
	}
}
