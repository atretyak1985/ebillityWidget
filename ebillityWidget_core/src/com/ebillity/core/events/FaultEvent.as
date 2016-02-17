package com.ebillity.core.events
{
	import flash.events.Event;

	public class FaultEvent extends Event
	{
		public static const LOGIN_USER:String = "loginUser.FaultEvent";

		public function FaultEvent( type:String, fault:Object = null, bubbles:Boolean = false, cancelable:Boolean = false )
		{
			super( type, bubbles, cancelable );
			_fault = fault;
		}

		private var _fault:Object;

		override public function clone():Event
		{
			return new FaultEvent( type, fault, bubbles, cancelable )
		}

		public function get fault():Object
		{
			return _fault.fault;
		}
	}
}
