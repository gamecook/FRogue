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
        private var visibleSelection:IMapSelection;
        private var saveExploredTiles:Boolean = true;
        private var _revealAll:Boolean;

        public function FogOfWarMapSelection(map:IMap, selection:IMapSelection, width:int, height:int)
        {
            this.height = height;
            this.width = width;
            this.selection = selection;
            this.map = map;
            visibleSelection = new MapSelection(map, width, height);

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
            visibleSelection.setCenter(value);

            var i:int;
            var j:int;
            var visibleTiles:Array = visibleSelection.getTiles();
            var rows:int = visibleTiles.length;
            var columns:int = visibleTiles[0].length;
            var uID:int;
            var lightTiles:Array = [];
            for(i = 0; i < rows; i++)
            {
                for(j = 0; j < columns; j++)
                {
                    uID = visibleSelection.getTileID(j,i);
                    exploredTiles[uID] = " ";
                    lightTiles.push(uID);

                }

            }

            cleanUpLight(visibleSelection, lightTiles);


            selection.setCenter(value);
            visibleTiles = selection.getTiles();
            rows = visibleTiles.length;
            columns = visibleTiles[0].length;
            var tile:String;

            for(i = 0; i < rows; i++)
            {
                for(j = 0; j < columns; j++)
                {
                    uID = selection.getTileID(j,i);
                    tile = visibleTiles[i][j];

                    if(_revealAll || exploredTiles[uID])
                    {
                        if(lightTiles.indexOf(uID) == -1 && tile != "#") visibleTiles[i][j] = "?";
                    }
                    else
                    {
                        visibleTiles[i][j] = "*";
                    }
                }

            }

            if(!saveExploredTiles)
                exploredTiles.length = 0;
        }

        private function cleanUpLight(visibleSelection:IMapSelection, lightTiles:Array):void
        {
            trace("Player Center", visibleSelection.getCenter().x - visibleSelection.getOffsetX(), visibleSelection.getCenter().y - visibleSelection.getOffsetY());

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
    }
}
