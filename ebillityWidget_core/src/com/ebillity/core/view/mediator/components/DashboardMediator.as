package com.ebillity.core.view.mediator.components
{
	import com.ebillity.core.view.ui.components.Dashboard;
	
	import org.robotlegs.mvcs.Mediator;

	public class DashboardMediator extends Mediator
	{
		[Inject]
		public var view:Dashboard;
		
		public function DashboardMediator()
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