package com.ebillity.core.model.common
{

	public interface IObjectPool
	{
		function disposeObject( object:Object ):void;
		function getObject():*;
	}
}
