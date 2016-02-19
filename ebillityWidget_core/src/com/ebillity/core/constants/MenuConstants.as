package com.ebillity.core.constants
{

	public class MenuConstants
	{
		public static const DASHBOARD:String = "dashboard";

		public static const TRACK_TIME:String = "trackTime";

		public static const ADD_EXPENSE:String = "addExpense";

		public static const TEAM_ENTRIES:String = "teamEntries";

		public static const MY_ENTRIES:String = "myEntries";

		public static const SETTINGS:String = "settings";

		public static const SWITCH_FIRMS:String = "settings";

		public static const LOGOUT:String = "logout";

		public static const ALL_ADMIN_MENU:Array = [{ "id": DASHBOARD, "label": "Dashboard" },  
			{"type":"separator"},
			{ "id": TRACK_TIME, "label": "Track Time" },
			{"type":"separator"},
			{ "id": ADD_EXPENSE, "label": "Add Expense" }, 
			{"type":"separator"},
			{ "id": MY_ENTRIES, "label": "My Entries" },
			{"type":"separator"},
			{ "id": TEAM_ENTRIES, "label": "Team Entries" }, 
			{"type":"separator"},
			{ "id": SETTINGS, "label": "Settings" },
			{"type":"separator"},
			{ "id": SWITCH_FIRMS, "label": "Switch Firms" },
			{"type":"separator"},
			{ "id": LOGOUT, "label": "Logout" }];

		public static const ALL_EMPLOYEE_MENU:Array = [{ "id": TRACK_TIME, "label": "Track Time" }, 
			{ "id": ADD_EXPENSE, "label": "Add Expense" }, 
			{ "id": MY_ENTRIES, "label": "My Entries" },
			{ "id": SETTINGS, "label": "Settings" }];
	}
}
