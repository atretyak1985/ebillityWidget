package com.ebillity.core.model.modelinfo
{
	import com.ebillity.core.model.IBroadcastable;
	import com.ebillity.core.model.VOSignalProperty;
	import com.ebillity.core.model.dto.UserDTO;

	import org.osflash.signals.Signal;

	public class UserInfoModelLocator extends Signal
	{

		public function UserInfoModelLocator( ... parameters )
		{
			super( parameters );

			userDTOSignal = new VOSignalProperty();
		}

		public var userDTOSignal:IBroadcastable;

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
