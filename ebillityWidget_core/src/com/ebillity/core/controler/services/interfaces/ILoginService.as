package com.ebillity.core.controler.services.interfaces
{
	import com.ebillity.core.controler.net.async.IPromise;

	public interface ILoginService
	{
		function loginUser( mail:String, password:String ):IPromise;
	}
}
