package com.ebillity.core.controler.net
{
	import com.ebillity.core.events.ResponderEvent;

	import flash.net.Responder;

	import mx.rpc.IResponder;

	import org.osflash.signals.DeluxeSignal;
	import org.osflash.signals.ISignal;

	public class Responder extends flash.net.Responder implements IResponder
	{

		/**
		 * Pass our handler methods through to flash.net.Responder
		 */
		public function Responder()
		{
			super( result, fault );
		}

		private var _completed:DeluxeSignal;

		private var _failed:DeluxeSignal;

		public function get completed():ISignal
		{
			return _completed ||= new DeluxeSignal( this );
		}

		public function get failed():ISignal
		{
			return _failed ||= new DeluxeSignal( this );
		}

		/**
		 * Dispatch a failed DeluxeSignal containing the refence to ‘this’ and the data
		 */
		public function fault( info:Object ):void
		{
			var event:ResponderEvent = new ResponderEvent( info );
			_failed.dispatch( event );
		}

		/**
		 * Dispatch a complete DeluxeSignal containing the refence to ‘this’ and the data
		 */
		public function result( data:Object ):void
		{
			var event:ResponderEvent = new ResponderEvent( data );
			_completed.dispatch( event );
		}
	}
}
