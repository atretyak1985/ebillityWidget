package com.ebillity.core.core
{
	import org.robotlegs.core.IGuardedSignalCommandMap;
	import org.robotlegs.core.IViewMap;
	import org.robotlegs.mvcs.Command;
	
	public class MappingCommand extends Command
	{
		[Inject] public var viewMap:IViewMap;
		[Inject] public var signalCommandMap:IGuardedSignalCommandMap;
		
		public function MappingCommand()
		{
			super();
		}
	}
}