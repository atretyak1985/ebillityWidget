package com.ebillity.core.model.modelinfo
{
	import com.ebillity.core.model.IBroadcastable;
	import com.ebillity.core.model.VOSignalProperty;
	import com.ebillity.core.model.dto.ErrorDTO;

	import org.osflash.signals.Signal;

	public class ErrorsInfoModelLocator extends Signal
	{

		public function ErrorsInfoModelLocator( ... parameters )
		{
			super( parameters );

			loginErrorSignal = new VOSignalProperty();
		}

		public var loginErrorSignal:IBroadcastable;

		public function get loginError():ErrorDTO
		{
			return loginErrorSignal.value as ErrorDTO;
		}

		public function set loginError( value:ErrorDTO ):void
		{
			loginErrorSignal.value = value as ErrorDTO;
		}
	}
}
