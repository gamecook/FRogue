package com.gamecook.frogue
{
	import com.gamecook.frogue.maps.MapTest;
	import com.gamecook.frogue.maps.RandomMapTest;
	import com.gamecook.frogue.maps.RoomTest;

	[Suite]

	[RunWith("org.flexunit.runners.Suite")]

	public class FRogueTestSuite 
	{

		public var test1 : FRogueCoreTest;
		public var test3 : MapTest;
		public var test5 : RandomMapTest;
		public var test6 : RoomTest;
	}
}