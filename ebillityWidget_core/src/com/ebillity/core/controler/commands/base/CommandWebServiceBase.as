package com.ebillity.core.controler.commands.base
{

	import com.ebillity.core.controler.net.async.IPromise;

	import mx.rpc.events.FaultEvent;

	import org.robotlegs.mvcs.SignalCommand;

	public class CommandWebServiceBase extends SignalCommand
	{
		override public function execute():void
		{
			commandMap.detain( this );
		}

		protected function handleError( promise:IPromise ):void
		{
			dispatch( new FaultEvent( FaultEvent.FAULT, promise.error ));
			commandMap.release( this );
		}

		protected function handleResult( promise:IPromise ):void
		{
			commandMap.release( this );
		}
	}
}

