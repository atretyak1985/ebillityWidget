package com.ebillity.core.core
{
	import com.ebillity.core.controler.commands.CommandLogin;
	import com.ebillity.core.controler.commands.signals.SignalLogin;
	import com.ebillity.core.core.MappingCommand;

	public class MapCommands extends MappingCommand
	{
		override public function execute():void
		{
			signalCommandMap.mapSignalClass( SignalLogin, CommandLogin );
			//Common
		/*signalCommandMap.mapSignalClass( SignalAuthenticate, CommandAuthenticate );

		signalCommandMap.mapSignalClass( SignalBasePermissionTest, CommandBasePermissionTest );
		signalCommandMap.mapSignalClass( SignalGetAuthenticatedAccount, CommandGetAuthenticatedAccount );

		signalCommandMap.mapSignalClass( SignalChangePassword, CommandChangePassword );
		signalCommandMap.mapSignalClass( SignalForgotPassword, CommandForgotPassword );*/


			//Family
		/*signalCommandMap.mapSignalClass( SignalCreatePlatform, CommandCreatePlatform );
		signalCommandMap.mapSignalClass( SignalUpdatePlatform, CommandUpdatePlatform );
		signalCommandMap.mapSignalClass( SignalLoadPossiblePlatformForProject, CommandLoadPossiblePlatformForProject );
		signalCommandMap.mapSignalClass( SignalLoadPossiblePlatformForSubProject, CommandLoadPossiblePlatformForSubProject );*/


		}
	}
}

