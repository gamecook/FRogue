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

    public class MapRenderer
    {
        private var target:Graphics;

        public function MapRenderer(target:Graphics)
        {
            this.target = target;
        }

        public function renderMap(tiles:Array):void
        {
            var tileRect:Rectangle = new Rectangle(0,0,20,20);

            var i:int;
            var j:int;
            var total:int = tiles.length;
            var rowWidth:int = tiles[0].length;
            var currentTile:String;
            target.clear();
            target.lineStyle(1,0x000000);

            for(i = 0; i < total; i++)
            {
                for(j = 0; j < rowWidth; j ++)
                {
                    currentTile = tiles[i][j];
                    tileRect.x = j * tileRect.width;
                    tileRect.y = i * tileRect.height;
                    target.beginFill(tileColorMap(currentTile));
                    target.drawRect(tileRect.x, tileRect.y, tileRect.width, tileRect.height);
                }
            }

            target.endFill();
        }

        protected function tileColorMap(value:String):uint
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
