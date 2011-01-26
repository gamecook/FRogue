package com.flashartofwar.frogue.factories 
{
	import com.flashartofwar.frogue.maps.IMap;
	import com.flashartofwar.frogue.maps.RandomMap;

	/**
	 * @author jessefreeman
	 */
	public class MapFactory 
	{

		public static function createRandomMap(size : Number) : IMap
		{
			return new RandomMap(size);		
		}
	}
}
