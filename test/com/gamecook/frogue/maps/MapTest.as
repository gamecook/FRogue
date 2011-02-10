package com.gamecook.frogue.maps
{
	import flash.geom.Point;

    import flash.geom.Rectangle;

    import org.flexunit.Assert;

	import com.gamecook.frogue.maps.Map;

	/**
	 * @author jessefreeman
	 */
	public class MapTest extends Map
	{

		public function MapTest()
		{
			super();
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

		public function testGetTileType() : void
		{
			tiles = [["#","#","#"],["#","_","#"],["#","#","@"]];

			Assert.assertEquals(getTileType(new Point(1, 1)), "_");

			Assert.assertEquals(getTileType(new Point(2, 2)), "@");
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
			tiles = [["a","b","c","d"],
					 ["e","f","g","h"],
					 ["i","j","k","l"],
					 ["m","n","o","p"],
					 ["q","r","s","t"],
					 ["u","v","w","x"]];

			Assert.assertEquals(width, 4, _width);
		}

        [Test]
        public function testMapHeight() : void
		{
			tiles = [["a","b","c","d"],
					 ["e","f","g","h"],
					 ["i","j","k","l"],
					 ["m","n","o","p"],
					 ["q","r","s","t"],
					 ["u","v","w","x"]];

			Assert.assertEquals(height, 6);
		}

        [Test]
        public function testTileID0() : void
		{
			tiles = [["0","1","2","3"],
					 ["4","5","6","7"],
					 ["8","9","10","1l"],
					 ["12","13","14","15"],
					 ["16","17","18","19"],
					 ["20","21","22","23"]];

			Assert.assertEquals(0, getTileID(0,0));
		}

        [Test]
        public function testTileID20() : void
		{
			tiles = [["0","1","2","3"],
					 ["4","5","6","7"],
					 ["8","9","10","1l"],
					 ["12","13","14","15"],
					 ["16","17","18","19"],
					 ["20","21","22","23"]];

			Assert.assertEquals(20, getTileID(5,0));
		}

        [Test]
        public function testTileID23() : void
		{
			tiles = [["0","1","2","3"],
					 ["4","5","6","7"],
					 ["8","9","10","1l"],
					 ["12","13","14","15"],
					 ["16","17","18","19"],
					 ["20","21","22","23"]];

			Assert.assertEquals(23, getTileID(5,3));
		}

	}
}
