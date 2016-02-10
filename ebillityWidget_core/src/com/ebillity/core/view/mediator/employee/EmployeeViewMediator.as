package com.ebillity.core.view.mediator.employee
{
	import com.ebillity.core.model.modelinfo.MenuInfoModelLocator;
	import com.ebillity.core.view.ui.employee.EmployeeView;

	import org.robotlegs.mvcs.Mediator;

	public class EmployeeViewMediator extends Mediator
	{

		[Inject]
		public var view:EmployeeView;

		[Inject]
		public var menuInfo:MenuInfoModelLocator;

		override public function onRegister():void
		{
			super.onRegister();
			menuInfo.selectedMenuSignal.add( menuInfo_selectedMenuHandler );
		}

		private function menuInfo_selectedMenuHandler( selectedMenu:String ):void
		{
			view.changeMenu( selectedMenu );
		}

		override public function onRemove():void
		{
			super.onRemove();
			menuInfo.selectedMenuSignal.remove( menuInfo_selectedMenuHandler );
		}
	}
}
