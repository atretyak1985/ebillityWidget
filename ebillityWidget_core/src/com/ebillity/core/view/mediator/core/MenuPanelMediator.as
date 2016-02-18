package com.ebillity.core.view.mediator.core
{
	import com.ebillity.core.controler.commands.base.signal.SignalParams;
	import com.ebillity.core.model.modelinfo.BaseInfoModelLocator;
	import com.ebillity.core.model.modelinfo.MenuInfoModelLocator;
	import com.ebillity.core.view.ui.core.MenuPanel;
	import com.ebillity.core.view.ui.main.MainView;

	import org.robotlegs.mvcs.Mediator;

	public class MenuPanelMediator extends Mediator
	{

		[Inject]
		public var view:MenuPanel;

		[Inject]
		public var menuInfo:MenuInfoModelLocator;

		[Inject]
		public var baseInfo:BaseInfoModelLocator;

		override public function onRegister():void
		{
			super.onRegister();

			menuInfo.selectedMenuSignal.add( menuInfo_selectedMenuHandler );
			baseInfo.showFirmSignal.add( showFirm_signalHandler );

			view.selectMenuSignal.add( selectMenuSignal_viewHandler );

			this.init();
		}

		private function init():void
		{
			if ( baseInfo.showFirm )
				showFirm_signalHandler( baseInfo.showFirm );
		}

		private function showFirm_signalHandler( showFirm:Boolean ):void
		{
			if ( showFirm )
				view.state = MainView.STATE_FIRM;
		}

		private function menuInfo_selectedMenuHandler( selectedMenu:String ):void
		{
			view.selectMenu( selectedMenu );
		}

		private function selectMenuSignal_viewHandler( params:SignalParams ):void
		{
			menuInfo.selectedMenu = params.paramsHolder[ "selectManu" ];
		}

		override public function onRemove():void
		{
			super.onRemove();
			view.selectMenuSignal.remove( selectMenuSignal_viewHandler );
		}
	}
}
