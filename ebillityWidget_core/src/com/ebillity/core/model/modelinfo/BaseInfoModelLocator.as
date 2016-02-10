package com.ebillity.core.model.modelinfo
{
	import com.ebillity.core.model.IBroadcastable;
	import com.ebillity.core.model.VOSignalProperty;

	import org.osflash.signals.Signal;

	public class BaseInfoModelLocator extends Signal
	{
		public function BaseInfoModelLocator( ... parameters )
		{
			super( parameters );

			loggedInSignal = new VOSignalProperty();
		}

		public var loggedInSignal:IBroadcastable;

		public function get loggedIn():Boolean
		{
			return loggedInSignal.value as Boolean;
		}

		public function set loggedIn( value:Boolean ):void
		{
			loggedInSignal.value = value;
		}
	}
}
