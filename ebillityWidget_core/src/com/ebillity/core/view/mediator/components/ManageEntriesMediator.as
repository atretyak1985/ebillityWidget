package com.ebillity.core.view.mediator.components
{
	
	import com.ebillity.core.view.ui.components.TeamEntries;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class ManageEntriesMediator extends Mediator
	{
		[Inject]
		public var view:TeamEntries;
		
		public function ManageEntriesMediator()
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

