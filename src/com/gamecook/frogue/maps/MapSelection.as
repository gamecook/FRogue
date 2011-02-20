/**
 * Created by IntelliJ IDEA.
 * User: Jesse Freeman
 * Date: 2/10/11
 * Time: 7:59 AM
 * To change this template use File | Settings | File Templates.
 */
package com.gamecook.frogue.maps
{

    import flash.geom.Point;

    public class MapSelection implements IMapSelection
    {
        protected var map:IMap;
        protected var tiles:Array = [];
        protected var offsetX:int = 0;
        protected var offsetY:int = 0;
        protected var centerPoint:Point;
        protected var width:int = 0;
        protected var height:int = 0;

        public function MapSelection(map:IMap, width:int, height:int)
        {
            this.height = height;
            this.width = width;
            this.map = map;
        }

        /**
         *
         * @param center
         * @param horizontalRange
         * @param verticalRange
         * @return
         */
        protected function getSurroundingTiles(center:Point, horizontalRange:Number, verticalRange:Number):Array
        {
            //TODO need to test different vertical and horizontal ranges, on horizontal is being used.

            tiles.length = 0;
            var i:int;

            var hRangeObj:Object = calculateRange(center.x, horizontalRange, map.width);
            var vRangeObj:Object = calculateRange(center.y, verticalRange + 1, map.height);
            //TODO look into why this is off by one
            vRangeObj.end +=1;

            offsetX = hRangeObj.start;
            offsetY = vRangeObj.start;

            for (i = vRangeObj.start; i < vRangeObj.end; i ++)
            {
                tiles.push(getTilesInRow(i, hRangeObj.start, hRangeObj.end));
            }

            return tiles;
        }

        protected function calculateRange(center:int, range:int, length:int):Object
        {
            var obj:Object = {};

            range --;

            if(center == 0)
            {
                // At far right
                obj.start = center;
                obj.end = range;
            }
            else if(center == length-1)
            {
                // At far right
                obj.start = center - range;
                obj.end = center;
            }
            else
            {
                // Center
                var split:int = Math.floor(range * .5);
                var paddingLeft:int = split;
                var paddingRight:int = range - split;
                var mapCenter:int = Math.floor(length * .5);

                if(center < mapCenter)
                {
                    var leftOutOfBounds:int = center - paddingLeft;
                    if(leftOutOfBounds < 0)
                    {
                        paddingRight -= leftOutOfBounds;
                        paddingLeft += leftOutOfBounds;
                    }
                }
                else if(center > mapCenter)
                {
                    var rightOutOfBounds:int = (length-1) - (center + paddingRight);
                    if(rightOutOfBounds < 0)
                    {
                        paddingRight += rightOutOfBounds;
                        paddingLeft -= rightOutOfBounds;
                    }
                }
                obj.start = center - paddingLeft;
                obj.end = obj.start + paddingLeft + paddingRight;
            }

            // Just in case, make sure set is always in range
            if(obj.start < 0)
            {
                // If start is less then 0, shift selection back into range.
                obj.start = 0;
                obj.end ++;
            }

            // Make sure selection is never larger then the length.
            if(obj.end > length)
                obj.end = length;

            return obj;
        }


        /**
         *
         * @param i
         * @param start
         * @param end
         * @return
         */
        protected function getTilesInRow(i : int, start : Number, end : Number) : Array
        {

            var row : Array = map.tiles[i] as Array;

            var tiles : Array = row.slice(start, end+1);

            return tiles;
        }


        public function getTiles():Array
        {
            return tiles;
        }

        public function getOffsetX():int
        {
            return offsetX;
        }

        public function getOffsetY():int
        {
            return offsetY;
        }

        public function setCenter(value:Point):void
        {
            centerPoint = value.clone();
            getSurroundingTiles(centerPoint, width, height);

        }

        public function getTileID(column:int, row:int):int
        {
            return map.getTileID(row + offsetY, column + offsetX);
        }

        public function getCenter():Point
        {
            return centerPoint;
        }
    }
}
