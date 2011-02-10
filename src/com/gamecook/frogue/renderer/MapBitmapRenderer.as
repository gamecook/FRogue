/**
 * Created by IntelliJ IDEA.
 * User: Jesse Freeman
 * Date: 1/24/11
 * Time: 9:15 PM
 * To change this template use File | Settings | File Templates.
 */
package com.gamecook.frogue.renderer
{
    import flash.display.BitmapData;
    import flash.geom.Rectangle;

    public class MapBitmapRenderer extends AbstractMapRenderer
    {
        private var target:BitmapData;
        private var tileRect:Rectangle;

        public function MapBitmapRenderer(target:BitmapData, tileSize:Rectangle)
        {
            this.target = target;
            tileRect = tileSize;
        }

        override protected function renderTile(j:int, i:int, currentTile:String, tileID:int):void
        {

            tileRect.x = j * tileRect.width;
            tileRect.y = i * tileRect.height;

            //TODO add in bitmap support
           /* target.lineStyle(1, 0x000000);
            target.beginFill(tileColorMap(currentTile));
            target.drawRect(tileRect.x, tileRect.y, tileRect.width, tileRect.height);
            target.endFill();*/
        }

        override protected function clearMap():void
        {
            //TODO add in bitmap clear support
            //target.clear();
        }

        protected function tileBitmap(value:String):BitmapData
        {
            //TODO add in bitmap support
            return null;
        }
    }
}
