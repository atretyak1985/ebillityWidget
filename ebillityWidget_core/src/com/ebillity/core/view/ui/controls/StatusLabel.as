package com.ebillity.core.view.ui.controls
{
	import spark.components.Image;
	import spark.components.Label;
	import spark.components.supportClasses.SkinnableComponent;

	public class StatusLabel extends SkinnableComponent
	{

		[SkinPart( required = "true" )]
		public var iconStatus:Image;

		[SkinPart( required = "true" )]
		public var labelStatus:Label;

		private var _icon:Class;

		private var _isIconChanged:Boolean;

		private var _isLabelChanged:Boolean;

		private var _label:String;

		public function get label():String
		{
			return _label;
		}

		public function set label( value:String ):void
		{
			_label = value;
			_isLabelChanged = true;
			this.invalidateProperties();
		}

		public function set icon( value:Class ):void
		{
			_icon = value;
			_isIconChanged = true;
			this.invalidateProperties();
		}

		override protected function commitProperties():void
		{
			super.commitProperties();

			if ( _isIconChanged )
			{
				iconStatus.source = _icon;
				_isIconChanged = false;
			}

			if ( _isLabelChanged )
			{
				labelStatus.text = _label;
				_isLabelChanged = false;
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
