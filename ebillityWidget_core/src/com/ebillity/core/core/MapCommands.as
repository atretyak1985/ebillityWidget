package com.ebillity.core.core
{
	import com.ebillity.core.controler.commands.CommandLogin;
	import com.ebillity.core.controler.commands.CommandSyncData;
	import com.ebillity.core.controler.commands.signals.SignalLogin;
	import com.ebillity.core.controler.commands.signals.SignalSyncData;
	import com.ebillity.core.core.MappingCommand;

	public class MapCommands extends MappingCommand
	{
		override public function execute():void
		{
			signalCommandMap.mapSignalClass( SignalLogin, CommandLogin );
			signalCommandMap.mapSignalClass( SignalSyncData, CommandSyncData );

		}
	}
}

