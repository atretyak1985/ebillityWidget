package com.ebillity.core.controler.commands
{
	import com.adobe.serialization.json.JSON;
	import com.ebillity.core.controler.commands.base.CommandWebServiceBase;
	import com.ebillity.core.controler.commands.base.signal.SignalParams;
	import com.ebillity.core.controler.net.async.IPromise;
	import com.ebillity.core.controler.services.interfaces.IDataService;
	import com.ebillity.core.model.dto.DataDTO;
	import com.ebillity.core.model.dto.UserDTO;
	import com.ebillity.core.model.modelinfo.BaseInfoModelLocator;
	import com.ebillity.core.model.modelinfo.ErrorsInfoModelLocator;
	import com.ebillity.core.model.modelinfo.DataInfoModelLocator;
	import com.ebillity.core.utils.JsonParseUtils;

	public class CommandSyncData extends CommandWebServiceBase
	{

		[Inject]
		public var service:IDataService;

		[Inject]
		public var signalParams:SignalParams;

		[Inject]
		public var dataModel:DataInfoModelLocator;

		[Inject]
		public var errorModel:ErrorsInfoModelLocator;

		override public function execute():void
		{
			super.execute();

			var userDTO:UserDTO = dataModel.userDTO;
			var sessionId:String = userDTO ? userDTO.sessionId : "";

			//var promise:IPromise = service.syncData( signalParams.paramsHolder[ "UserId" ], sessionId, signalParams.paramsHolder[ "LastSyncedOn" ], signalParams.paramsHolder[ "resetSync" ]);
			var promise:IPromise = service.syncData( 1108, sessionId, "0", null );

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
			var dataDTO:DataDTO = JsonParseUtils.getSyncDataFromJson( json );
			dataModel.syncData = dataDTO;
		}
	}
}

