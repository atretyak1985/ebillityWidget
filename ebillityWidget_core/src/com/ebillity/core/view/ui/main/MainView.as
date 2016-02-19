package com.ebillity.core.view.ui.main
{
	import com.ebillity.core.view.ui.admin.AdminView;
	import com.ebillity.core.view.ui.core.MenuPanel;
	import com.ebillity.core.view.ui.core.TimePanel;
	import com.ebillity.core.view.ui.employee.EmployeeView;

	import spark.components.supportClasses.SkinnableComponent;

	public class MainView extends SkinnableComponent
	{
		public static const STATE_FIRM:String = "firms";

		public static const STATE_LOGIN:String = "login";

		public static const STATE_ADMIN:String = "admin";

		public static const STATE_EMPLOYEE:String = "employee";

		[SkinPart( required = "true" )]
		public var menuPanel:MenuPanel;

		[SkinPart( required = "true" )]
		public var adminView:AdminView;

		[SkinPart( required = "true" )]
		public var employeeView:EmployeeView;

		[SkinPart( required = "true" )]
		public var timePanel:TimePanel;

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

			switch ( instance )
			{
				case menuPanel:
				{

					break;
				}
			}
		}

		override protected function partRemoved( partName:String, instance:Object ):void
		{
			super.partRemoved( partName, instance );
		}

	}
}
