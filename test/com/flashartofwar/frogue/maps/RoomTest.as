package com.flashartofwar.frogue.maps 
{
	import org.flexunit.Assert;

	/**
	 * @author jessefreeman
	 */
	
	public class RoomTest 
	{
		[Test]
		public function testCreateRoom():void
		{
			var room:Room = new Room(0, 0, 5, 10);
			
			Assert.assertEquals(room.width, 5);			Assert.assertEquals(room.height, 10);
		}
		
		[Test]
		public function testGetWidth():void
		{
			var room:Room = new Room(4, 3, 10, 5);
			Assert.assertEquals(room.width, 6);
		}
		
		[Test]
		public function testGetHeight():void
		{
			var room:Room = new Room(1, 5, 3, 30);
			Assert.assertEquals(room.height, 25);
		}
		
		[Test]
		public function testToString():void
		{
			var room:Room = new Room(1, 2, 3, 4);
			Assert.assertEquals(room.toString(), "[room 1, 2, 3, 4]");
		}
		
		[Ignore("Not Ready to Run")]
		public function testEdges():void
		{
			var room:Room = new Room(1,1,2,2);
			var array:Array = [
								{x:1,y:1,dir:3}
			
								];
			
			
			Assert.assertEquals(room.edges()[0].y, room.edges()[0], {x:1,y:1,dir:3});
		}
	}
}
