package com.ebillity.core.model.dto
{

	[Bindable]
	public class UserDTO
	{

		private var _sessionId:String;

		private var _userId:int;

		private var _firstName:String;

		private var _lastName:String;

		private var _isTempPassword:Boolean;

		public function get isTempPassword():Boolean
		{
			return _isTempPassword;
		}

		public function set isTempPassword( value:Boolean ):void
		{
			_isTempPassword = value;
		}

		public function get lastName():String
		{
			return _lastName;
		}

		public function set lastName( value:String ):void
		{
			_lastName = value;
		}

		public function get firstName():String
		{
			return _firstName;
		}

		public function set firstName( value:String ):void
		{
			_firstName = value;
		}

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
