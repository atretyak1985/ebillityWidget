package com.ebillity.core.view.ui.controls
{
	
	
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import mx.managers.PopUpManager;
	import mx.states.OverrideBase;
	
	import spark.components.Button;
	import spark.components.supportClasses.SkinnableComponent;
	
	public class CustomPopUpWindow extends SkinnableComponent
	{
		[SkinPart(required="true")]
		public var confirmButton:ColorButton;
		
		[SkinPart(required="true")]
		public var cancelButton:ColorButton;
		
		[SkinPart(required="true")]
		public var closeButton:ColorIconButton;
		
		[Bindable]
		public var cancelButtonColor:uint;
		
		[Bindable]
		public var confirmButtonColor:uint;
		
		[Bindable]
		public var cancelButtonLabel:String;
		
		[Bindable]
		public var confirmButtonLabel:String;
		
		[Bindable]
		public var titleStr:String;
		
		[Bindable]
		public var mainMessage:String;
		
		
		
		
		public function CustomPopUpWindow()
		{
			super();
			
		}
		
		protected function clickclosehandler(event:Event):void
		{
			PopUpManager.removePopUp(this);
			
		}
		
		override protected function getCurrentSkinState():String
		{
			return super.getCurrentSkinState();
		}
		
		override protected function partAdded(partName:String, instance:Object):void
		{
			super.partAdded(partName,instance);
			switch(instance)
			{
				case closeButton:
				{
					closeButton.addEventListener(MouseEvent.CLICK,clickclosehandler);
					//confirmButton.addEventListener(MouseEvent.CLICK,clickclosehandler);
					//cancelButton.addEventListener(MouseEvent.CLICK,clickclosehandler);
					break;
				}

			}
			
		}
		
		override protected function partRemoved(partName:String, instance:Object):void
		{
			super.partRemoved(partName,instance);
		
		}
	}
}