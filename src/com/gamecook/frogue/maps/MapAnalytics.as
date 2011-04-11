/**
 * Created by IntelliJ IDEA.
 * User: jessefreeman
 * Date: 3/19/11
 * Time: 11:52 AM
 * To change this template use File | Settings | File Templates.
 */
package com.gamecook.frogue.maps {

    import flash.geom.Point;

    public class MapAnalytics {

        private var map:IMap;
        private var tileTotals:Array = [];
        public var total:int = 0;

        public function MapAnalytics(map:IMap)
        {
            this.map = map;
        }

        public function update():void
        {
            tileTotals = analyzeTiles(indexTile);
        }

        private function analyzeTiles(onTileCallback:Function = null, matchType:String = null):Array
        {
            var tiles:Array = map.tiles;
            var row:int;
            var column:int;
            var totalRows:int = map.height;
            var totalColumns:int = map.width;
            var tile:String;
            var results:Array = [];

            for(row = 0; row < totalRows; row++)
            {
                for(column=0; column < totalColumns; column++)
                {
                    tile = tiles[row][column];

                    if(analyzeTiles != null)
                        onTileCallback(results, tile, row, column, matchType);

                }
            }

            return results;
        }

        private function indexTile(results:Array, tile:String, row:int, column:int, type:String = null):void
        {

            if(!results[tile])
            {
                results[tile] = 0;
            }

            results[tile] ++;
        }

        public function getTotal(forceUpdate:Boolean, ...tileTypes):int
        {
            if(forceUpdate)
                update();

            var i:int;
            var total:int = tileTypes.length;
            var counter:int = 0;
            var tileType:String;

            for (i =0; i < total; i++)
            {
                tileType = tileTypes[i];
                if(tileTotals[tileType])
                    counter += tileTotals[tileType];
            }

            return counter;
        }

        public function getTilePoints(...tileTypes):Array
        {
            var tiles:Array = map.tiles;
            var row:int;
            var column:int;
            var totalRows:int = map.height;
            var totalColumns:int = map.width;
            var tile:String;
            var points:Array = [];
            var i:int;
            var tileTypeTotal:int = tileTypes.length;
            var currentTileType:String;

            for(row = 0; row < totalRows; row++)
            {
                for(column=0; column < totalColumns; column++)
                {
                    tile = tiles[row][column];

                    for (i = 0; i < tileTypeTotal; i++)
                    {
                        currentTileType = tileTypes[i];
                        if(tile == currentTileType)
                        {
                            points.push(new Point(column, row));
                        }
                    }

                }
            }

            return points;

        }

    }
}
