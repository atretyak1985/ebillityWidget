package com.ebillity.core.view.mediator.login
{
	import com.ebillity.core.controler.commands.base.signal.SignalParams;
	import com.ebillity.core.controler.commands.signals.SignalLogin;
	import com.ebillity.core.model.dto.ErrorDTO;
	import com.ebillity.core.model.dto.UserDTO;
	import com.ebillity.core.model.modelinfo.ErrorsInfoModelLocator;
	import com.ebillity.core.model.modelinfo.DataInfoModelLocator;
	import com.ebillity.core.view.ui.login.LoginView;

	import org.robotlegs.mvcs.Mediator;

	public class LoginViewMediator extends Mediator
	{

		[Inject]
		public var loginSignal:SignalLogin;

		[Inject]
		public var dataModel:DataInfoModelLocator;

		[Inject]
		public var errorModel:ErrorsInfoModelLocator;

		[Inject]
		public var view:LoginView;

		override public function onRegister():void
		{
			super.onRegister();

			dataModel.userDTOSignal.add( userDTOChanged_signalHandler );
			errorModel.loginErrorSignal.add( loginError_signalHandler );

			view.submitSignal.add( submitSignal_viewHandler );
		}

		private function loginError_signalHandler( error:ErrorDTO ):void
		{
			view.loginUser_faultHandler( error.errorMessage );
		}

		override public function onRemove():void
		{
			super.onRemove();
			dataModel.userDTOSignal.remove( userDTOChanged_signalHandler );
			errorModel.loginErrorSignal.remove( loginError_signalHandler );

			view.submitSignal.remove( submitSignal_viewHandler );
		}

		private function submitSignal_viewHandler( params:SignalParams ):void
		{
			loginSignal.dispatch( params, null );
		}

		private function userDTOChanged_signalHandler( userDTO:UserDTO ):void
		{

		}
	}
}
