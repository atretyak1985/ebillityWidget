package com.ebillity.core.view.ui.core
{
	
	import spark.components.supportClasses.SkinnableComponent;
	
	
	
	public class TimePanel extends SkinnableComponent
	{
		
		public function TimePanel()
		{
			super();
		}
		
		override protected function getCurrentSkinState():String
		{
			return super.getCurrentSkinState();
		} 
		
		override protected function partAdded(partName:String, instance:Object) : void
		{
			super.partAdded(partName, instance);
		}
		
		override protected function partRemoved(partName:String, instance:Object) : void
		{
			super.partRemoved(partName, instance);
		}
		
	}
}