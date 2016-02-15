package com.ebillity.core.constants
{

	public class MenuConstants
	{
		public static const TRACK_TIME:String = "trackTime";

		public static const ADD_EXPENSE:String = "addExpense";

		public static const TEAM_ENTRIES:String = "teamEntries";

		public static const MY_ENTRIES:String = "myEntries";

		public static const SETTINGS:String = "settings";

		public static const ALL_ADMIN_MENU:Array = [{ "id": TRACK_TIME, "label": "Track Time" }, 
			{"type":"separator"},
			{ "id": ADD_EXPENSE, "label": "Add Expense" }, 
			{"type":"separator"},
			{ "id": TEAM_ENTRIES, "label": "Team Entries" }, 
			{"type":"separator"},
			{ "id": SETTINGS, "label": "Settings" }];

		public static const ALL_EMPLOYEE_MENU:Array = [{ "id": TRACK_TIME, "label": "Track Time" }, 
			{ "id": ADD_EXPENSE, "label": "Add Expense" }, 
			{ "id": MY_ENTRIES, "label": "My Entries" },
			{ "id": SETTINGS, "label": "Settings" }];
	}
}
