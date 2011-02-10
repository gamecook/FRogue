/**
 * Created by IntelliJ IDEA.
 * User: Jesse Freeman
 * Date: 1/24/11
 * Time: 9:15 PM
 * To change this template use File | Settings | File Templates.
 */
package com.gamecook.frogue.renderer
{
    import flash.display.DisplayObject;
    import flash.display.DisplayObjectContainer;
    import flash.display.Graphics;
    import flash.display.Shape;
    import flash.geom.Rectangle;
    import flash.text.TextField;

    public class MapDrawingRenderer extends AbstractMapRenderer
    {
        private var target:Graphics;
        private var tileRect:Rectangle;

        public function MapDrawingRenderer(target:Graphics, tileSize:Rectangle)
        {
            this.target = target;
            tileRect = tileSize;
        }

        override protected function renderTile(j:int, i:int, currentTile:String, tileID:int):void
        {
            super.renderTile(j, i, currentTile, tileID);
            if(currentTile == "@")
                trace("tileID", tileID);
            tileRect.x = j * tileRect.width;
            tileRect.y = i * tileRect.height;

            target.lineStyle(1, 0x000000);
            target.beginFill(tileColor(currentTile));
            target.drawRect(tileRect.x, tileRect.y, tileRect.width, tileRect.height);
            target.endFill();
        }

        override protected function clearMap():void
        {
            target.clear();
        }

        protected function tileColor(value:String):uint
        {
            switch(value)
            {
                case " ":
                    return 0xffffff;
                break;
                case "@":
                    return 0xff0000;
                case "x":
                    return 0x00ff00;
                default:
                    return 0x333333;
            }
        }
    }
}