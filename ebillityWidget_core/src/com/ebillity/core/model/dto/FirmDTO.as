package com.ebillity.core.model.dto
{
	import mx.collections.ArrayCollection;

	public class FirmDTO
	{
		public var firmId:int;

		public var firmName:String;

		public var firmStatus:String;

		public var userType:String;

		public var employeeName:String;

		public var employeeId:int;

		public var firmCreatedDate:String;

		public var firmSettings:FirmSettingDTO;

		public var employees:ArrayCollection;

		public var clientProjects:ArrayCollection;

		public var activityType:ArrayCollection;

		public var payroll:ArrayCollection;

		public var classes:ArrayCollection;

		public var litigationTaskCodes:ArrayCollection;

		public var expenseType:ArrayCollection;

		public var clientActivityRates:ArrayCollection;

		public var activityRates:ArrayCollection;

		public var projectUserRates:ArrayCollection;

		public var projectRates:ArrayCollection;

		public var clientUserRates:ArrayCollection;

		public var clientRates:ArrayCollection;

		public var userRates:ArrayCollection;

		public var autoTexts:ArrayCollection;

		public var invoiceList:ArrayCollection;

		public var timeEntries:ArrayCollection;

		public var expenseEntries:ArrayCollection;
	}
}
