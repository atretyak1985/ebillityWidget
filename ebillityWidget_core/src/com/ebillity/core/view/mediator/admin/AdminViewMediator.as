package com.ebillity.core.view.mediator.admin
{
	
	import com.ebillity.core.view.ui.admin.AdminView;
	
	import org.robotlegs.mvcs.Mediator;

	public class AdminViewMediator extends Mediator
	{
		[Inject]
		public var view:AdminView;
		
		public function AdminViewMediator()
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