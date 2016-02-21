package com.ebillity.core.view.ui.controls
{
	import mx.controls.DateField;
	
	public class customDateField extends DateField
	{
		public function customDateField()
		{
			super();
		}
		override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void
		{
			super.updateDisplayList(unscaledWidth,unscaledHeight);
			
			this.getChildAt(1).x=this.textInput.x+this.textInput.width;
		}
	}
}