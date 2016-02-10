package com.ebillity.core.model
{
	import org.osflash.signals.Signal;

	public class VOSignalProperty extends Signal implements IBroadcastable
	{
		protected var _value:Object;

		private var _stopNextPropagation:Boolean;

		public function VOSignalProperty( ... parameters )
		{
			super( parameters );
		}

		public function set value( val:Object ):void
		{
			_value = val;

			if ( !_stopNextPropagation )
				dispatch( val );
			else
				_stopNextPropagation = false;
		}

		public function get value():Object
		{
			return _value;
		}

		public function broadcast():void
		{
			dispatch( _value );
		}

		public function stopNextPropagation():void
		{
			_stopNextPropagation = true;
		}
	}
}
