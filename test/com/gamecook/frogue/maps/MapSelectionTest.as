/**
 * Created by IntelliJ IDEA.
 * User: jfreeman
 * Date: 2/10/11
 * Time: 3:54 PM
 * To change this template use File | Settings | File Templates.
 */
package com.gamecook.frogue.maps
{
    import flash.geom.Point;

    import flexunit.framework.Assert;

    public class MapSelectionTest extends MapSelection
    {
        public function MapSelectionTest()
        {
            super(null, 0, 0);
        }

        [Test]

        public function testZeroSurroundingTiles():void
        {
            map = new Map();
            map.tiles = [
                ["a","b","c","d"],
                ["e","f","g","h"],
                ["i","j","k","l"],
                ["m","n","o","p"],
                ["q","r","s","t"],
                ["u","v","w","x"]
            ];

            var surroundingTiles:Array = getSurroundingTiles(new Point(2, 2), 1, 1);

            Assert.assertEquals(surroundingTiles.join(), "k");
        }

        [Test]
        public function testGetShallowSetOfSurroundingTiles():void
        {
            map = new Map();
            map.tiles = [
                ["a","b","c","d"],
                ["e","f","g","h"],
                ["i","j","k","l"],
                ["m","n","o","p"],
                ["q","r","s","t"],
                ["u","v","w","x"]
            ];

            var surroundingTiles:Array = getSurroundingTiles(new Point(0, 0), 3, 3);

            Assert.assertEquals(surroundingTiles.join(), "a,b,c,e,f,g,i,j,k");
        }

        [Test]
        public function testGetLargerSetOfSurroundingTiles():void
        {
            map = new Map();
            map.tiles = [
                ["a","b","c","d"],
                ["e","f","g","h"],
                ["i","j","k","l"],
                ["m","n","o","p"],
                ["q","r","s","t"],
                ["u","v","w","x"]
            ];
            var surroundingTiles:Array = getSurroundingTiles(new Point(1, 2), 3, 5);

            Assert.assertEquals(surroundingTiles.join(), "a,b,c,e,f,g,i,j,k,m,n,o,q,r,s");
        }

        [Test]
        public function testGetUpperLeftSurroundingTiles():void
        {
            map = new Map();
            map.tiles = [
                ["a","b","c","d"],
                ["e","f","g","h"],
                ["i","j","k","l"],
                ["m","n","o","p"],
                ["q","r","s","t"],
                ["u","v","w","x"]
            ];
            var surroundingTiles:Array = getSurroundingTiles(new Point(0, 0), 3, 5);

            Assert.assertEquals(surroundingTiles.join(), "a,b,c,e,f,g,i,j,k,m,n,o,q,r,s");
        }

        [Test]
        public function testGetUpperRightSurroundingTiles():void
        {
            map = new Map();
            map.tiles = [
                ["a","b","c","d"],
                ["e","f","g","h"],
                ["i","j","k","l"],
                ["m","n","o","p"],
                ["q","r","s","t"],
                ["u","v","w","x"]
            ];
            var surroundingTiles:Array = getSurroundingTiles(new Point(3, 0), 3, 5);

            Assert.assertEquals(surroundingTiles.join(), "b,c,d,f,g,h,j,k,l,n,o,p,r,s,t");
        }

        [Test]
        public function testGetCenterSurroundingTiles():void
        {
            map = new Map();
            map.tiles = [
                ["a","b","c","d"],
                ["e","f","g","h"],
                ["i","j","k","l"],
                ["m","n","o","p"],
                ["q","r","s","t"],
                ["u","v","w","x"]
            ];
            var surroundingTiles:Array = getSurroundingTiles(new Point(1, 2), 3, 5);

            Assert.assertEquals(surroundingTiles.join(), "a,b,c,e,f,g,i,j,k,m,n,o,q,r,s");
        }

        [Test]
        public function testGetCenterRightSurroundingTiles():void
        {
            map = new Map();
            map.tiles = [
                ["a","b","c","d"],
                ["e","f","g","h"],
                ["i","j","k","l"],
                ["m","n","o","p"],
                ["q","r","s","t"],
                ["u","v","w","x"]
            ];
            var surroundingTiles:Array = getSurroundingTiles(new Point(2, 3), 3, 5);

            Assert.assertEquals(surroundingTiles.join(), "f,g,h,j,k,l,n,o,p,r,s,t,v,w,x");
        }

        [Test]
        public function testGetCenterSurroundingTilesLargeSet():void
        {
            map = new Map();
            map.tiles = [
                ["a","b","c","d"],
                ["e","f","g","h"],
                ["i","j","k","l"],
                ["m","n","o","p"],
                ["q","r","s","t"],
                ["u","v","w","x"]
            ];
            var surroundingTiles:Array = getSurroundingTiles(new Point(3, 2), 4, 5);

            Assert.assertEquals(surroundingTiles.join(), "a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t");
        }

        [Test]
        public function testGetFullMapLargeSetA():void
        {
            map = new Map();
            map.tiles = [
                ["a","b","c","d"],
                ["e","f","g","h"],
                ["i","j","k","l"],
                ["m","n","o","p"],
                ["q","r","s","t"],
                ["u","v","w","x"]
            ];
            var surroundingTiles:Array = getSurroundingTiles(new Point(3, 2), map.width, map.height);

            Assert.assertEquals(surroundingTiles.join(), "a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x");
        }

        [Test]
        public function testGetMapWithUniqueSize():void
        {
            map = new Map();
            map.tiles = [
                ["a","b","c","d"],
                ["e","f","g","h"],
                ["i","j","k","l"],
                ["m","n","o","p"],
                ["q","r","s","t"],
                ["u","v","w","x"]
            ];
            var surroundingTiles:Array = getSurroundingTiles(new Point(3, 2), 4, 3);

            Assert.assertEquals(surroundingTiles.join(), "e,f,g,h,i,j,k,l,m,n,o,p");
        }

        [Test]
        public function testGetMapWithUniqueSize2():void
        {
            map = new Map();
            map.tiles = [
                ["a","b","c","d"],
                ["e","f","g","h"],
                ["i","j","k","l"],
                ["m","n","o","p"],
                ["q","r","s","t"],
                ["u","v","w","x"]
            ];
            var surroundingTiles:Array = getSurroundingTiles(new Point(3, 2), 4, 2);

            Assert.assertEquals(surroundingTiles.join(), "e,f,g,h,i,j,k,l");
        }

        [Test]
        public function testCalculateRangeFarLeft():void
        {
            map = new Map();
            map.tiles = [
                ["a","b","c","d"]
            ];
            var obj:Object = calculateRange(0, 3, map.width);

            Assert.assertEquals(getTilesInRow(0, obj.start, obj.end), "a,b,c");
        }

        [Test]
        public function testCalculateRangeFarRight():void
        {
            map = new Map();
            map.tiles = [
                ["a","b","c","d"]
            ];
            var obj:Object = calculateRange(3, 3, map.width);

            Assert.assertEquals(getTilesInRow(0, obj.start, obj.end), "b,c,d");
        }

        [Test]
        public function testCalculateFullRangeFarRight():void
        {
            map = new Map();
            map.tiles = [
                ["a","b","c","d"]
            ];
            var obj:Object = calculateRange(3, 4, map.width);

            Assert.assertEquals(getTilesInRow(0, obj.start, obj.end), "a,b,c,d");
        }

        [Test]
        public function testCalculateRangeFarRightLargerSet():void
        {
            map = new Map();
            map.tiles = [
                ["a","b","c","d","e","f","g","h"]
            ];
            var obj:Object = calculateRange(7, 4, map.width);

            Assert.assertEquals(getTilesInRow(0, obj.start, obj.end), "e,f,g,h");
        }

        [Test]
        public function testCalculateRangeCenter():void
        {
            map = new Map();
            map.tiles = [
                ["a","b","c","d"]
            ];
            var obj:Object = calculateRange(1, 3, map.width);

            Assert.assertEquals(getTilesInRow(0, obj.start, obj.end), "a,b,c");
        }

        [Test]
        public function testCalculateRangeCenterLargeSet():void
        {
            map = new Map();
            map.tiles = [
                ["a","b","c","d","e","f","g","h","i"]
            ];
            var obj:Object = calculateRange(4, 5, map.width);

            Assert.assertEquals(getTilesInRow(0, obj.start, obj.end), "c,d,e,f,g");
        }

        [Test]
        public function testCalculateRangeCenterLeft():void
        {
            map = new Map();
            map.tiles = [
                ["a","b","c","d","e","f","g","h","i"]
            ];
            var obj:Object = calculateRange(1, 5, map.width);

            Assert.assertEquals(getTilesInRow(0, obj.start, obj.end), "a,b,c,d,e");
        }

        [Test]
        public function testCalculateRangeCenterLeftLargeSet():void
        {
            map = new Map();
            map.tiles = [
                ["a","b","c","d","e","f","g","h","i"]
            ];
            var obj:Object = calculateRange(1, 7, map.width);

            Assert.assertEquals(getTilesInRow(0, obj.start, obj.end), "a,b,c,d,e,f,g");
        }

        [Test]
        public function testCalculateRangeCenterRight():void
        {
            map = new Map();
            map.tiles = [
                ["a","b","c","d","e","f","g","h","i"]
            ];
            var obj:Object = calculateRange(7, 5, map.width);

            Assert.assertEquals(getTilesInRow(0, obj.start, obj.end), "e,f,g,h,i");
        }

        [Test]
        public function testCalculateRangeCenterRightLargeSet():void
        {
            map = new Map();
            map.tiles = [
                ["a","b","c","d","e","f","g","h","i"]
            ];
            var obj:Object = calculateRange(7, 7, map.width);

            Assert.assertEquals(getTilesInRow(0, obj.start, obj.end), "c,d,e,f,g,h,i");
        }

        [Test]
        public function testCalculateFullRangeLargeSet():void
        {
            map = new Map();
            map.tiles = [
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

            var obj:Object = calculateRange(8, 9, 9);

            Assert.assertEquals(getSurroundingTiles(new Point(8, 8), 9, 9), tiles.toString());
        }

        [Test]
        public function testGetTilesInRowInBounds():void
        {
            map = new Map();
            map.tiles = [
                ["a","b","c","d"]
            ];
            var selection:Array = getTilesInRow(0, 1, 3);

            Assert.assertEquals(selection.join(), "b,c,d");
        }

        [Test]
        public function testTileID8() : void
		{
			map = new Map();
            map.tiles = [["0","1","2","3"],
					 ["4","5","6","7"],
					 ["8","9","10","1l"],
					 ["12","13","14","15"],
					 ["16","17","18","19"],
					 ["20","21","22","23"]];
            width = 3;
            height = 3;
            setCenter(new Point(0,3));
			Assert.assertEquals(8, getTileID(0,0));
		}

        [Test]
        public function testTileID18() : void
		{
			map = new Map();
            map.tiles = [["0","1","2","3"],
					 ["4","5","6","7"],
					 ["8","9","10","1l"],
					 ["12","13","14","15"],
					 ["16","17","18","19"],
					 ["20","21","22","23"]];
            width = 3;
            height = 3;
            setCenter(new Point(0,3));
			Assert.assertEquals(18, getTileID(2,2));
		}

    }
}
