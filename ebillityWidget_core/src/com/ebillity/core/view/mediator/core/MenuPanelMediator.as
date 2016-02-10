package com.ebillity.core.view.mediator.core
{
	import com.ebillity.core.controler.commands.base.signal.SignalParams;
	import com.ebillity.core.model.modelinfo.MenuInfoModelLocator;
	import com.ebillity.core.view.ui.core.MenuPanel;

	import org.robotlegs.mvcs.Mediator;

	public class MenuPanelMediator extends Mediator
	{

		[Inject]
		public var view:MenuPanel;

		[Inject]
		public var menuInfo:MenuInfoModelLocator;

		override public function onRegister():void
		{
			super.onRegister();

			menuInfo.selectedMenuSignal.add( menuInfo_selectedMenuHandler );

			view.selectMenuSignal.add( selectMenuSignal_viewHandler );
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
