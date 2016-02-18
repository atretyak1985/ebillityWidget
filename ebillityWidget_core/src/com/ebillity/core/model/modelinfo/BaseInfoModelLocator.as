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
			showFirmSignal = new VOSignalProperty();
		}

		public var loggedInSignal:IBroadcastable;

		public var showFirmSignal:IBroadcastable;

		public function get loggedIn():Boolean
		{
			return loggedInSignal.value as Boolean;
		}

		public function set loggedIn( value:Boolean ):void
		{
			loggedInSignal.value = value;
		}

		public function get showFirm():Boolean
		{
			return showFirmSignal.value as Boolean;
		}

		public function set showFirm( value:Boolean ):void
		{
			showFirmSignal.value = value;
		}
	}
}
