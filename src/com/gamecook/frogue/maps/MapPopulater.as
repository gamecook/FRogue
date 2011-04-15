/**
 * Created by IntelliJ IDEA.
 * User: Jesse Freeman
 * Date: 1/28/11
 * Time: 5:39 PM
 * To change this template use File | Settings | File Templates.
 */
package com.gamecook.frogue.maps
{
    import com.gamecook.frogue.maps.IMap;

    import flash.geom.Point;

    public class MapPopulater
    {
        private var map:IMap;
        private var openSpaces:Array = [];

        public function getOpenSpaces():int
        {
            return openSpaces.length;
        }

        public function MapPopulater(map:IMap)
        {
            this.map = map;
            openSpaces = map.getOpenTiles();
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
            if(point)
                placeTile(point, key);
        }

        private function placeTile(point:Point, key:String):void
        {
            map.swapTile(point, key);

        }

        public function getRandomEmptyPoint():Point
        {
            return openSpaces[Math.floor((Math.random() * openSpaces.length))];
        }

    }
}
