package com.ebillity.core.view.ui.core
{
	
	import com.ebillity.core.constants.MenuConstants;
	
	import mx.controls.PopUpMenuButton;
	
	import spark.components.supportClasses.SkinnableComponent;
	
	
	
	public class TimePanel extends SkinnableComponent
	{
		[SkinPart(required="true")]
		public var timerMenu:PopUpMenuButton;
		
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
			
			switch(instance)
			{
				case timerMenu:
				{
					timerMenu.dataProvider = MenuConstants.TIMER_MENU;
				}
			}
		}
		
		override protected function partRemoved(partName:String, instance:Object) : void
		{
			super.partRemoved(partName, instance);
		}
		
	}
}