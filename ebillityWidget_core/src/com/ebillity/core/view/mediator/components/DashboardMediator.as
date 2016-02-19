
package com.ebillity.core.view.mediator.components
{
	import com.ebillity.core.controler.commands.base.signal.SignalParams;
	import com.ebillity.core.model.modelinfo.BaseInfoModelLocator;
	import com.ebillity.core.view.ui.components.Dashboard;

	import org.robotlegs.mvcs.Mediator;

	public class DashboardMediator extends Mediator
	{

		[Inject]
		public var view:Dashboard;

		[Inject]
		public var baseModel:BaseInfoModelLocator;

		override public function onRegister():void
		{
			super.onRegister();
			view.selectMenuSignal.add( selectMenuSignal_viewHandler );
		}

		private function selectMenuSignal_viewHandler( params:SignalParams ):void
		{
			baseModel.selectedMenu = params.paramsHolder[ "selectManu" ];
		}

		override public function onRemove():void
		{
			super.onRemove();
			view.selectMenuSignal.remove( selectMenuSignal_viewHandler );
		}
	}
}
