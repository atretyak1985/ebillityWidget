package com.ebillity.core.controler.net.async
{

	public class PromiseStatus implements IPromiseStatus
	{

		public static const CANCELLED:PromiseStatus = new PromiseStatus( "cancelled" );

		public static const COMPLETE:PromiseStatus = new PromiseStatus( "complete" );

		public static const FAILED:PromiseStatus = new PromiseStatus( "failed" );

		//--------------------------------------------------------------------------
		//
		//  Static Properties
		//
		//--------------------------------------------------------------------------

		public static const PENDING:PromiseStatus = new PromiseStatus( "pending" );

		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------

		public function PromiseStatus( status:String )
		{
			_status = status;
		}

		//--------------------------------------------------------------------------
		//
		//  Properties
		//
		//--------------------------------------------------------------------------

		protected var _status:String;

		//--------------------------------------------------------------------------
		//
		//  Public Methods
		//
		//--------------------------------------------------------------------------

		public function toString():String
		{
			return _status;
		}
	}
}
