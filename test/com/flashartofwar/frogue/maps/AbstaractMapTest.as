package com.flashartofwar.frogue.maps 
{
	import flash.geom.Point;

	import org.flexunit.Assert;

	import com.flashartofwar.frogue.maps.AbstractMap;

	/**
	 * @author jessefreeman
	 */
	public class AbstaractMapTest extends AbstractMap 
	{

		public function AbstaractMapTest()
		{
			super(this);
		}

		[Test]

		public function testThatGetTilesReturnsACopyOfTheTileArray() : void
		{
			tiles = ["#","#","_"];
			
			var tilesCopy : Array = tiles;
			
			tilesCopy.length = 0;
			
			Assert.assertEquals('There should be 3 tiles in the array.', tiles.length, 3);
		}

		[Test]

		public function testSetTilesStoresACleanCopyOfTheArray() : void
		{
			
			var tempTiles : Array = ["#","#","_"];
			
			tiles = tempTiles;
			
			tempTiles.length = 0;
			
			Assert.assertEquals('There should be 3 tiles in the array.', tiles.length, 3);
		}

		[Test]

		public function testCanEnter() : void
		{
			tiles = [["#","#","#"],["#","_","#"],["#","#","#"]];
			var point : Point = new Point(0, 1);
			Assert.assertTrue("Looking at " + getTileType(point) + " tile.", canEnter(point));	
		}

		[Test]

		public function testCanNotEnter() : void
		{
			tiles = [["#","#","#"],["#","_","#"],["#","#","#"]];
			var point : Point = new Point(1, 1);
			Assert.assertFalse("Looking at " + getTileType(point) + " tile.", canEnter(point));		
		}

		[Test]

		public function testGetTileType() : void
		{
			tiles = [["#","#","#"],["#","_","#"],["#","#","@"]];

			Assert.assertEquals(getTileType(new Point(1, 1)), "_");

			Assert.assertEquals(getTileType(new Point(2, 2)), "@");
		}

		[Test]

		public function testZeroSurroundingTiles() : void
		{
			tiles = [["01","02","03","04"],
					 ["05","06","07","08"],
					 ["09","10","11","12"],
					 ["13","14","15","16"],
					 ["17","18","19","20"],
					 ["21","22","23","24"]];
			
			var surroundingTiles : Array = getSurroundingTiles(new Point(2, 2), 1, 1);
			
			Assert.assertEquals(surroundingTiles.join(), "@");
		}

		[Test]

		public function testGetShallowSetOfSurroundingTiles() : void
		{
			tiles = [["01","02","03","04"],
					 ["05","06","07","08"],
					 ["09","10","11","12"],
					 ["13","14","15","16"],
					 ["17","18","19","20"],
					 ["21","22","23","24"]];
			
			var surroundingTiles : Array = getSurroundingTiles(new Point(0, 0), 3, 3);
			
			Assert.assertEquals(surroundingTiles.join(), "@,02,03,05,06,07,09,10,11");
		}

		[Test]

		public function testGetLargerSetOfSurroundingTiles() : void
		{
			tiles = [["01","02","03","04"],
					 ["05","06","07","08"],
					 ["09","10","11","12"],
					 ["13","14","15","16"],
					 ["17","18","19","20"],
					 ["21","22","23","24"]];
			var surroundingTiles : Array = getSurroundingTiles(new Point(1, 2), 3, 4);
			
			Assert.assertEquals(surroundingTiles.join(), "10,11,12,14,15,@,18,19,20,22,23,24");
		}

		[Test]

		public function testGetTilesInRowInBounds() : void
		{
			tiles = [["01","02","03","04"]];
			var selection : Array = getTilesInRow(0, 1, 3);
			
			Assert.assertEquals(selection.join(), "02,03,04");
		}

		[Test]

		public function testGetTilesInRowOutOfBounds() : void
		{
			tiles = [["01","02","03","04"]];
			var selection : Array = getTilesInRow(0, - 3, 7);
			
			Assert.assertEquals(selection.join(), "01,02,03,04,X,X,X,X,X,X");
		}

		[Test]

		public function testAddRow() : void
		{
			addRow(["#","#","#","#"]);
			Assert.assertEquals(tiles.length, 1);
		}

		[Test]

		public function testRemoveRow() : void
		{
			tiles = [["#","#","#","#"], ["#"," "," ","#"], ["#","#","#","#"]];
			removeRow(0);
			Assert.assertEquals((tiles[0] as Array).join(), "#, , ,#");
		}

        [Test]
        public function testMapWidth() : void
		{
			tiles = [["01","02","03","04"],
					 ["05","06","07","08"],
					 ["09","10","11","12"],
					 ["13","14","15","16"],
					 ["17","18","19","20"],
					 ["21","22","23","24"]];

			Assert.assertEquals(mapWidth, 4);
		}

        [Test]
        public function testMapHeight() : void
		{
			tiles = [["01","02","03","04"],
					 ["05","06","07","08"],
					 ["09","10","11","12"],
					 ["13","14","15","16"],
					 ["17","18","19","20"],
					 ["21","22","23","24"]];

			Assert.assertEquals(mapHeight, 6);
		}
	}
}
