package com.ebillity.core.events
{
	import org.osflash.signals.events.GenericEvent;

	public class ResponderEvent extends GenericEvent
	{

		public function ResponderEvent( data:Object )
		{
			_data = data;
			super( false );
		}

		private var _data:Object;

		public function get data():Object
		{
			return _data;
		}
	}
}
