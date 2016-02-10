package com.ebillity.core.controler.net.async
{
	import mx.rpc.soap.mxml.Operation;
	import org.osflash.signals.ISignal;

	public interface IPromise
	{
		function addResultProcessor( processor:Function ):IPromise;

		function cancel():void;
		function get completed():ISignal;
		function dispatchError( value:* ):void;
		function dispatchProgress( value:* ):void;

		function dispatchResult( value:* ):void;
		function get error():*;
		function get failed():ISignal;
		function get operation():Operation;
		function set operation( value:Operation ):void;
		function get progress():*;
		function get progressChanged():ISignal;
		function get result():*;
		function get statusChanged():ISignal;
	}
}
