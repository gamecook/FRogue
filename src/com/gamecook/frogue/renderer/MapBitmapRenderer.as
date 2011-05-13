/**
 * Created by IntelliJ IDEA.
 * User: Jesse Freeman
 * Date: 1/24/11
 * Time: 9:15 PM
 * To change this template use File | Settings | File Templates.
 */
package com.gamecook.frogue.renderer
{
    import com.gamecook.frogue.sprites.SpriteSheet;

    import flash.display.BitmapData;
    import flash.geom.Point;
    import flash.geom.Rectangle;

    public class MapBitmapRenderer extends AbstractMapRenderer
    {
        protected var target:BitmapData;
        protected var spriteSheet:SpriteSheet;

        public function MapBitmapRenderer(target:BitmapData, spriteSheet:SpriteSheet)
        {
            this.spriteSheet = spriteSheet;
            this.target = target;
        }

        override protected function renderTile(j:int, i:int, currentTile:String, tileID:int):void
        {
            if (currentTile == "@")
                trace("Player Tile", j, "x", i);
            var bitmapData:BitmapData = tileBitmap(currentTile);
            var tileRect:Rectangle = new Rectangle(0, 0, bitmapData.width, bitmapData.height);
            var point:Point = new Point(j * tileRect.width, i * tileRect.height);

            target.copyPixels(bitmapData, tileRect, point);

        }

        override protected function clearMap():void
        {
            target.fillRect(new Rectangle(0, 0, target.width, target.height), 0);
        }

        protected function tileBitmap(value:String):BitmapData
        {
            return spriteSheet.getSprite(value);
        }

    }
}
