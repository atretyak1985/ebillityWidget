package com.ebillity.core.view.mediator.employee
{
	import com.ebillity.core.model.modelinfo.BaseInfoModelLocator;
	import com.ebillity.core.view.ui.employee.EmployeeView;

	import org.robotlegs.mvcs.Mediator;

	public class EmployeeViewMediator extends Mediator
	{

		[Inject]
		public var view:EmployeeView;

		[Inject]
		public var baseModel:BaseInfoModelLocator;

		override public function onRegister():void
		{
			super.onRegister();
			baseModel.selectedMenuSignal.add( menuInfo_selectedMenuHandler );
		}

		private function menuInfo_selectedMenuHandler( selectedMenu:String ):void
		{
			view.changeMenu( selectedMenu );
		}

		override public function onRemove():void
		{
			super.onRemove();
			baseModel.selectedMenuSignal.remove( menuInfo_selectedMenuHandler );
		}
	}
}
