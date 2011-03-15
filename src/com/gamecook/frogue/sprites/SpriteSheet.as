/**
 * Created by IntelliJ IDEA.
 * User: Jesse Freeman
 * Date: 2/13/11
 * Time: 5:35 PM
 * To change this template use File | Settings | File Templates.
 */
package com.gamecook.frogue.sprites
{
    import flash.display.Bitmap;
    import flash.display.BitmapData;
    import flash.geom.Matrix;
    import flash.geom.Rectangle;

    public class SpriteSheet extends Bitmap
    {
        protected var spriteRectangles:Array = [];
        public var spriteNames:Array = [];
        public var spriteCache:Array = [];
        /**
         * <p>Sheet constructor.</p>
         *
         * @param bitmapData You must have BitmapData to set up a Sheet.
         * This insures that when ever you request a Decal you get valid
         * BitmapData back.
         *
         * @param pixelSnapping
         * @param smoothing
         *
         */
        public function SpriteSheet(bitmapData:BitmapData = null, pixelSnapping:String = "auto", smoothing:Boolean = false)
        {
            super(bitmapData, pixelSnapping, smoothing);
        }

        /**
         * <p>This setter fires a "change" event to notify anything listening
         * to this instance that the BitmapData has been changed.</p>
         *
         * @param value
         *
         */
        override public function set bitmapData(value:BitmapData):void
        {
            super.bitmapData = value;
            clear();
        }

        /**
         *
         * <p>You define a Decal's coordinates by supplying a name and rectangle.</p>
         *
         * @param name The id used to look sprites up.
         * @param rectangle The x, y, width, and height of representing the Decal
         * on the Sheet's BitmapData.
         *
         */
        public function registerSprite(name:String, rectangle:Rectangle):void
        {
            spriteRectangles[name] = rectangle;
            spriteNames.push(name);
        }

        /**
         * <p>This allows you to "sample" an area of the Decal based on the
         * Rectangle you pass in. Use this to cut out a specific section of
         * Bitmapdata.</p>
         *
         * @param rect
         * @return
         *
         */
        public function getSprite(...names):BitmapData
        {

            var id:String = names.join(",");

            if(!spriteCache[id])
            {

                var width:int = spriteRectangles[names[0]].width;
                var height:int = spriteRectangles[names[0]].height;

                var bmd:Bitmap = new Bitmap(new BitmapData(width, height, true, 0x000000));

                var rect:Rectangle;

                var i:int;
                var total:int = names.length;

                for(i = 0; i < total; i++)
                {
                    rect = spriteRectangles[names[i]];
                    var m:Matrix = new Matrix();
                    m.translate(- rect.x, - rect.y);
                    bmd.bitmapData.draw(bitmapData, m, null, null, null, true);
                }

                spriteCache[id] = bmd.bitmapData.clone();
            }

            return spriteCache[id];

        }

        /**
         * <p>Clear will remove all reference to stored Decals as well as notify
         * any children Decals to detach themselves from the Sheet.</p>
         *
         */
        public function clear():void
        {
            spriteRectangles.length = 0;
            spriteNames.length = 0;
            spriteCache.length = 0;
        }

        public function hasSprite(value:String):Boolean
        {
            return spriteNames.indexOf(value) != -1;
        }
    }
}
