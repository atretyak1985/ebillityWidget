package com.ebillity.core.controler.net.async
{
	import com.ebillity.core.controler.net.IDisposable;

	import mx.rpc.soap.mxml.Operation;

	import org.osflash.signals.ISignal;
	import org.osflash.signals.Signal;

	public class Promise implements IPromise, IDisposable
	{

		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------

		public function Promise()
		{
		}

		//--------------------------------------------------------------------------
		//
		//  Signals
		//
		//--------------------------------------------------------------------------

		protected var _completed:Signal;

		protected var _error:*;

		protected var _failed:Signal;

		protected var _progress:*;

		protected var _progressChanged:Signal;

		protected var _result:*;

		//--------------------------------------------------------------------------
		//
		//  Properties
		//
		//--------------------------------------------------------------------------

		protected var _resultProcessorList:Vector.<Function>;

		protected var _status:IPromiseStatus = PromiseStatus.PENDING;

		protected var _statusChanged:Signal;

		//--------------------------------------------------------------------------
		//
		//  Public Methods
		//
		//--------------------------------------------------------------------------
		private var _operation:Operation;

		public function addResultProcessor( processor:Function ):IPromise
		{
			assertPending();

			resultProcessorList[ resultProcessorList.length ] = processor;

			return this;
		}

		public function cancel():void
		{
			assertPending();

			setStatus( PromiseStatus.CANCELLED );
			removeAllListeners();
		}

		public function get completed():ISignal
		{
			return _completed ||= new Signal( IPromise );
		}

		public function set completed( value:ISignal ):void
		{
			_completed = value as Signal;
		}

		public function dispatchError( value:* ):void
		{
			assertPending();

			_error = value;

			setStatus( PromiseStatus.FAILED );

			if ( _failed )
				_failed.dispatch( this );

			removeAllListeners();
		}

		public function dispatchProgress( value:* ):void
		{
			assertPending();

			_progress = value;

			if ( _progressChanged )
				_progressChanged.dispatch( this );
		}

		public function dispatchResult( value:* ):void
		{
			assertPending();

			value = processResult( value );
			_result = value;

			setStatus( PromiseStatus.COMPLETE );

			if ( _completed )
				_completed.dispatch( this );

			removeAllListeners();
		}

		public function dispose():void
		{
			_status = PromiseStatus.PENDING;
			_result = null;
			_error = null;
			_progress = null;
			_operation = null;
			removeAllListeners();
		}

		public function get error():*
		{
			return _error;
		}

		public function get failed():ISignal
		{
			return _failed ||= new Signal( IPromise );
		}

		public function set failed( value:ISignal ):void
		{
			_failed = value as Signal;
		}

		public function get numResultProcessors():int
		{
			return ( _resultProcessorList ) ? _resultProcessorList.length : 0;
		}

		public function get operation():Operation
		{
			return _operation;
		}

		public function set operation( value:Operation ):void
		{
			_operation = value;
		}

		public function get progress():*
		{
			return _progress;
		}

		public function get progressChanged():ISignal
		{
			return _progressChanged ||= new Signal( IPromise );
		}

		public function set progressChanged( value:ISignal ):void
		{
			_progressChanged = value as Signal;
		}

		public function get result():*
		{
			return _result;
		}

		public function get status():IPromiseStatus
		{
			return _status;
		}

		public function get statusChanged():ISignal
		{
			return _statusChanged ||= new Signal( IPromise );
		}

		public function set statusChanged( value:ISignal ):void
		{
			_statusChanged = value as Signal;
		}

		//--------------------------------------------------------------------------
		//
		//  Protected Methods
		//
		//--------------------------------------------------------------------------

		protected function assertPending():void
		{
			if ( _status != PromiseStatus.PENDING )
				throw new Error( "Promise is no longer pending. Status is <" + _status + ">" );
		}

		protected function processResult( result:* ):*
		{
			if ( _resultProcessorList )
			{
				for each ( var processor:Function in resultProcessorList )
				{
					result = processor( result );
				}
			}

			return result;
		}

		protected function removeAllListeners():void
		{
			if ( _completed )
				_completed.removeAll();

			if ( _failed )
				_failed.removeAll();

			if ( _progressChanged )
				_progressChanged.removeAll();

			if ( _statusChanged )
				_statusChanged.removeAll();

			if ( _resultProcessorList )
				_resultProcessorList.length = 0;
		}

		//--------------------------------------------------------------------------
		//
		//  Getters / Setters
		//
		//--------------------------------------------------------------------------

		protected function get resultProcessorList():Vector.<Function>
		{
			return _resultProcessorList ||= new Vector.<Function>();
		}

		protected function setStatus( value:IPromiseStatus ):void
		{
			if ( value == _status )
				return;

			_status = value;

			if ( _statusChanged )
				_statusChanged.dispatch( this );
		}
	}
}
