package com.ebillity.core.model.dto
{
	import mx.collections.ArrayCollection;

	public class DataDTO
	{
		public var serverTime:Number;

		public var user:UserDTO;

		public var firms:ArrayCollection;

		public function get hasFirms():Boolean
		{
			return firms && firms.length > 0;
		}
	}
}
