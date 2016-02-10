package com.ebillity.core.services.base
{
	import com.ebillity.core.controler.net.async.IPromise;

	public interface IWebService
	{
		function call( command:String, ... arguments:* ):IPromise;
		function callWebService( command:String, ... arguments:* ):IPromise;
	}
}
