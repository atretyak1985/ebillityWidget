package com.ebillity.core.view.mediator.main
{
	import com.ebillity.core.controler.commands.base.signal.SignalParams;
	import com.ebillity.core.controler.commands.signals.SignalSyncData;
	import com.ebillity.core.model.dto.DataDTO;
	import com.ebillity.core.model.modelinfo.BaseInfoModelLocator;
	import com.ebillity.core.model.modelinfo.DataInfoModelLocator;
	import com.ebillity.core.view.ui.main.MainView;

	import org.robotlegs.mvcs.Mediator;



	public class MainViewMediator extends Mediator
	{

		[Inject]
		public var view:MainView;

		[Inject]
		public var baseInfoModel:BaseInfoModelLocator;

		[Inject]
		public var syncDataSignal:SignalSyncData;

		[Inject]
		public var dataModel:DataInfoModelLocator;

		override public function onRegister():void
		{
			super.onRegister();
			baseInfoModel.loggedInSignal.add( userLogin_signalHandler );
			dataModel.syncDataSignal.add( syncData_signalHandler );
		}

		private function syncData_signalHandler( syncData:DataDTO ):void
		{
			if ( syncData && syncData.hasFirms )
			{
				view.state = MainView.STATE_FIRM;
				baseInfoModel.showFirm = true;
			}
			else
				view.state = MainView.STATE_ADMIN;
		}

		private function userLogin_signalHandler( isLogin:Boolean ):void
		{
			if ( isLogin )
				syncDataSignal.dispatch( new SignalParams(), null );
		}

		override public function onRemove():void
		{
			super.onRemove();
			baseInfoModel.loggedInSignal.remove( userLogin_signalHandler );
			dataModel.syncDataSignal.remove( syncData_signalHandler );
		}
	}
}
