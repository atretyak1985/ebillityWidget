package com.ebillity.core.controler.context
{

	import com.ebillity.core.core.MapCommands;
	import com.ebillity.core.core.MapModels;
	import com.ebillity.core.core.MapPopUp;
	import com.ebillity.core.core.MapServices;
	import com.ebillity.core.core.MapViews;
	
	import flash.display.DisplayObjectContainer;
	
	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.base.GuardedSignalCommandMap;
	import org.robotlegs.core.IGuardedSignalCommandMap;
	import org.robotlegs.mvcs.SignalContext;

	public class EbillityContext extends SignalContext
	{
		public function EbillityContext( contextView:DisplayObjectContainer = null, autoStartup:Boolean = true )
		{
			signalCommandMap = new GuardedSignalCommandMap( injector.createChild( injector.applicationDomain ));

			super( contextView, autoStartup );
		}

		override public function startup():void
		{
			mapMappingCommands();

			super.startup();
		}

		override protected function mapInjections():void
		{
			super.mapInjections();

			injector.mapValue( IGuardedSignalCommandMap, signalCommandMap );
		}

		protected function mapMappingCommands():void
		{
			commandMap.mapEvent( ContextEvent.STARTUP_COMPLETE, MapCommands, ContextEvent, true );
			commandMap.mapEvent( ContextEvent.STARTUP_COMPLETE, MapModels, ContextEvent, true );
			commandMap.mapEvent( ContextEvent.STARTUP_COMPLETE, MapServices, ContextEvent, true );
			commandMap.mapEvent( ContextEvent.STARTUP_COMPLETE, MapViews, ContextEvent, true );
			commandMap.mapEvent( ContextEvent.STARTUP_COMPLETE, MapPopUp, ContextEvent, true );
		}
	}
}
