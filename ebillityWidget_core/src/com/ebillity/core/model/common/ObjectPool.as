package com.ebillity.core.model.common
{
	import flash.utils.getDefinitionByName;
	import flash.utils.getQualifiedClassName;

	public class ObjectPool implements IObjectPool
	{

		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------

		public function ObjectPool( type:Class, size:int = 0 )
		{
			_type = type;
			objectList = [];

			if ( size > 0 )
				allocate( size );
		}

		//--------------------------------------------------------------------------
		//
		//  Properties
		//
		//--------------------------------------------------------------------------

		protected var _type:Class;

		protected var objectList:Array;

		public function disposeObject( object:Object ):void
		{
			if ( getDefinitionByName( getQualifiedClassName( object )) != type )
				throw new TypeError( "Disposed object type mismatch. Expected " + type + ", got " + getDefinitionByName( getQualifiedClassName( object )));

			if ( object is IDisposable )
				( object as IDisposable ).dispose();

			addObject( object );
		}

		public function empty():void
		{
			objectList.length = 0;
		}

		public function getObject():*
		{
			return ( numObjects > 0 ) ? objectList.pop() : createObject();
		}

		//--------------------------------------------------------------------------
		//
		//  Public Methods
		//
		//--------------------------------------------------------------------------

		public function hasObject( object:Object ):Boolean
		{
			return objectList.indexOf( object ) != -1;
		}

		public function get numObjects():int
		{
			return objectList.length;
		}

		//--------------------------------------------------------------------------
		//
		//  Getters / Setters
		//
		//--------------------------------------------------------------------------

		public function get type():Class
		{
			return _type;
		}

		//--------------------------------------------------------------------------
		//
		//  Protected Methods
		//
		//--------------------------------------------------------------------------

		protected function addObject( object:Object ):*
		{
			if ( !hasObject( object ))
				objectList[ objectList.length ] = object;

			return object;
		}

		protected function allocate( value:uint ):void
		{
			var m:int = value - numObjects;

			for ( var i:uint = 0; i < m; i++ )
				addObject( createObject());
		}

		protected function createObject():*
		{
			return new type();
		}
	}
}
