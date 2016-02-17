package com.ebillity.core.controler.services
{
	import com.ebillity.core.controler.net.async.IPromise;
	import com.ebillity.core.controler.services.base.WebService;
	import com.ebillity.core.controler.services.interfaces.IDataService;

	import mx.rpc.remoting.RemoteObject;

	public class DataService extends WebService implements IDataService
	{
		/**
		 * The name of the remote service destination.
		 */
		public static const REMOTE_DESTINATION:String = "dataService";

		/**
		 * The RemoteObject will be injected in by Robotlegs. This is
		 * configured in MapService.
		 */
		[Inject( name = "DataService" )]
		public var service:RemoteObject;

		public function syncData( userId:int, sessionId:String, lastSyncedOn:*, resetSync:* ):IPromise
		{
			var promise:IPromise = this.callHttpService( "SyncData", { "UserId": userId, "SessionId": sessionId, "LastSyncedOn": lastSyncedOn, "resetSync": resetSync });
			return promise;
		}
	}
}
