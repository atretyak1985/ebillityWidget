package com.ebillity.core.core
{
	import com.ebillity.core.core.MappingCommand;
	import com.ebillity.core.model.modelinfo.BaseInfoModelLocator;
	import com.ebillity.core.model.modelinfo.MenuInfoModelLocator;
	import com.ebillity.core.model.modelinfo.UserInfoModelLocator;

	public class MapModels extends MappingCommand
	{
		override public function execute():void
		{
			//injector.mapSingleton( BaseInfoModelLocator );
			injector.mapSingleton( UserInfoModelLocator );
			injector.mapSingleton( BaseInfoModelLocator );
			injector.mapSingleton( MenuInfoModelLocator );
		}
	}
}


