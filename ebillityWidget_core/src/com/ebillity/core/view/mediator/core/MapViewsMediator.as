package com.ebillity.core.view.mediator.core
{
	import com.ebillity.core.core.MapViews;
	
	import org.robotlegs.mvcs.Mediator;

	public class MapViewsMediator extends Mediator
	{
		[Inject]
		public var view:MapViews;
		
		public function MapViewsMediator()
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