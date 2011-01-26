package com.flashartofwar.frogue 
{
	import com.flashartofwar.frogue.enum.TilesEnumTest;
	import com.flashartofwar.frogue.factories.MapFactoryTest;
	import com.flashartofwar.frogue.maps.AbstaractMapTest;
	import com.flashartofwar.frogue.maps.RandomMapTest;
	import com.flashartofwar.frogue.maps.RoomTest;

	[Suite]

	[RunWith("org.flexunit.runners.Suite")]

	public class FRogueTestSuite 
	{

		public var test1 : FRogueCoreTest;		public var test2 : MapFactoryTest;
		public var test3 : AbstaractMapTest;		public var test4 : TilesEnumTest;
		public var test5 : RandomMapTest;
		public var test6 : RoomTest;
	}
}