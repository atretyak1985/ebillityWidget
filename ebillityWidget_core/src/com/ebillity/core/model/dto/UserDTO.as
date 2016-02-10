package com.ebillity.core.model.dto
{

	[Bindable]
	public class UserDTO
	{
		private var _userId:int;

		private var _sessionId:String;

		public function get sessionId():String
		{
			return _sessionId;
		}

		public function set sessionId( value:String ):void
		{
			_sessionId = value;
		}

		public function get userId():int
		{
			return _userId;
		}

		public function set userId( value:int ):void
		{
			_userId = value;
		}

	}
}
