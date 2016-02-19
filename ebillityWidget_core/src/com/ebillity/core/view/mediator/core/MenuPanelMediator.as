package com.ebillity.core.view.mediator.core
{
	import com.ebillity.core.controler.commands.base.signal.SignalParams;
	import com.ebillity.core.model.dto.FirmDTO;
	import com.ebillity.core.model.modelinfo.BaseInfoModelLocator;
	import com.ebillity.core.model.modelinfo.DataInfoModelLocator;
	import com.ebillity.core.view.ui.core.MenuPanel;
	import com.ebillity.core.view.ui.main.MainView;
	import org.robotlegs.mvcs.Mediator;

	public class MenuPanelMediator extends Mediator
	{

		[Inject]
		public var baseModel:BaseInfoModelLocator;

		[Inject]
		public var dataModel:DataInfoModelLocator;

		[Inject]
		public var view:MenuPanel;

		override public function onRegister():void
		{
			super.onRegister();

			baseModel.selectedMenuSignal.add( menuInfo_selectedMenuHandler );
			baseModel.showFirmSignal.add( showFirm_signalHandler );
			dataModel.selectedFirmSignal.add( selectedFirm_signalHandler );

			view.selectMenuSignal.add( selectMenuSignal_viewHandler );

			this.init();
		}

		override public function onRemove():void
		{
			super.onRemove();

			baseModel.selectedMenuSignal.remove( menuInfo_selectedMenuHandler );
			baseModel.showFirmSignal.remove( showFirm_signalHandler );
			dataModel.selectedFirmSignal.remove( selectedFirm_signalHandler );

			view.selectMenuSignal.remove( selectMenuSignal_viewHandler );
		}

		private function init():void
		{
			if ( baseModel.showFirm )
				showFirm_signalHandler( baseModel.showFirm );
		}

		private function menuInfo_selectedMenuHandler( selectedMenu:String ):void
		{
			view.selectMenu( selectedMenu );
		}

		private function selectMenuSignal_viewHandler( params:SignalParams ):void
		{
			baseModel.selectedMenu = params.paramsHolder[ "selectManu" ];
		}

		private function selectedFirm_signalHandler( firm:FirmDTO ):void
		{
			view.state = MenuPanel.STATE_MENU;
			view.firmName = firm ? firm.firmName : "";
		}

		private function showFirm_signalHandler( showFirm:Boolean ):void
		{
			if ( showFirm )
				view.state = MainView.STATE_FIRM;
		}
	}
}
