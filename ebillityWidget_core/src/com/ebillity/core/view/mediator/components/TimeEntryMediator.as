package com.ebillity.core.view.mediator.components
{
	import com.ebillity.core.view.ui.components.TimeEntry;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class TimeEntryMediator extends Mediator
	{
		[Inject]
		public var view:TimeEntry;
		
		public function TimeEntryMediator()
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