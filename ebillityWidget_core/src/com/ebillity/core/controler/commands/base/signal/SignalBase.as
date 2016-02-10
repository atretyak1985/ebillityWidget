package com.ebillity.core.controler.commands.base.signal
{
	import mx.rpc.Responder;

	import org.osflash.signals.Signal;

	public class SignalBase extends Signal
	{
		public function SignalBase()
		{
			super( SignalParams, Responder );
		}
	}
}

