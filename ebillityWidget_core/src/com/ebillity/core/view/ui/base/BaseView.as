package com.ebillity.core.view.ui.base
{

	import com.ebillity.core.constants.MenuConstants;
	import com.ebillity.core.view.ui.components.Dashboard;
	import com.ebillity.core.view.ui.components.ExpenseEntry;
	import com.ebillity.core.view.ui.components.ManageEntries;
	import com.ebillity.core.view.ui.components.MyEntries;
	import com.ebillity.core.view.ui.components.Settings;
	import com.ebillity.core.view.ui.components.TimeEntry;

	import spark.components.supportClasses.SkinnableComponent;

	public class BaseView extends SkinnableComponent
	{
		public static const STATE_DASHBOARD:String = "dashboard";

		public static const STATE_EXPENSE:String = "expense";

		public static const STATE_MANAGE:String = "manage";

		public static const STATE_SETTINGS:String = "settings";

		public static const STATE_TIME:String = "time";

		public static const STATE_MYENTRIES:String = "myentries";

		[SkinPart( required = "true" )]
		public var dashboard:Dashboard;

		[SkinPart( required = "true" )]
		public var expenseEntry:ExpenseEntry;

		[SkinPart( required = "true" )]
		public var settings:Settings;

		[SkinPart( required = "true" )]
		public var timeEntry:TimeEntry;

		[SkinPart( required = "false" )]
		public var manageEntries:ManageEntries;

		[SkinPart( required = "false" )]
		public var myEntries:MyEntries;

		public function changeMenu( selectedMenu:String ):void
		{
			switch ( selectedMenu )
			{
				case MenuConstants.ADD_EXPENSE:
				{
					state = STATE_EXPENSE;
					break;
				}
				case MenuConstants.MY_ENTRIES:
				{
					state = STATE_MYENTRIES;
					break;
				}
				case MenuConstants.SETTINGS:
				{
					state = STATE_SETTINGS;
					break;
				}
				case MenuConstants.TEAM_ENTRIES:
				{
					state = STATE_MANAGE;
					break;
				}
				case MenuConstants.TRACK_TIME:
				{
					state = STATE_TIME;
					break;
				}
			}
		}

		private var _state:String = STATE_DASHBOARD;

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
