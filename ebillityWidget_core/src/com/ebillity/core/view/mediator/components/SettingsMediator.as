package com.ebillity.core.view.mediator.components
{
	import com.ebillity.core.view.ui.components.Settings;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class SettingsMediator extends Mediator
	{
		[Inject]
		public var view:Settings;
		
		public function SettingsMediator()
		{
		}
		
		override public function onRegister():void
		{
		}
		
		override public function onRemove():void
		{
		}
	}
}