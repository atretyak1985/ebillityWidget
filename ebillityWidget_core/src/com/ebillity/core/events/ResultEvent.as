package com.ebillity.core.events
{

	import flash.events.Event;

	public class ResultEvent extends Event
	{
		public static const GET_REPORT_DESIGN_LAYOUT_LIST:String = "getReportDesignLayoutList.ResultEvent";

		public function ResultEvent( type:String, result:Object = null, bubbles:Boolean = false, cancelable:Boolean = false )
		{
			super( type, bubbles, cancelable );
			_result = result;
		}

		private var _result:Object;

		override public function clone():Event
		{
			return new ResultEvent( type, result, bubbles, cancelable )
		}

		public function get result():Object
		{
			if ( _result.hasOwnProperty( "result" ))
				return _result.result;
			else
				return _result;
		}
	}
}


