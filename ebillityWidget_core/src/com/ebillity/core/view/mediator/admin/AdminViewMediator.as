package com.ebillity.core.view.mediator.admin
{

	import com.ebillity.core.model.modelinfo.BaseInfoModelLocator;
	import com.ebillity.core.view.ui.admin.AdminView;

	import org.robotlegs.mvcs.Mediator;

	public class AdminViewMediator extends Mediator
	{

		[Inject]
		public var view:AdminView;

		[Inject]
		public var baseModel:BaseInfoModelLocator;

		override public function onRegister():void
		{
			super.onRegister();
			baseModel.selectedMenuSignal.add( menuInfo_selectedMenuHandler );
			this.init();
		}

		private function init():void
		{
			view.changeMenu( baseModel.selectedMenu );
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
