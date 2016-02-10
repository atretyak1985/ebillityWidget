package com.ebillity.core.model.modelinfo
{
	import com.ebillity.core.model.IBroadcastable;
	import com.ebillity.core.model.VOSignalProperty;

	import org.osflash.signals.Signal;

	public class MenuInfoModelLocator extends Signal
	{

		public function MenuInfoModelLocator( ... parameters )
		{
			super( parameters );

			selectedMenuSignal = new VOSignalProperty();
			selectedMenuSignal.stopNextPropagation();
		}

		public var selectedMenuSignal:IBroadcastable;

		public function get selectedMenu():String
		{
			return selectedMenuSignal.value as String;
		}

		public function set selectedMenu( value:String ):void
		{
			selectedMenuSignal.value = value;
		}
	}
}
