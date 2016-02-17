package com.ebillity.core.controler.commands
{
	import com.adobe.serialization.json.JSON;
	import com.ebillity.core.controler.commands.base.CommandWebServiceBase;
	import com.ebillity.core.controler.commands.base.signal.SignalParams;
	import com.ebillity.core.controler.net.async.IPromise;
	import com.ebillity.core.controler.services.interfaces.ILoginService;
	import com.ebillity.core.model.dto.ErrorDTO;
	import com.ebillity.core.model.dto.UserDTO;
	import com.ebillity.core.model.modelinfo.BaseInfoModelLocator;
	import com.ebillity.core.model.modelinfo.ErrorsInfoModelLocator;
	import com.ebillity.core.model.modelinfo.DataInfoModelLocator;

	public class CommandLogin extends CommandWebServiceBase
	{

		[Inject]
		public var service:ILoginService;

		[Inject]
		public var signalParams:SignalParams;

		[Inject]
		public var dataModel:DataInfoModelLocator;

		[Inject]
		public var errorModel:ErrorsInfoModelLocator;

		[Inject]
		public var baseInfoModel:BaseInfoModelLocator;

		override public function execute():void
		{
			super.execute();

			//var promise:IPromise = service.loginUser( signalParams.paramsHolder[ "mail" ], signalParams.paramsHolder[ "password" ]);
			var promise:IPromise = service.loginUser( "ajsri77@gmail.com", "Sriram0304" );
			//var promise:IPromise = service.loginUser( "QBO19@mailinator.com", "Test123" );
			promise.completed.add( handleResult );
			promise.failed.add( handleError );
		}

		override protected function handleError( promise:IPromise ):void
		{
			super.handleError( promise );

			var json:Object = com.adobe.serialization.json.JSON.decode( promise.error.fault.content );

			var errrorDTO:ErrorDTO = new ErrorDTO();
			errrorDTO.errorId = -1;
			errrorDTO.errorMessage = json.Message;
			errorModel.loginError = errrorDTO;
		}

		override protected function handleResult( promise:IPromise ):void
		{
			super.handleResult( promise );

			var json:Object = com.adobe.serialization.json.JSON.decode( promise.result.result );

			if ( json.ErrorId == 0 )
			{
				var userDTO:UserDTO = new UserDTO();
				userDTO.userId = json.UserId;
				userDTO.sessionId = json.SessionId;
				dataModel.userDTO = userDTO;

				baseInfoModel.loggedIn = true;
			}
			else
			{
				var errrorDTO:ErrorDTO = new ErrorDTO();
				errrorDTO.errorId = json.ErrorId;
				errrorDTO.errorMessage = json.ErrorMessage;
				errorModel.loginError = errrorDTO;
			}
		}
	}
}

