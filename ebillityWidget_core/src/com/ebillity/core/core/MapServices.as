package com.ebillity.core.core
{

	import com.ebillity.core.controler.services.LoginService;
	import com.ebillity.core.controler.services.factories.RemoteObjectFactory;
	import com.ebillity.core.controler.services.interfaces.ILoginService;
	
	import mx.rpc.remoting.RemoteObject;

	public class MapServices extends MappingCommand
	{
		protected var connectionManager:ConnectionManager;

		override public function execute():void
		{
			connectionManager = ConnectionManager.getInstance();
			//Configure the RemoteObjectFactory
			var remoteObjectFactory:RemoteObjectFactory = new RemoteObjectFactory();
			var destinationId:String = connectionManager.remoteObjectDestinationId;
			var destinationUrl:String = connectionManager.remoteObjectDestinationUrl;
			remoteObjectFactory.addChannel( destinationId, destinationUrl );

//			remoteObjectFactory.addChannel( "my-amf", "http://localhost:8080/inspirdv2/messagebroker/amf" );

			injector.mapSingletonOf( ILoginService, LoginService );


			injector.mapValue( RemoteObject, remoteObjectFactory.getRemoteObjectForService( LoginService.REMOTE_DESTINATION ), "LoginService" );

			remoteObjectFactory.destroy();
		}
	}
}


