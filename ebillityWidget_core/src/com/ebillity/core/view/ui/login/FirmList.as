package com.ebillity.core.view.ui.login
{

	import com.ebillity.core.controler.commands.base.signal.SignalParams;
	import com.ebillity.core.model.dto.FirmDTO;

	import mx.collections.ArrayCollection;

	import spark.components.DataGrid;
	import spark.components.supportClasses.SkinnableComponent;
	import spark.events.GridEvent;

	import org.osflash.signals.Signal;


	public class FirmList extends SkinnableComponent
	{

		[SkinPart( required = "true" )]
		public var firmGrid:DataGrid;

		public var selectFirmSignal:Signal = new Signal( FirmDTO );

		private var _dataProvider:ArrayCollection;

		private var _isDataProvider:Boolean;

		public function set dataProvider( value:ArrayCollection ):void
		{
			if ( _dataProvider != value )
			{
				_dataProvider = value;
				_isDataProvider = true;
				this.invalidateProperties();
			}
		}

		override protected function commitProperties():void
		{
			super.commitProperties();

			if ( _isDataProvider )
			{
				_isDataProvider = false;
				firmGrid.dataProvider = _dataProvider;
			}

		}

		override protected function getCurrentSkinState():String
		{
			return super.getCurrentSkinState();
		}

		override protected function partAdded( partName:String, instance:Object ):void
		{
			super.partAdded( partName, instance );

			switch ( instance )
			{
				case firmGrid:
				{
					firmGrid.addEventListener( GridEvent.GRID_DOUBLE_CLICK, firmGrid_clickEventHamdler );
					break;
				}
			}
		}

		protected function firmGrid_clickEventHamdler( event:GridEvent ):void
		{
			var firm:FirmDTO = event.item as FirmDTO;
			selectFirmSignal.dispatch( firm );
		}

		override protected function partRemoved( partName:String, instance:Object ):void
		{
			super.partRemoved( partName, instance );

			switch ( instance )
			{
				case firmGrid:
				{
					firmGrid.removeEventListener( GridEvent.GRID_DOUBLE_CLICK, firmGrid_clickEventHamdler );
					break;
				}
			}
		}

	}
}
