package com.ebillity.core.view.mediator.components
{
	
	import com.ebillity.core.view.ui.components.ExpenseEntry;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class ExpenseEntryMediator extends Mediator
	{
		[Inject]
		public var view:ExpenseEntry;
		
		public function ExpenseEntryMediator()
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