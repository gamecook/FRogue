/*
 *
 *  Permission is hereby granted, free of charge, to any person obtaining a copy
 *  of this software and associated documentation files (the "Software"), to deal
 *  in the Software without restriction, including without limitation the rights
 *  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 *  copies of the Software, and to permit persons to whom the Software is
 *  furnished to do so, subject to the following conditions:
 *
 *  The above copyright notice and this permission notice shall be included in
 *  all copies or substantial portions of the Software.
 *
 *  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 *  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 *  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 *  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 *  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 *  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 *  THE SOFTWARE.
 * /
 */

/**
 * Created by IntelliJ IDEA.
 * User: jfreeman
 * Date: 2/15/11
 * Time: 9:55 AM
 * To change this template use File | Settings | File Templates.
 */
package com.gamecook.frogue.maps
{
    import com.gamecook.frogue.maps.IMap;
    import com.gamecook.frogue.maps.IMapSelection;

    import com.gamecook.frogue.maps.MapSelection;

    import flash.geom.Point;

    public class FogOfWarMapSelection implements IMapSelection
    {
        private var map:IMap;
        private var selection:IMapSelection;
        private var width:int;
        private var height:int;
        private var exploredTiles:Array = [];
        //private var visibleSelection:IMapSelection;
        private var saveExploredTiles:Boolean = true;
        private var _revealAll:Boolean;
        private var mapEdgePoints:Array;
        private var lightTiles:Array = [];
        private var visiblePoints:Array = [];
        public function FogOfWarMapSelection(map:IMap, selection:IMapSelection, width:int, height:int)
        {
            this.height = height;
            this.width = width;
            this.selection = selection;
            this.map = map;
        }

        public function getTileID(column:int, row:int):int
        {
            return selection.getTileID(column, row);
        }

        public function getTiles():Array
        {
            return selection.getTiles();
        }

        public function getOffsetX():int
        {
            return selection.getOffsetX();
        }

        public function getOffsetY():int
        {
            return selection.getOffsetY();
        }

        public function setCenter(value:Point):void
        {

            // Map map selection on player position
            selection.setCenter(value);

            var tiles:Array = selection.getTiles();

            // Need to adjust the center point coming in
            var newPoint:Point = value.clone();
            newPoint.x -= selection.getOffsetX();
            newPoint.y -= selection.getOffsetY();

            calculateLight(tiles,new Point(newPoint.y, newPoint.x));

            applyLight(tiles, visiblePoints);

            if(!saveExploredTiles)
                exploredTiles.length = 0;
        }

        private function applyLight(tiles:Array, visiblePoints:Array):void
        {
            var width:int = tiles[0].length;
            var height:int = tiles.length;

            var rows:int;
            var columns:int;

            for(rows = 0; rows< height; rows++)
            {
                for(columns = 0; columns < width; columns ++)
                {
                    var uID:int = getTileID(rows,  columns);
                    if(visiblePoints.indexOf(uID) == -1)
                        tiles[rows][columns] = "?";
                }

            }

            visiblePoints.length = 0;
        }

        private function calculateLight(tiles:Array, center:Point):void
        {

            var totalRows:int = tiles.length ;
            var totalColumns:int = tiles[0].length;
            var i:int;

            // Get top
            for (i = 0; i < totalColumns; i++)
            {
                raytrace(center.x, center.y,0,i, tiles);
                raytrace(center.x, center.y,totalRows - 1,i, tiles);
            }

            for (i = 0; i < totalRows; i++)
            {
                raytrace(center.x, center.y, i, 0, tiles);
                raytrace(center.x, center.y, i, totalColumns - 1, tiles);
            }
        }


        private function raytrace(x0:int, y0:int, x1:int, y1:int, tiles:Array):void
        {

            var dx:int = Math.abs(x1 - x0);
            var dy:int = Math.abs(y1 - y0);
            var x:int = x0;
            var y:int = y0;
            var n:int = 1 + dx + dy;
            var x_inc:int = (x1 > x0) ? 1 : -1;
            var y_inc:int = (y1 > y0) ? 1 : -1;
            var error:int = dx - dy;
            dx *= 2;
            dy *= 2;

            for (; n > 0; --n)
            {
                var isWall:Boolean = visit(x, y, tiles);
                if (isWall)
                    n = 0;

                if (error > 0)
                {
                    x += x_inc;
                    error -= dy;
                }
                else
                {
                    y += y_inc;
                    error += dx;
                }
            }

        }

        private function visit(x:int, y:int, tiles:Array):Boolean
        {
            if(x >= tiles.length)
                x = tiles.length-1;

            var tile:String = tiles[x][y];

            var uID:int = selection.getTileID(x,y);

            if(visiblePoints.indexOf(uID) == -1)
                visiblePoints.push(uID);

            return tile == "#" ? true : false;
        }

        public function clear():void
        {
            exploredTiles.length = 0;
        }

        public function getCenter():Point
        {
            return selection.getCenter();
        }

        public function revealAll(value:Boolean):void
        {
            _revealAll = value;

        }

        public function toString() : String
		{
			var stringMap : String = "";
			var total : int = getTiles().length;
			var i : int;
			// Render Map
			for (i = 0;i < total;i ++)
			{
				stringMap = stringMap + (getTiles()[i] as Array).join() + "\n";
			}

			return stringMap;
		}
    }
}
