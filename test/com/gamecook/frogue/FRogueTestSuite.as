package com.gamecook.frogue
{
	import com.gamecook.frogue.enum.TilesEnumTest;
	import com.gamecook.frogue.factories.MapFactoryTest;
	import com.gamecook.frogue.maps.AbstaractMapTest;
	import com.gamecook.frogue.maps.RandomMapTest;
	import com.gamecook.frogue.maps.RoomTest;

	[Suite]

	[RunWith("org.flexunit.runners.Suite")]

	public class FRogueTestSuite 
	{

		public var test1 : FRogueCoreTest;
		public var test2 : MapFactoryTest;
		public var test3 : AbstaractMapTest;
		public var test4 : TilesEnumTest;
		public var test5 : RandomMapTest;
		public var test6 : RoomTest;
	}
}