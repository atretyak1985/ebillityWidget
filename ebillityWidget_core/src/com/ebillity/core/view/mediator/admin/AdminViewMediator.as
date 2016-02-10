package com.ebillity.core.view.mediator.admin
{

	import com.ebillity.core.model.modelinfo.MenuInfoModelLocator;
	import com.ebillity.core.view.ui.admin.AdminView;

	import org.robotlegs.mvcs.Mediator;

	public class AdminViewMediator extends Mediator
	{

		[Inject]
		public var view:AdminView;

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
