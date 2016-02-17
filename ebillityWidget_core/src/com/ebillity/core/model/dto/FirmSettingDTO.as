package com.ebillity.core.model.dto
{

	public class FirmSettingDTO
	{
		public var productId:int;

		public var productName:String;

		public var isAdmin:Boolean;

		public var isPayroll:Boolean;

		public var isClass:Boolean;

		public var isShowRate:Boolean;

		public var isApprovalProcess:Boolean;

		public var isOverrideRateEnabled:Boolean;

		public var isPrepaidHours:Boolean;

		public var isBillableDefault:Boolean;

		public var isOvertimeEnabled:Boolean;

		public var isMilitaryTime:Boolean;

		public var timerRoundingHours:Number;

		public var timerRoundingMinutes:Number;

		public var timeZone:String;

		public var dateFormat:String;

		public var currencySymbol:String;

		public var isQBIntegrated:Boolean;

		public var isQBConnected:Boolean;

		public var qBType:String;

		public var isTRLined:Boolean;

		public var clientLabel:String;

		public var projectLabel:String;

		public var userLabel:String;

		public var activityLabel:String;
	}
}
