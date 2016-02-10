package com.ebillity.core.services.factories
{
	import mx.messaging.ChannelSet;
	import mx.messaging.channels.AMFChannel;
	import mx.messaging.channels.NetConnectionChannel;
	import mx.messaging.channels.SecureAMFChannel;
	import mx.rpc.remoting.RemoteObject;

	public class RemoteObjectFactory implements IRemoteObjectFactory
	{
		protected var channelSet:ChannelSet;

		public function RemoteObjectFactory( channelSet:ChannelSet = null )
		{
			this.channelSet = channelSet == null ? new ChannelSet() : channelSet;
		}

		public function addChannel( id:String, destination:String ):void
		{
			var channel:NetConnectionChannel;
			if ( id == "my-amf" )
			{
				channel = new AMFChannel( "my-amf", destination );
			}
			else if ( id == "my-secure-amf" )
			{
				channel = new SecureAMFChannel( "secure-amf", destination );
			}
			channelSet.addChannel( channel );
		}

		public function getRemoteObjectForService( destination:String, concurrency:String = "multiple", showBusyCursor:Boolean = true, makeObjectsBindable:Boolean = true ):RemoteObject
		{
			var service:RemoteObject = new RemoteObject( destination );
			service.channelSet = this.channelSet;
			service.concurrency = concurrency;
			service.showBusyCursor = showBusyCursor;
			service.makeObjectsBindable = true;
			return service;
		}

		public function destroy():void
		{
			this.channelSet = null;
		}
	}
}
