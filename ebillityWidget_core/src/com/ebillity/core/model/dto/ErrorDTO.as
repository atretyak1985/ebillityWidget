package com.ebillity.core.model.dto
{

	[Bindable]
	public class ErrorDTO
	{
		private var _errorId:int;

		private var _errorMessage:String;

		public function get errorId():int
		{
			return _errorId;
		}

		public function set errorId( value:int ):void
		{
			_errorId = value;
		}


		public function get errorMessage():String
		{
			return _errorMessage;
		}

		public function set errorMessage( value:String ):void
		{
			_errorMessage = value;
		}
	}
}
