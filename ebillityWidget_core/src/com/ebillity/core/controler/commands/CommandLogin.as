package com.ebillity.core.controler.commands
{
	import com.adobe.serialization.json.JSON;
	import com.ebillity.core.controler.commands.base.CommandWebServiceBase;
	import com.ebillity.core.controler.commands.base.signal.SignalParams;
	import com.ebillity.core.controler.net.async.IPromise;
	import com.ebillity.core.controler.services.interfaces.ILoginService;
	import com.ebillity.core.model.dto.UserDTO;
	import com.ebillity.core.model.modelinfo.BaseInfoModelLocator;
	import com.ebillity.core.model.modelinfo.UserInfoModelLocator;

	public class CommandLogin extends CommandWebServiceBase
	{

		[Inject]
		public var service:ILoginService;

		[Inject]
		public var signalParams:SignalParams;

		[Inject]
		public var userModel:UserInfoModelLocator;

		[Inject]
		public var baseInfoModel:BaseInfoModelLocator;

		override public function execute():void
		{
			super.execute();

			//var promise:IPromise = service.loginUser( signalParams.paramsHolder[ "mail" ], signalParams.paramsHolder[ "password" ]);
			var promise:IPromise = service.loginUser( "ajsri77@gmail.com", "Sriram0304" );
			promise.completed.add( handleResult );
			promise.failed.add( handleError );
		}

		override protected function handleError( promise:IPromise ):void
		{
			super.handleError( promise );
		}

		override protected function handleResult( promise:IPromise ):void
		{
			super.handleResult( promise );

			var json:Object = com.adobe.serialization.json.JSON.decode( promise.result.result );

			var userDTO:UserDTO = new UserDTO();
			userDTO.userId = json.UserId;
			userDTO.sessionId = json.SessionId;

			userModel.userDTO = userDTO;
			baseInfoModel.loggedIn = true;
		}
	}
}

