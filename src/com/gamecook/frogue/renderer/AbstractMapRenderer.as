/**
 * Created by IntelliJ IDEA.
 * User: Jesse Freeman
 * Date: 2/1/11
 * Time: 8:57 PM
 * To change this template use File | Settings | File Templates.
 */
package com.gamecook.frogue.renderer
{
    import com.gamecook.frogue.maps.IMapSelection;

    public class AbstractMapRenderer
    {
        public function AbstractMapRenderer()
        {
        }

        public function renderMap(selection:IMapSelection):void
        {
            var tiles:Array = selection.getTiles();
            var row:int;
            var column:int;
            var total:int = tiles.length;
            var rowWidth:int = tiles[0].length;
            var currentTile:String;
            var tileID:int = 0;

            clearMap();

            for(row = 0; row < total; row++)
            {
                for(column = 0; column < rowWidth; column ++)
                {
                    currentTile = tiles[row][column];
                    renderTile(column, row, currentTile, selection.getTileID(column, row));
                }
            }


        }

        protected function renderTile(j:int, i:int, currentTile:String, tileID:int):void
        {

        }

        protected function clearMap():void
        {
        }


        public function renderPlayer(j:int, i:int):void
        {
            renderTile(j,i,"@", 0);
        }
    }
}
