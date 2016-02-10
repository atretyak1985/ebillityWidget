package com.ebillity.core.controler.services.factories
{
	import mx.rpc.remoting.RemoteObject;

	public interface IRemoteObjectFactory
	{
		function addChannel( id:String, destination:String ):void;
		function getRemoteObjectForService( destination:String, concurrency:String = "multiple", showBusyCursor:Boolean = true, makeObjectsBindable:Boolean = true ):RemoteObject;
		function destroy():void;
	}
}
