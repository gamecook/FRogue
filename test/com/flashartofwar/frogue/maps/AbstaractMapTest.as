package com.flashartofwar.frogue.maps 
{
	import flash.geom.Point;

    import flash.geom.Rectangle;

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
			tiles = [["a","b","c","d"],
					 ["e","f","g","h"],
					 ["i","j","k","l"],
					 ["m","n","o","p"],
					 ["q","r","s","t"],
					 ["u","v","w","x"]];
			
			var surroundingTiles : Array = getSurroundingTiles(new Point(2, 2), 1, 1);
			
			Assert.assertEquals(surroundingTiles.join(), "k");
		}

		[Test]
		public function testGetShallowSetOfSurroundingTiles() : void
		{
			tiles = [["a","b","c","d"],
					 ["e","f","g","h"],
					 ["i","j","k","l"],
					 ["m","n","o","p"],
					 ["q","r","s","t"],
					 ["u","v","w","x"]];
			
			var surroundingTiles : Array = getSurroundingTiles(new Point(0, 0), 3, 3);
			
			Assert.assertEquals(surroundingTiles.join(), "a,b,c,e,f,g,i,j,k");
		}

		[Test]
		public function testGetLargerSetOfSurroundingTiles() : void
		{
			tiles = [["a","b","c","d"],
					 ["e","f","g","h"],
					 ["i","j","k","l"],
					 ["m","n","o","p"],
					 ["q","r","s","t"],
					 ["u","v","w","x"]];
			var surroundingTiles : Array = getSurroundingTiles(new Point(1, 2), 3, 5);
			
			Assert.assertEquals(surroundingTiles.join(), "a,b,c,e,f,g,i,j,k,m,n,o,q,r,s");
		}

        [Test]
		public function testGetUpperLeftSurroundingTiles() : void
		{
			tiles = [["a","b","c","d"],
					 ["e","f","g","h"],
					 ["i","j","k","l"],
					 ["m","n","o","p"],
					 ["q","r","s","t"],
					 ["u","v","w","x"]];
			var surroundingTiles : Array = getSurroundingTiles(new Point(0, 0), 3, 5);

			Assert.assertEquals(surroundingTiles.join(), "a,b,c,e,f,g,i,j,k,m,n,o,q,r,s");
		}

        [Test]
		public function testGetUpperRightSurroundingTiles() : void
		{
			tiles = [["a","b","c","d"],
					 ["e","f","g","h"],
					 ["i","j","k","l"],
					 ["m","n","o","p"],
					 ["q","r","s","t"],
					 ["u","v","w","x"]];
			var surroundingTiles : Array = getSurroundingTiles(new Point(3, 0), 3, 5);

			Assert.assertEquals(surroundingTiles.join(), "b,c,d,f,g,h,j,k,l,n,o,p,r,s,t");
		}

        [Test]
		public function testGetCenterSurroundingTiles() : void
		{
			tiles = [["a","b","c","d"],
					 ["e","f","g","h"],
					 ["i","j","k","l"],
					 ["m","n","o","p"],
					 ["q","r","s","t"],
					 ["u","v","w","x"]];
			var surroundingTiles : Array = getSurroundingTiles(new Point(1, 2), 3, 5);

			Assert.assertEquals(surroundingTiles.join(), "a,b,c,e,f,g,i,j,k,m,n,o,q,r,s");
		}

        [Test]
		public function testGetCenterRightSurroundingTiles() : void
		{
			tiles = [["a","b","c","d"],
					 ["e","f","g","h"],
					 ["i","j","k","l"],
					 ["m","n","o","p"],
					 ["q","r","s","t"],
					 ["u","v","w","x"]];
			var surroundingTiles : Array = getSurroundingTiles(new Point(2, 3), 3, 5);

			Assert.assertEquals(surroundingTiles.join(), "f,g,h,j,k,l,n,o,p,r,s,t,v,w,x");
		}

        [Test]
		public function testGetCenterSurroundingTilesLargeSet() : void
		{
			tiles = [["a","b","c","d"],
					 ["e","f","g","h"],
					 ["i","j","k","l"],
					 ["m","n","o","p"],
					 ["q","r","s","t"],
					 ["u","v","w","x"]];
			var surroundingTiles : Array = getSurroundingTiles(new Point(3, 2), 4, 5);

			Assert.assertEquals(surroundingTiles.join(), "a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t");
		}

        [Test]
		public function testGetFullMapLargeSetA() : void
		{
			tiles = [["a","b","c","d"],
					 ["e","f","g","h"],
					 ["i","j","k","l"],
					 ["m","n","o","p"],
					 ["q","r","s","t"],
					 ["u","v","w","x"]];
			var surroundingTiles : Array = getSurroundingTiles(new Point(3, 2), mapWidth, mapHeight);

			Assert.assertEquals(surroundingTiles.join(), "a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x");
		}

        [Test]
		public function testGetMapWithUniqueSize() : void
		{
			tiles = [["a","b","c","d"],
					 ["e","f","g","h"],
					 ["i","j","k","l"],
					 ["m","n","o","p"],
					 ["q","r","s","t"],
					 ["u","v","w","x"]];
			var surroundingTiles : Array = getSurroundingTiles(new Point(3, 2), 4, 3);

			Assert.assertEquals(surroundingTiles.join(), "e,f,g,h,i,j,k,l,m,n,o,p");
		}

        [Test]
		public function testGetMapWithUniqueSize2() : void
		{
			tiles = [["a","b","c","d"],
					 ["e","f","g","h"],
					 ["i","j","k","l"],
					 ["m","n","o","p"],
					 ["q","r","s","t"],
					 ["u","v","w","x"]];
			var surroundingTiles : Array = getSurroundingTiles(new Point(3, 2), 4, 2);

			Assert.assertEquals(surroundingTiles.join(), "e,f,g,h,i,j,k,l");
		}

        [Test]
        public function testCalculateRangeFarLeft() : void
		{
			tiles = [["a","b","c","d"]];
			var obj : Object = calculateRange(0,3, mapWidth);

            Assert.assertEquals(getTilesInRow(0, obj.start, obj.end), "a,b,c");
		}

        [Test]
        public function testCalculateRangeFarRight() : void
		{
			tiles = [["a","b","c","d"]];
			var obj : Object = calculateRange(3,3, mapWidth);

            Assert.assertEquals(getTilesInRow(0, obj.start, obj.end), "b,c,d");
		}

        [Test]
        public function testCalculateFullRangeFarRight() : void
		{
			tiles = [["a","b","c","d"]];
			var obj : Object = calculateRange(3,4, mapWidth);

            Assert.assertEquals(getTilesInRow(0, obj.start, obj.end), "a,b,c,d");
		}

        [Test]
        public function testCalculateRangeFarRightLargerSet() : void
		{
			tiles = [["a","b","c","d","e","f","g","h"]];
			var obj : Object = calculateRange(7,4, mapWidth);

            Assert.assertEquals(getTilesInRow(0, obj.start, obj.end), "e,f,g,h");
		}

        [Test]
        public function testCalculateRangeCenter()
        {
            tiles = [["a","b","c","d"]];
			var obj : Object = calculateRange(1,3, mapWidth);

            Assert.assertEquals(getTilesInRow(0, obj.start, obj.end), "a,b,c");
        }

        [Test]
        public function testCalculateRangeCenterLargeSet()
        {
            tiles = [["a","b","c","d","e","f","g","h","i"]];
            var obj : Object = calculateRange(4,5, mapWidth);

            Assert.assertEquals(getTilesInRow(0, obj.start, obj.end), "c,d,e,f,g");
        }

        [Test]
        public function testCalculateRangeCenterLeft()
        {
            tiles = [["a","b","c","d","e","f","g","h","i"]];
            var obj : Object = calculateRange(1,5, mapWidth);

            Assert.assertEquals(getTilesInRow(0, obj.start, obj.end), "a,b,c,d,e");
        }

        [Test]
        public function testCalculateRangeCenterLeftLargeSet()
        {
            tiles = [["a","b","c","d","e","f","g","h","i"]];
            var obj : Object = calculateRange(1,7, mapWidth);

            Assert.assertEquals(getTilesInRow(0, obj.start, obj.end), "a,b,c,d,e,f,g");
        }

        [Test]
        public function testCalculateRangeCenterRight()
        {
            tiles = [["a","b","c","d","e","f","g","h","i"]];
            var obj : Object = calculateRange(7,5, mapWidth);

            Assert.assertEquals(getTilesInRow(0, obj.start, obj.end), "e,f,g,h,i");
        }

        [Test]
        public function testCalculateRangeCenterRightLargeSet()
        {
            tiles = [["a","b","c","d","e","f","g","h","i"]];
            var obj : Object = calculateRange(7,7, mapWidth);

            Assert.assertEquals(getTilesInRow(0, obj.start, obj.end), "c,d,e,f,g,h,i");
        }

        [Test]
        public function testCalculateFullRangeLargeSet()
        {
            tiles = [
            ["01","02","03","04","05","06","07","08","09"],
            ["10","11","12","13","14","15","16","17","18"],
            ["19","20","21","22","23","24","25","26","27"],
            ["28","29","30","31","32","33","34","35","36"],
            ["37","38","39","40","42","42","43","44","45"],
            ["46","47","48","49","50","51","52","53","54"],
            ["55","56","57","58","59","60","61","62","63"],
            ["64","65","66","67","68","69","70","71","72"],
            ["73","74","75","76","77","78","79","80","91"]
            ];

            var obj : Object = calculateRange(8,9, 9);

            Assert.assertEquals(getSurroundingTiles(new Point(8,8), 9, 9), tiles.toString());
        }
		[Test]
		public function testGetTilesInRowInBounds() : void
		{
			tiles = [["a","b","c","d"]];
			var selection : Array = getTilesInRow(0, 1, 3);

			Assert.assertEquals(selection.join(), "b,c,d");
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

			Assert.assertEquals(mapWidth, 4);
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

			Assert.assertEquals(mapHeight, 6);
		}
	}
}
