package com.ebillity.core.view.mediator.components
{
	import com.ebillity.core.view.ui.components.MyEntries;
	
	import org.robotlegs.mvcs.Mediator;
	
	
	
	public class MyEntriesMediator extends Mediator
	{
		[Inject]
		public var view:MyEntries;
		
		public function MyEntriesMediator()
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

