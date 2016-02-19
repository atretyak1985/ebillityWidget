package com.ebillity.core.view.mediator.main
{
	import com.ebillity.core.constants.MenuConstants;
	import com.ebillity.core.controler.commands.base.signal.SignalParams;
	import com.ebillity.core.controler.commands.signals.SignalSyncData;
	import com.ebillity.core.model.dto.DataDTO;
	import com.ebillity.core.model.dto.FirmDTO;
	import com.ebillity.core.model.modelinfo.BaseInfoModelLocator;
	import com.ebillity.core.model.modelinfo.DataInfoModelLocator;
	import com.ebillity.core.view.ui.main.MainView;
	import org.robotlegs.mvcs.Mediator;

	public class MainViewMediator extends Mediator
	{

		[Inject]
		public var baseModel:BaseInfoModelLocator;

		[Inject]
		public var dataModel:DataInfoModelLocator;

		[Inject]
		public var syncDataSignal:SignalSyncData;

		[Inject]
		public var view:MainView;

		override public function onRegister():void
		{
			super.onRegister();
			baseModel.loggedInSignal.add( userLogin_signalHandler );
			baseModel.selectedMenuSignal.add( menuInfo_selectedMenuHandler );
			dataModel.selectedFirmSignal.add( selectedFirm_signalHandler );
			dataModel.syncDataSignal.add( syncData_signalHandler );
		}

		override public function onRemove():void
		{
			super.onRemove();
			baseModel.loggedInSignal.remove( userLogin_signalHandler );
			baseModel.selectedMenuSignal.remove( menuInfo_selectedMenuHandler );
			dataModel.selectedFirmSignal.remove( selectedFirm_signalHandler );
			dataModel.syncDataSignal.remove( syncData_signalHandler );
		}

		private function logout():void
		{
			view.state = MainView.STATE_LOGIN;
			dataModel = new DataInfoModelLocator();
		}

		private function menuInfo_selectedMenuHandler( selectedMenu:String ):void
		{
			if ( selectedMenu == MenuConstants.SWITCH_FIRMS )
				showFirms();
			else if ( selectedMenu == MenuConstants.LOGOUT )
				logout();
		}

		private function selectedFirm_signalHandler( firm:FirmDTO ):void
		{
			view.state = MainView.STATE_ADMIN;
			baseModel.selectedMenu = MenuConstants.DASHBOARD;
		}

		private function showFirms():void
		{
			view.state = MainView.STATE_FIRM;
			baseModel.showFirm = true;
		}

		private function syncData_signalHandler( syncData:DataDTO ):void
		{
			if ( syncData && syncData.hasFirms )
			{
				showFirms();
			}
			else
				view.state = MainView.STATE_ADMIN;
		}

		private function userLogin_signalHandler( isLogin:Boolean ):void
		{
			if ( isLogin )
				syncDataSignal.dispatch( new SignalParams(), null );
		}
	}
}
