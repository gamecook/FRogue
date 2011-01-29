/**
 * Created by IntelliJ IDEA.
 * User: Jesse Freeman
 * Date: 1/28/11
 * Time: 5:39 PM
 * To change this template use File | Settings | File Templates.
 */
package com.gamecook.frogue.helpers
{
    import com.gamecook.frogue.maps.IMap;

    import flash.geom.Point;

    public class PopulateMapHelper
    {
        private var map:IMap;
        private var openSpaces:Array = [];

        public function PopulateMapHelper(map:IMap)
        {
            this.map = map;
            indexMap();
        }

        private function indexMap():void
        {
            var tiles:Array = map.tiles;
            var i:int;
            var j:int;
            var totalColumns:int = map.width;
            var totalRows:int = map.height;

            for (i = 0; i < totalRows; i++)
            {
                for(j=0; j < totalColumns; j++)
                {
                    if(tiles[i][j] == " ")
                        openSpaces.push(new Point(j,i));
                }
            }

        }

        public function populateMap(... keys):void
        {
            var key:String;
            for each(key in keys)
            {
                randomlyPlaceTile(key);
            }
        }

        private function randomlyPlaceTile(key:String):void
        {
            var point:Point = getRandomEmptyPoint();
            placeTile(point, key);
        }

        private function placeTile(point:Point, key:String):void
        {
            map.swapTile(point, key);
        }

        public function getRandomEmptyPoint():Point
        {
            openSpaces.sort(function(){return Math.round(Math.random());});
            return openSpaces.pop();
        }
    }
}
