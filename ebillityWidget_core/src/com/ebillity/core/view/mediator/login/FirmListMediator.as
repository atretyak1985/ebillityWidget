package com.ebillity.core.view.mediator.login
{
	import com.ebillity.core.model.dto.DataDTO;
	import com.ebillity.core.model.modelinfo.DataInfoModelLocator;
	import com.ebillity.core.view.ui.login.FirmList;

	import org.robotlegs.mvcs.Mediator;

	public class FirmListMediator extends Mediator
	{

		[Inject]
		public var dataInfo:DataInfoModelLocator;

		[Inject]
		public var view:FirmList;

		override public function onRegister():void
		{
			super.onRegister();
			dataInfo.syncDataSignal.add( syncData_signalHandler );

			this.init();
		}

		private function init():void
		{
			if ( dataInfo.syncData )
				syncData_signalHandler( dataInfo.syncData );
		}

		private function syncData_signalHandler( data:DataDTO ):void
		{
			view.dataProvider = data.firms;
		}

		override public function onRemove():void
		{
			super.onRemove();
			dataInfo.syncDataSignal.remove( syncData_signalHandler );
		}
	}
}
