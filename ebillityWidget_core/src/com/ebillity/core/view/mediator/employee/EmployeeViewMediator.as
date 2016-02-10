package com.ebillity.core.view.mediator.employee
{
	import com.ebillity.core.view.ui.employee.EmployeeView;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class EmployeeViewMediator extends Mediator
	{
		[Inject]
		public var view:EmployeeView;
		
		public function EmployeeViewMediator()
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