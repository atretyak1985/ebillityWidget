package com.ebillity.core.view.ui.login
{

	import mx.collections.ArrayCollection;

	import spark.components.DataGrid;
	import spark.components.supportClasses.SkinnableComponent;



	public class FirmList extends SkinnableComponent
	{

		[SkinPart( required = "true" )]
		public var firmGrid:DataGrid;

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
		}

		override protected function partRemoved( partName:String, instance:Object ):void
		{
			super.partRemoved( partName, instance );
		}

	}
}
