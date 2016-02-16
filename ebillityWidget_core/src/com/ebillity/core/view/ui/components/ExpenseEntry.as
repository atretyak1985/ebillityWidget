package com.ebillity.core.view.ui.components
{
	import com.ebillity.core.view.ui.core.NavigatePanel;

	import spark.components.supportClasses.SkinnableComponent;

	public class ExpenseEntry extends SkinnableComponent
	{

		[SkinPart( required = "true" )]
		public var navigatePanel:NavigatePanel;

		override protected function getCurrentSkinState():String
		{
			return super.getCurrentSkinState();
		}

		override protected function partAdded( partName:String, instance:Object ):void
		{
			super.partAdded( partName, instance );

			switch ( instance )
			{
				case navigatePanel:
				{
					navigatePanel.button1ClickSignal.add( navigatePanel_buttonClickHandler );
					navigatePanel.button2ClickSignal.add( navigatePanel_buttonClickHandler );
					navigatePanel.button3ClickSignal.add( navigatePanel_buttonClickHandler );
					break;
				}
			}
		}

		private function navigatePanel_buttonClickHandler( buttonId:String ):void
		{
			switch ( buttonId )
			{
				case NavigatePanel.BUTTON_1:
				{

					break;
				}
				case NavigatePanel.BUTTON_2:
				{

					break;
				}
				case NavigatePanel.BUTTON_3:
				{

					break;
				}
			}
		}

		override protected function partRemoved( partName:String, instance:Object ):void
		{
			super.partRemoved( partName, instance );

			switch ( instance )
			{
				case navigatePanel:
				{
					navigatePanel.button1ClickSignal.remove( navigatePanel_buttonClickHandler );
					navigatePanel.button2ClickSignal.remove( navigatePanel_buttonClickHandler );
					navigatePanel.button3ClickSignal.remove( navigatePanel_buttonClickHandler );
					break;
				}
			}
		}
	}
}
