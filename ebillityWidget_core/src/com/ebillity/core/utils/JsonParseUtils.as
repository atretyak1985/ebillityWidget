package com.ebillity.core.utils
{
	import com.ebillity.core.model.dto.ActivityRateDTO;
	import com.ebillity.core.model.dto.ActivityTypeDTO;
	import com.ebillity.core.model.dto.AutoTextDTO;
	import com.ebillity.core.model.dto.ClasseDTO;
	import com.ebillity.core.model.dto.ClientActivityRateDTO;
	import com.ebillity.core.model.dto.ClientProjectDTO;
	import com.ebillity.core.model.dto.ClientRateDTO;
	import com.ebillity.core.model.dto.ClientUserRateDTO;
	import com.ebillity.core.model.dto.DataDTO;
	import com.ebillity.core.model.dto.EmployeeDTO;
	import com.ebillity.core.model.dto.ExpenseEntryDTO;
	import com.ebillity.core.model.dto.ExpenseTypeDTO;
	import com.ebillity.core.model.dto.FirmDTO;
	import com.ebillity.core.model.dto.FirmSettingDTO;
	import com.ebillity.core.model.dto.InvoiceDTO;
	import com.ebillity.core.model.dto.LitigationTaskCodeDTO;
	import com.ebillity.core.model.dto.PayrollDTO;
	import com.ebillity.core.model.dto.ProjectRateDTO;
	import com.ebillity.core.model.dto.ProjectUserRateDTO;
	import com.ebillity.core.model.dto.TimeEntryDTO;
	import com.ebillity.core.model.dto.UserDTO;
	import com.ebillity.core.model.dto.UserRateDTO;

	import mx.collections.ArrayCollection;

	public class JsonParseUtils
	{
		public static function getSyncDataFromJson( json:Object ):DataDTO
		{
			if ( !json )
				return null;

			var data:DataDTO = new DataDTO();
			data.serverTime = json.ServerTime;
			//parse user
			var userJson:Object = json.User;
			var userDTO:UserDTO = new UserDTO();

			if ( userJson )
			{
				userDTO.firstName = userJson.FirstName;
				userDTO.lastName = userJson.LastName;
				userDTO.isTempPassword = userJson.IsTempPassword;
				userDTO.userId = userJson.UserId;
			}
			data.user = userDTO;

			//parse firms
			var firms:Array = json.Firms;
			data.firms = firms && firms.length > 0 ? new ArrayCollection() : null;

			for each ( var firmJson:Object in firms )
			{
				data.firms.addItem( createFirmFromJson( firmJson ));
			}
			return data;
		}

		private static function createFirmFromJson( firmJson:Object ):FirmDTO
		{
			if ( !firmJson )
				return null;

			var firmDTO:FirmDTO = new FirmDTO();
			firmDTO.firmId = firmJson.FirmId;
			firmDTO.firmName = firmJson.FirmName;
			firmDTO.firmStatus = firmJson.FirmStatus;
			firmDTO.userType = firmJson.UserType;
			firmDTO.employeeName = firmJson.EmployeeName;
			firmDTO.employeeId = firmJson.EmployeeId;
			firmDTO.firmCreatedDate = firmJson.FirmCreatedDate;

			//create FirmSettings
			firmDTO.firmSettings = firmSettingsFromJson( firmJson.FirmSettings );

			//create emploees
			var employees:Array = firmJson.Employees;
			firmDTO.employees = employees && employees.length > 0 ? new ArrayCollection() : null;

			for each ( var employeeJson:Object in employees )
			{
				firmDTO.employees.addItem( employeeJsonFromJson( employeeJson ));
			}

			//create client projects
			var clientProjects:Array = firmJson.ClientProjects;
			firmDTO.clientProjects = clientProjects && clientProjects.length > 0 ? new ArrayCollection() : null;

			for each ( var clientProjectJson:Object in clientProjects )
			{
				firmDTO.clientProjects.addItem( clientProjectFromJson( clientProjectJson ));
			}

			//create activity type
			var activityTypes:Array = firmJson.ActivityType;
			firmDTO.activityType = activityTypes && activityTypes.length > 0 ? new ArrayCollection() : null;

			for each ( var activityType:Object in activityTypes )
			{
				firmDTO.activityType.addItem( clientProjectFromJson( activityType ));
			}

			//create payroll
			var payrolls:Array = firmJson.Payroll;
			firmDTO.payroll = payrolls && payrolls.length > 0 ? new ArrayCollection() : null;

			for each ( var payroll:Object in payrolls )
			{
				firmDTO.payroll.addItem( payrollFromJson( payroll ));
			}

			//create classes
			var classes:Array = firmJson.Classes;
			firmDTO.classes = classes && classes.length > 0 ? new ArrayCollection() : null;

			for each ( var classJson:Object in classes )
			{
				firmDTO.classes.addItem( classesFromJson( classJson ));
			}

			//create litigationTaskCodes
			var litigationTaskCodes:Array = firmJson.LitigationTaskCodes;
			firmDTO.litigationTaskCodes = litigationTaskCodes && litigationTaskCodes.length > 0 ? new ArrayCollection() : null;

			for each ( var litigationTaskCode:Object in litigationTaskCodes )
			{
				firmDTO.litigationTaskCodes.addItem( litigationTaskCodeFromJson( litigationTaskCode ));
			}

			//create expenseType
			var expenseTypes:Array = firmJson.ExpenseType;
			firmDTO.expenseType = expenseTypes && expenseTypes.length > 0 ? new ArrayCollection() : null;

			for each ( var expenseType:Object in expenseTypes )
			{
				firmDTO.expenseType.addItem( expenseTypesFromJson( expenseType ));
			}

			//create clientActivityRates
			var clientActivityRates:Array = firmJson.ClientActivityRates;
			firmDTO.clientActivityRates = clientActivityRates && clientActivityRates.length > 0 ? new ArrayCollection() : null;

			for each ( var clientActivityRate:Object in clientActivityRates )
			{
				firmDTO.clientActivityRates.addItem( clientActivityRateFromJson( clientActivityRate ));
			}

			//create activityRates
			var activityRates:Array = firmJson.ActivityRates;
			firmDTO.activityRates = activityRates && activityRates.length > 0 ? new ArrayCollection() : null;

			for each ( var activityRate:Object in activityRates )
			{
				firmDTO.activityRates.addItem( activityRateFromJson( activityRate ));
			}

			//create projectUserRates
			var projectUserRates:Array = firmJson.ProjectUserRates;
			firmDTO.projectUserRates = projectUserRates && projectUserRates.length > 0 ? new ArrayCollection() : null;

			for each ( var projectUserRate:Object in projectUserRates )
			{
				firmDTO.projectUserRates.addItem( projectUserRateFromJson( projectUserRate ));
			}

			//create projectRates
			var projectRates:Array = firmJson.ProjectRates;
			firmDTO.projectRates = projectRates && projectRates.length > 0 ? new ArrayCollection() : null;

			for each ( var projectRate:Object in projectRates )
			{
				firmDTO.projectRates.addItem( projectRateFromJson( projectRate ));
			}

			//create clientUserRates
			var clientUserRates:Array = firmJson.ClientUserRates;
			firmDTO.clientUserRates = clientUserRates && clientUserRates.length > 0 ? new ArrayCollection() : null;

			for each ( var clientUserRate:Object in clientUserRates )
			{
				firmDTO.clientUserRates.addItem( clientUserRateFromJson( clientUserRate ));
			}

			//create clientRates
			var clientRates:Array = firmJson.ClientRates;
			firmDTO.clientRates = clientRates && clientRates.length > 0 ? new ArrayCollection() : null;

			for each ( var clientRate:Object in clientRates )
			{
				firmDTO.clientRates.addItem( clientRateFromJson( clientRate ));
			}

			//create userRates
			var userRates:Array = firmJson.UserRates;
			firmDTO.userRates = userRates && userRates.length > 0 ? new ArrayCollection() : null;

			for each ( var userRate:Object in userRates )
			{
				firmDTO.userRates.addItem( userRateFromJson( userRate ));
			}

			//create autoTexts
			var autoTexts:Array = firmJson.AutoTexts;
			firmDTO.autoTexts = autoTexts && autoTexts.length > 0 ? new ArrayCollection() : null;

			for each ( var autoText:Object in autoTexts )
			{
				firmDTO.autoTexts.addItem( autoTextFromJson( autoText ));
			}

			//create invoiceList
			var invoiceList:Array = firmJson.InvoiceList;
			firmDTO.invoiceList = invoiceList && invoiceList.length > 0 ? new ArrayCollection() : null;

			for each ( var invoice:Object in invoiceList )
			{
				firmDTO.invoiceList.addItem( invoiceFromJson( invoice ));
			}

			//create timeEntries
			var timeEntries:Array = firmJson.TimeEntries;
			firmDTO.timeEntries = timeEntries && timeEntries.length > 0 ? new ArrayCollection() : null;

			for each ( var timeEntrie:Object in timeEntries )
			{
				firmDTO.timeEntries.addItem( timeEntrieFromJson( timeEntrie ));
			}

			//create expenseEntries
			var expenseEntries:Array = firmJson.ExpenseEntries;
			firmDTO.expenseEntries = expenseEntries && expenseEntries.length > 0 ? new ArrayCollection() : null;

			for each ( var expenseEntry:Object in expenseEntries )
			{
				firmDTO.expenseEntries.addItem( expenseEntrieFromJson( expenseEntry ));
			}

			return firmDTO;
		}

		private static function expenseEntrieFromJson( expenseEntry:Object ):ExpenseEntryDTO
		{
			if ( !expenseEntry )
				return null;

			var expenseEntryDTO:ExpenseEntryDTO = new ExpenseEntryDTO();
			expenseEntryDTO.classId = expenseEntry.ClassId;
			expenseEntryDTO.clientId = expenseEntry.ClientId;
			expenseEntryDTO.cost = expenseEntry.Cost;
			expenseEntryDTO.description = expenseEntry.Description;
			expenseEntryDTO.employeeId = expenseEntry.EmployeeId;
			expenseEntryDTO.expenseEntryDate = expenseEntry.ExpenseEntryDate;
			expenseEntryDTO.expenseEntryDateEpoc = expenseEntry.ExpenseEntryDateEpoc;
			expenseEntryDTO.expenseId = expenseEntry.ExpenseId;
			expenseEntryDTO.expenseTypeId = expenseEntry.ExpenseTypeId;
			expenseEntryDTO.expenseTypeName = expenseEntry.ExpenseTypeName;
			expenseEntryDTO.filePath = expenseEntry.FilePath;
			expenseEntryDTO.firmId = expenseEntry.FirmId;
			expenseEntryDTO.insertedBy = expenseEntry.InsertedBy;
			expenseEntryDTO.isApproved = expenseEntry.IsApproved;
			expenseEntryDTO.isAutoGenerated = expenseEntry.IsAutoGenerated;
			expenseEntryDTO.isBillable = expenseEntry.IsBillable;
			expenseEntryDTO.isFinalized = expenseEntry.IsFinalized;
			expenseEntryDTO.isPending = expenseEntry.IsPending;
			expenseEntryDTO.isRejected = expenseEntry.IsRejected;
			expenseEntryDTO.isSubmitted = expenseEntry.IsSubmitted;
			expenseEntryDTO.markupRatio = expenseEntry.MarkupRatio;
			expenseEntryDTO.projectId = expenseEntry.ProjectId;
			expenseEntryDTO.projectName = expenseEntry.ProjectName;
			expenseEntryDTO.quantity = expenseEntry.Quantity;
			expenseEntryDTO.reimburse = expenseEntry.Reimburse;
			expenseEntryDTO.tax = expenseEntry.Tax;
			expenseEntryDTO.taxable = expenseEntry.Taxable;
			expenseEntryDTO.totalCost = expenseEntry.TotalCost;
			expenseEntryDTO.updatedBy = expenseEntry.UpdatedBy;
			expenseEntryDTO.userId = expenseEntry.UserId;
			expenseEntryDTO.userName = expenseEntry.UserName;

			return expenseEntryDTO;
		}

		private static function timeEntrieFromJson( timeEntrie:Object ):TimeEntryDTO
		{
			if ( !timeEntrie )
				return null;

			var timeEntryDTO:TimeEntryDTO = new TimeEntryDTO();
			timeEntryDTO.aBACodeId = timeEntrie.ABACodeId;
			timeEntryDTO.activityName = timeEntrie.ActivityName;
			timeEntryDTO.applicationId = timeEntrie.ApplicationId;
			timeEntryDTO.awardAmount = timeEntrie.AwardAmount;
			timeEntryDTO.billableType_Id = timeEntrie.BillableType_Id;
			timeEntryDTO.classId = timeEntrie.ClassId;
			timeEntryDTO.clientName = timeEntrie.ClientName;
			timeEntryDTO.client_Id = timeEntrie.Client_Id;
			timeEntryDTO.contingency = timeEntrie.Contingency;
			timeEntryDTO.contingencyAmount = timeEntrie.ContingencyAmount;
			timeEntryDTO.elapsedHour = timeEntrie.ElapsedHour;
			timeEntryDTO.elapsedMinute = timeEntrie.ElapsedMinute;
			timeEntryDTO.employeeFirstName = timeEntrie.EmployeeFirstName;
			timeEntryDTO.employeeId = timeEntrie.EmployeeId;
			timeEntryDTO.employeeLastName = timeEntrie.EmployeeLastName;
			timeEntryDTO.employeeType = timeEntrie.EmployeeType;
			timeEntryDTO.entryId = timeEntrie.EntryId;
			timeEntryDTO.entryNumber = timeEntrie.EntryNumber;
			timeEntryDTO.excludeFromInvoice = timeEntrie.ExcludeFromInvoice;
			timeEntryDTO.filePath = timeEntrie.FilePath;
			timeEntryDTO.firmBillableActivityType_Id = timeEntrie.FirmBillableActivityType_Id;
			timeEntryDTO.firm_Id = timeEntrie.Firm_Id;
			timeEntryDTO.flatFeeAmount = timeEntrie.FlatFeeAmount;
			timeEntryDTO.fromHour = timeEntrie.FromHour;
			timeEntryDTO.fromMinute = timeEntrie.FromMinute;
			timeEntryDTO.iPPPayrollId = timeEntrie.IPPPayrollId;
			timeEntryDTO.insertedBy = timeEntrie.InsertedBy;
			timeEntryDTO.internalDescription = timeEntrie.InternalDescription;
			timeEntryDTO.invoiceDescription = timeEntrie.InvoiceDescription;
			timeEntryDTO.isActive = timeEntrie.IsActive;
			timeEntryDTO.isAutoGenerated = timeEntrie.IsAutoGenerated;
			timeEntryDTO.isBasic = timeEntrie.IsBasic;
			timeEntryDTO.isBillable = timeEntrie.IsBillable;
			timeEntryDTO.isFinalised = timeEntrie.IsFinalised;
			timeEntryDTO.isInvoiced = timeEntrie.IsInvoiced;
			timeEntryDTO.isLastNameFirst = timeEntrie.IsLastNameFirst;
			timeEntryDTO.isOverTime = timeEntrie.IsOverTime;
			timeEntryDTO.isOverrideTotalTime = timeEntrie.IsOverrideTotalTime;
			timeEntryDTO.isSynchronized = timeEntrie.IsSynchronized;
			timeEntryDTO.isVerifyTimeEntry = timeEntrie.IsVerifyTimeEntry;
			timeEntryDTO.isoverrideRate = timeEntrie.IsoverrideRate;
			timeEntryDTO.laborHour = timeEntrie.LaborHour;
			timeEntryDTO.laborMinute = timeEntrie.LaborMinute;
			timeEntryDTO.overrideRate = timeEntrie.OverrideRate;
			timeEntryDTO.overrideTotalHour = timeEntrie.OverrideTotalHour;
			timeEntryDTO.overrideTotalMinute = timeEntrie.OverrideTotalMinute;
			timeEntryDTO.overrideTotalTimeComments = timeEntrie.OverrideTotalTimeComments;
			timeEntryDTO.prePaidHours = timeEntrie.PrePaidHours;
			timeEntryDTO.projectName = timeEntrie.ProjectName;
			timeEntryDTO.project_Id = timeEntrie.Project_Id;
			timeEntryDTO.rate = timeEntrie.Rate;
			timeEntryDTO.scheduleId = timeEntrie.ScheduleId;
			timeEntryDTO.showLitigation = timeEntrie.ShowLitigation;
			timeEntryDTO.taskName = timeEntrie.TaskName;
			timeEntryDTO.timeEntryDate = timeEntrie.TimeEntryDate;
			timeEntryDTO.timeEntryDateEpoc = timeEntrie.TimeEntryDateEpoc;
			timeEntryDTO.timeEntryId = timeEntrie.TimeEntryId;
			timeEntryDTO.timeEntrySource = timeEntrie.TimeEntrySource;
			timeEntryDTO.timeEntryStatusId = timeEntrie.TimeEntryStatusId;
			timeEntryDTO.timeEntryType = timeEntrie.TimeEntryType;
			timeEntryDTO.timeTrackRowNo = timeEntrie.TimeTrackRowNo;
			timeEntryDTO.toHour = timeEntrie.ToHour;
			timeEntryDTO.toMinute = timeEntrie.ToMinute;
			timeEntryDTO.totalHour = timeEntrie.TotalHour;
			timeEntryDTO.totalMinute = timeEntrie.TotalMinute;
			timeEntryDTO.travelHour = timeEntrie.TravelHour;
			timeEntryDTO.travelMinute = timeEntrie.TravelMinute;
			timeEntryDTO.updatedBy = timeEntrie.UpdatedBy;
			timeEntryDTO.usePrepaidHours = timeEntrie.UsePrepaidHours;
			timeEntryDTO.user_Id = timeEntrie.User_Id;

			return timeEntryDTO;
		}

		private static function invoiceFromJson( invoice:Object ):InvoiceDTO
		{
			if ( !invoice )
				return null;

			var invoiceDTO:InvoiceDTO = new InvoiceDTO();
			invoiceDTO.invoiceNo = invoice.InvoiceNo;
			invoiceDTO.invoiceDate = invoice.InvoiceDate;
			invoiceDTO.clientId = invoice.ClientId;
			invoiceDTO.projectName = invoice.ProjectName;
			invoiceDTO.invoiceDescription = invoice.InvoiceDescription;
			invoiceDTO.invoiceAmount = invoice.InvoiceAmount;
			invoiceDTO.paidAmount = invoice.PaidAmount;

			return invoiceDTO;
		}

		private static function autoTextFromJson( autoText:Object ):AutoTextDTO
		{
			if ( !autoText )
				return null;

			var autoTextDTO:AutoTextDTO = new AutoTextDTO();
			autoTextDTO.abbrevation = autoText.Abbrevation;
			autoTextDTO.autoCompleteText = autoText.AutoCompleteText;
			autoTextDTO.hotKey = autoText.HotKey;

			return autoTextDTO;
		}

		private static function userRateFromJson( userRate:Object ):UserRateDTO
		{
			if ( !userRate )
				return null;

			var userRateDTO:UserRateDTO = new UserRateDTO();
			userRateDTO.userId = userRate.UserId;
			userRateDTO.rate = userRate.Rate;
			userRateDTO.overTimeRate = userRate.OverTimeRate;

			return userRateDTO;
		}

		private static function clientRateFromJson( clientRate:Object ):ClientRateDTO
		{
			if ( !clientRate )
				return null;

			var clientRateDTO:ClientRateDTO = new ClientRateDTO();
			clientRateDTO.clientId = clientRate.ClientId;
			clientRateDTO.rate = clientRate.Rate;
			clientRateDTO.overTimeRate = clientRate.OverTimeRate;

			return clientRateDTO;
		}

		private static function clientUserRateFromJson( clientUserRate:Object ):ClientUserRateDTO
		{
			if ( !clientUserRate )
				return null;

			var clientUserRateDTO:ClientUserRateDTO = new ClientUserRateDTO();
			clientUserRateDTO.clientId = clientUserRate.ClientId;
			clientUserRateDTO.rate = clientUserRate.Rate;
			clientUserRateDTO.overTimeRate = clientUserRate.OverTimeRate;

			return clientUserRateDTO;
		}

		private static function projectRateFromJson( projectRate:Object ):ProjectRateDTO
		{
			if ( !projectRate )
				return null;

			var projectRateDTO:ProjectRateDTO = new ProjectRateDTO();
			projectRateDTO.projectId = projectRate.ProjectId;
			projectRateDTO.rate = projectRate.Rate;
			projectRateDTO.overTimeRate = projectRate.OverTimeRate;
			projectRateDTO.billableType = projectRate.BillableType;

			return projectRateDTO;
		}

		private static function projectUserRateFromJson( projectUserRate:Object ):ProjectUserRateDTO
		{
			if ( !projectUserRate )
				return null;

			var projectUserRateDTO:ProjectUserRateDTO = new ProjectUserRateDTO();
			projectUserRateDTO.projectId = projectUserRate.ProjectId;
			projectUserRateDTO.rate = projectUserRate.Rate;
			projectUserRateDTO.overTimeRate = projectUserRate.OverTimeRate;

			return projectUserRateDTO;
		}

		private static function activityRateFromJson( activityRate:Object ):ActivityRateDTO
		{
			if ( !activityRate )
				return null;

			var activityRateDTO:ActivityRateDTO = new ActivityRateDTO();
			activityRateDTO.activityId = activityRate.ActivityId;
			activityRateDTO.rate = activityRate.Rate;
			activityRateDTO.osverTimeRate = activityRate.OsverTimeRate;

			return activityRateDTO;
		}

		private static function clientActivityRateFromJson( clientActivityRate:Object ):ClientActivityRateDTO
		{
			if ( !clientActivityRate )
				return null;

			var clientActivityRateDTO:ClientActivityRateDTO = new ClientActivityRateDTO();
			clientActivityRateDTO.clientId = clientActivityRate.ClientId;
			clientActivityRateDTO.activityId = clientActivityRate.ActivityId;
			clientActivityRateDTO.billableType = clientActivityRate.BillableType;
			clientActivityRateDTO.rate = clientActivityRate.Rate;
			clientActivityRateDTO.overTimeRate = clientActivityRate.OverTimeRate;

			return clientActivityRateDTO;
		}

		private static function expenseTypesFromJson( expenseType:Object ):ExpenseTypeDTO
		{
			if ( !expenseType )
				return null;

			var expenseTypeDTO:ExpenseTypeDTO = new ExpenseTypeDTO();
			expenseTypeDTO.expenseTypeId = expenseType.ExpenseTypeId;
			expenseTypeDTO.expenseTypeName = expenseType.ExpenseTypeName;
			expenseTypeDTO.amount = expenseType.Amount;
			expenseTypeDTO.taxPercentage = expenseType.TaxPercentage;
			expenseTypeDTO.isReimbursable = expenseType.IsReimbursable;
			expenseTypeDTO.isTaxable = expenseType.IsTaxable;

			return expenseTypeDTO;
		}

		private static function litigationTaskCodeFromJson( litigationTaskCode:Object ):LitigationTaskCodeDTO
		{
			if ( !litigationTaskCode )
				return null;

			var litigationTaskCodeDTO:LitigationTaskCodeDTO = new LitigationTaskCodeDTO();
			litigationTaskCodeDTO.litigationId = litigationTaskCode.LitigationId;
			litigationTaskCodeDTO.litigationName = litigationTaskCode.LitigationName;

			return litigationTaskCodeDTO;
		}

		private static function classesFromJson( classJson:Object ):ClasseDTO
		{
			if ( !classJson )
				return null;

			var classeDTO:ClasseDTO = new ClasseDTO();
			classeDTO.classId = classJson.ClassId;
			classeDTO.className = classJson.ClassName;

			return classeDTO;
		}

		private static function payrollFromJson( payroll:Object ):PayrollDTO
		{
			if ( !payroll )
				return null;

			var payrollDTO:PayrollDTO = new PayrollDTO();
			payrollDTO.payrollId = payroll.payrollId;
			payrollDTO.payrollName = payroll.payrollName;

			return payrollDTO;
		}

		private static function activityTypeFromJson( activityTypeJson:Object ):ActivityTypeDTO
		{
			if ( !activityTypeJson )
				return null;

			var activityTypeDTO:ActivityTypeDTO = new ActivityTypeDTO();
			activityTypeDTO.activityTypeId = activityTypeJson.ActivityTypeId;
			activityTypeDTO.activityTypeName = activityTypeJson.ActivityTypeName;
			activityTypeDTO.abaCode_Id = activityTypeJson.AbaCode_Id;

			return activityTypeDTO;
		}

		private static function clientProjectFromJson( clientProjectJson:Object ):ClientProjectDTO
		{
			if ( !clientProjectJson )
				return null;

			var clientProjectDTO:ClientProjectDTO = new ClientProjectDTO();
			clientProjectDTO.clientId = clientProjectJson.ClientId;
			clientProjectDTO.projectId = clientProjectJson.ProjectId;
			clientProjectDTO.clientProjectName = clientProjectJson.ClientProjectName;
			clientProjectDTO.showLitigation = clientProjectJson.ShowLitigation;

			return clientProjectDTO;
		}

		private static function employeeJsonFromJson( employeeJson:Object ):EmployeeDTO
		{
			if ( !employeeJson )
				return null;

			var employeeDTO:EmployeeDTO = new EmployeeDTO();
			employeeDTO.lookUpName = employeeJson.LookUpName;
			employeeDTO.lookupID = employeeJson.LookupID;
			employeeDTO.id = employeeJson.Id;
			employeeDTO.defaultPayrollId = employeeJson.DefaultPayrollId;
			employeeDTO.defaultPayrollName = employeeJson.DefaultPayrollName;
			employeeDTO.useTimeEntry = employeeJson.UseTimeEntry;
			employeeDTO.employeeType = employeeJson.EmployeeType;

			return employeeDTO;
		}

		private static function firmSettingsFromJson( settingsJson:Object ):FirmSettingDTO
		{
			if ( !settingsJson )
				return null;

			var settingsDTO:FirmSettingDTO = new FirmSettingDTO();
			settingsDTO.productId = settingsJson.ProductId;
			settingsDTO.productName = settingsJson.ProductName;
			settingsDTO.isAdmin = settingsJson.IsAdmin;
			settingsDTO.isPayroll = settingsJson.IsPayroll;
			settingsDTO.isClass = settingsJson.IsClass;
			settingsDTO.isShowRate = settingsJson.IsShowRate;
			settingsDTO.isApprovalProcess = settingsJson.IsApprovalProcess;
			settingsDTO.isOverrideRateEnabled = settingsJson.IsOverrideRateEnabled;
			settingsDTO.isPrepaidHours = settingsJson.IsOverrideRateEnabled;
			settingsDTO.isBillableDefault = settingsJson.IsBillableDefault;
			settingsDTO.isOvertimeEnabled = settingsJson.IsOvertimeEnabled;
			settingsDTO.isMilitaryTime = settingsJson.IsMilitaryTime;
			settingsDTO.timerRoundingHours = settingsJson.TimerRoundingHours;
			settingsDTO.timerRoundingMinutes = settingsJson.TimerRoundingMinutes;
			settingsDTO.timeZone = settingsJson.TimeZone;
			settingsDTO.dateFormat = settingsJson.DateFormat;
			settingsDTO.currencySymbol = settingsJson.CurrencySymbol;
			settingsDTO.isQBIntegrated = settingsJson.IsQBIntegrated;
			settingsDTO.isQBConnected = settingsJson.IsQBConnected;
			settingsDTO.qBType = settingsJson.QBType;
			settingsDTO.isTRLined = settingsJson.IsTRLined;
			settingsDTO.clientLabel = settingsJson.ClientLabel;
			settingsDTO.projectLabel = settingsJson.ProjectLabel;
			settingsDTO.userLabel = settingsJson.UserLabel;
			settingsDTO.activityLabel = settingsJson.ActivityLabel;

			return settingsDTO;
		}
	}
}
