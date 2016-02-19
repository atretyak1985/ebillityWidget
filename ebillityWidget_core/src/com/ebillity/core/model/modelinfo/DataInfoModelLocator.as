package com.ebillity.core.model.modelinfo
{
	import com.ebillity.core.model.IBroadcastable;
	import com.ebillity.core.model.VOSignalProperty;
	import com.ebillity.core.model.dto.DataDTO;
	import com.ebillity.core.model.dto.FirmDTO;
	import com.ebillity.core.model.dto.UserDTO;

	import org.osflash.signals.Signal;

	public class DataInfoModelLocator extends Signal
	{

		public function DataInfoModelLocator( ... parameters )
		{
			super( parameters );

			userDTOSignal = new VOSignalProperty();

			syncDataSignal = new VOSignalProperty();

			selectedFirmSignal = new VOSignalProperty();
		}

		public var syncDataSignal:IBroadcastable;


		public var userDTOSignal:IBroadcastable;

		public var selectedFirmSignal:IBroadcastable;

		public function get selectedFirm():FirmDTO
		{
			return selectedFirmSignal.value as FirmDTO;
		}

		public function set selectedFirm( value:FirmDTO ):void
		{
			selectedFirmSignal.value = value;
		}

		public function get syncData():DataDTO
		{
			return syncDataSignal.value as DataDTO;
		}

		public function set syncData( value:DataDTO ):void
		{
			syncDataSignal.value = value;
		}

		public function get userDTO():UserDTO
		{
			return userDTOSignal.value as UserDTO;
		}

		public function set userDTO( value:UserDTO ):void
		{
			userDTOSignal.value = value;
		}
	}
}
