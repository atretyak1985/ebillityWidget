package com.ebillity.core.controler.services.base
{
	import com.adobe.serialization.json.JSON;
	import com.ebillity.core.controler.net.Responder;
	import com.ebillity.core.controler.net.async.IPromise;
	import com.ebillity.core.controler.net.async.Promise;
	import com.ebillity.core.events.ResponderEvent;
	import com.ebillity.core.model.common.ObjectMap;
	import com.ebillity.core.model.common.ObjectPool;

	import flash.utils.describeType;

	import mx.rpc.AsyncToken;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.mxml.HTTPService;
	import mx.rpc.soap.mxml.Operation;
	import mx.rpc.soap.mxml.WebService;

	import org.osflash.signals.DeluxeSignal;
	import org.robotlegs.mvcs.Actor;

	public class WebService extends Actor implements IWebService
	{
		public static const CONNECTION_URL:String = "http://qa.ebillity.com/restservice/api/mobile/";

		public function WebService()
		{
			_promisePool = new ObjectPool( Promise );
			_promiseMap = new ObjectMap();
			_webService = new mx.rpc.soap.mxml.WebService();
			_webService.showBusyCursor = true;

			_httpService = new HTTPService();
			_httpService.showBusyCursor = true;
			_httpService.url = CONNECTION_URL;
			_httpService.method = 'POST';
			_httpService.resultFormat = "text";
			_httpService.contentType = "application/json";
			_httpService.headers = { Accept: "application/json" }
		}

		protected var _promiseMap:ObjectMap;

		protected var _promisePool:ObjectPool;

		private var _httpService:HTTPService;

		private var _responder:mx.rpc.Responder;

		private var _webService:mx.rpc.soap.mxml.WebService;

		/**
		 * use wsdlConnection to make AMF method calls on a Java Service Class
		 * map reponder reference
		 */
		public function call( command:String, ... arguments:Array ):IPromise
		{
			var responder:Responder = new Responder();
			responder.completed.addOnce( handleRemotingResult );
			responder.failed.addOnce( handleRemotingError );

			if ( arguments )
			{
				var operation:Operation = _webService.getOperation( command ) as Operation
				operation.arguments = arguments;
				operation.resultFormat = "e4x";
				operation.send();

				_webService.addEventListener( ResultEvent.RESULT, responder.result );
				_webService.addEventListener( FaultEvent.FAULT, responder.fault );
			}
			var promise:IPromise = _promiseMap.mapValue( responder, _promisePool.getObject());
			return promise;
		}

		public function callAmf( token:AsyncToken ):IPromise
		{
			var responder:Responder = new Responder();
			responder.completed.addOnce( handleRemotingResult );
			responder.failed.addOnce( handleRemotingError );

			if ( this.responder )
				token.addResponder( this.responder );

			token.addResponder( responder );

			var promise:IPromise = _promiseMap.mapValue( responder, _promisePool.getObject());
			return promise;
		}

		public function callHttpService( command:String, params:Object ):IPromise
		{
			var responder:Responder = new Responder();
			responder.completed.addOnce( handleRemotingResult );
			responder.failed.addOnce( handleRemotingError );

			if ( params )
			{
				_httpService.url += command;

				var params:Object = com.adobe.serialization.json.JSON.encode( params );
				_httpService.send( params );

				_httpService.addEventListener( ResultEvent.RESULT, responder.result );
				_httpService.addEventListener( FaultEvent.FAULT, responder.fault );
			}
			var promise:IPromise = _promiseMap.mapValue( responder, _promisePool.getObject());
			return promise;
		}

		public function callWebService( command:String, ... arguments:Array ):IPromise
		{
			var responder:Responder = new Responder();
			responder.completed.addOnce( handleRemotingResult );
			responder.failed.addOnce( handleRemotingError );

			if ( arguments )
			{
				var operation:Operation = _webService.getOperation( command ) as Operation
				operation.resultFormat = "e4x";

				_webService.addEventListener( ResultEvent.RESULT, responder.result );
				_webService.addEventListener( FaultEvent.FAULT, responder.fault );
			}
			var promise:IPromise = _promiseMap.mapValue( responder, _promisePool.getObject());
			promise.operation = operation;
			return promise;
		}

		public function get responder():mx.rpc.Responder
		{
			return _responder;
		}

		public function set responder( value:mx.rpc.Responder ):void
		{
			_responder = value;
		}

		private function connectionManagerChanged():void
		{
			if ( !_webService.wsdl )
				_webService.loadWSDL( CONNECTION_URL );
		}

		/**
		 * handle the Error response
		 * retrieve and unmap responder references
		 * promise dispatches the fault info
		 */
		private function handleRemotingError( e:ResponderEvent ):void
		{
			var responder:Responder = e.target as Responder;
			var signal:DeluxeSignal = e.signal as DeluxeSignal;
			signal.removeAll();
			var promise:IPromise = _promiseMap.unmapValue( responder );
			promise.dispatchError( e.data );
			_promisePool.disposeObject( promise );
		}

		/**
		 * handle the Result response
		 * retrieve and unmap responder references
		 * promise dispatches the result data
		 */
		private function handleRemotingResult( e:ResponderEvent ):void
		{ //e.data.result.principal
			var responder:Responder = e.target as Responder;
			var signal:DeluxeSignal = e.signal as DeluxeSignal;
			signal.removeAll();
			var promise:IPromise = _promiseMap.unmapValue( responder );
			promise.dispatchResult( e.data );
			_promisePool.disposeObject( promise );
		}

		private function toObject( a:Array ):Object
		{
			var o:Object = new Object();

			for ( var i:int = 0; i < a.length; i++ )
			{
				o[ i ] = a[ i ];
				trace( describeType( a[ i ]));
			}
			return o;
		}
	}
}
