package com.ebillity.core.view.ui.controls
{
	
	import spark.components.supportClasses.SkinnableComponent;
	
	
	
	public class EntriesGrid extends SkinnableComponent
	{
		
		public function EntriesGrid()
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