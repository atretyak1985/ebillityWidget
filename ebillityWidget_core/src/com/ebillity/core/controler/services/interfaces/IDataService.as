package com.ebillity.core.controler.services.interfaces
{
	import com.ebillity.core.controler.net.async.IPromise;

	public interface IDataService
	{
		function syncData( userId:int, sessionId:String, lastSyncedOn:*, resetSync:* ):IPromise;
	}
}
