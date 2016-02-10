package com.ebillity.core.view.ui.main
{
	import spark.components.supportClasses.SkinnableComponent;

	public class MainView extends SkinnableComponent
	{
		public static const STATE_LOGIN:String = "login";

		public static const STATE_ADMIN:String = "admin";

		public static const STATE_EMPLOYEE:String = "employee";

		public function MainView()
		{
			super();
		}

		private var _state:String = STATE_LOGIN;

		public function get state():String
		{
			return _state;
		}

		public function set state( value:String ):void
		{
			_state = value;
			this.invalidateSkinState();
		}

		override protected function getCurrentSkinState():String
		{
			return state;
		}

		override protected function partAdded( partName:String, instance:Object ):void
		{
			super.partAdded( partName, instance );
		}

		override protected function partRemoved( partName:String, instance:Object ):void
		{
			super.partRemoved( partName, instance );
		}

	}
}
