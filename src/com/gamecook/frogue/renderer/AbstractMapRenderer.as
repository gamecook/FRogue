/**
 * Created by IntelliJ IDEA.
 * User: Jesse Freeman
 * Date: 2/1/11
 * Time: 8:57 PM
 * To change this template use File | Settings | File Templates.
 */
package com.gamecook.frogue.renderer
{
    public class AbstractMapRenderer
    {
        public function AbstractMapRenderer()
        {
        }

        public function renderMap(tiles:Array):void
        {
            var i:int;
            var j:int;
            var total:int = tiles.length;
            var rowWidth:int = tiles[0].length;
            var currentTile:String;

            clearMap();

            for(i = 0; i < total; i++)
            {
                for(j = 0; j < rowWidth; j ++)
                {
                    currentTile = tiles[i][j];
                    renderTile(j, i, currentTile);
                }
            }


        }

        protected function renderTile(j:int, i:int, currentTile:String):void
        {

        }

        protected function clearMap():void
        {
        }
    }
}
