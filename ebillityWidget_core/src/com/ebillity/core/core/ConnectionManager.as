package com.ebillity.core.core
{

	import mx.collections.ArrayCollection;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;

	import org.osflash.signals.ISignal;
	import org.osflash.signals.Signal;

	[Bindable]
	public class ConnectionManager
	{
		public static const CONNECTION_URL:String = "http://qa.ebillity.com/restservice/api/mobile/";

		private static var _instance:ConnectionManager;

		public static function getInstance():ConnectionManager
		{
			if ( _instance == null )
			{
				_instance = new ConnectionManager();
			}
			return _instance;
		}

		public function ConnectionManager()
		{
			_changed = new Signal();
		}

		public var accColor:ArrayCollection = new ArrayCollection();

		public var clientVersionDate:String;

		public var conString:String = CONNECTION_URL;

		public var conStringIIS:String;

		public var debugFlag:String;

		public var imgUrl:String;

		public var remoteObjectDataPushDestinationId:String;

		public var remoteObjectDataPushDestinationUrl:String;

		public var remoteObjectDestinationId:String;

		public var remoteObjectDestinationUrl:String;

		public var version_No:String;

		private var _changed:Signal;

		private var htt:HTTPService = new HTTPService();

		public function get changed():ISignal
		{
			return _changed;
		}

		public function getConString():void
		{
			var rand:String = new Date().time.toString();
			htt.url = ConnectionManager.CONNECTION_URL;
			htt.addEventListener( ResultEvent.RESULT, onGetResult );
			htt.addEventListener( FaultEvent.FAULT, onGetFault );
			htt.send();
		}

		public function onGetFault( e:FaultEvent ):void
		{
			trace( "fault in config" + e.toString());
		}

		public function get destinationUrl():String
		{
			var url:String = remoteObjectDestinationUrl ? remoteObjectDestinationUrl.replace( "/messagebroker/amf", "" ) : "";
			return url;
		}

		public function onGetResult( e:ResultEvent ):void
		{
			conString = e.result.root.server;
			conStringIIS = e.result.root.serveriis;
			debugFlag = e.result.root.debugflag;

			try
			{
				//TODO: at some cases we get empty result and override existing values
				if ( e.result.root )
				{
					remoteObjectDestinationUrl = e.result.root.serverAMF;
					remoteObjectDestinationId = e.result.root.serverId;
					remoteObjectDataPushDestinationUrl = e.result.root.dataPushServerAMF;
					remoteObjectDataPushDestinationId = e.result.root.dataPushChannelId;

						//modelLocator.debugflag = e.result.root.debugflag;
				}
			}
			catch ( error:Error )
			{

			}

			_changed.dispatch();
		}
	}
}
