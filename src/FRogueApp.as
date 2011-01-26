package  
{
    import com.flashartofwar.frogue.io.Controls;
    import com.flashartofwar.frogue.io.IControl;
    import com.flashartofwar.frogue.maps.RandomMap;

    import com.flashartofwar.frogue.renderer.MapRenderer;

    import flash.display.StageScaleMode;
	import flash.display.StageAlign;
	import flash.display.Sprite;
    import flash.events.Event;
    import flash.geom.Point;
    import flash.utils.getTimer;

    /**
	 * The MIT License
	 *
	 * Copyright (c) 2009 @author jessefreeman
	 * 
	 * Permission is hereby granted, free of charge, to any person obtaining a copy
	 * of this software and associated documentation files (the "Software"), to deal
	 * in the Software without restriction, including without limitation the rights
	 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
	 * copies of the Software, and to permit persons to whom the Software is
	 * furnished to do so, subject to the following conditions:
	 * 
	 * The above copyright notice and this permission notice shall be included in
	 * all copies or substantial portions of the Software.
	 * 
	 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
	 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
	 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
	 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
	 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
	 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
	 * THE SOFTWARE.
	 * 
	 */
	public class FRogueApp extends Sprite implements IControl
	{

        public var playerPosition:Point;
		public var map:RandomMap;
        private var renderer:MapRenderer;
        private var renderWidth:int = 20;
        private var renderHeight:int = 20;
        private var controls:Controls;
        private var invalidate:Boolean = true;
        private var oldTileValue:String;
        /**
		 * 
		 */
        public function FRogueApp()
		{
			
			configureStage();
			trace("Hello World");

            var tmpSize:int = 40;

            var t:Number = getTimer();
            map = new RandomMap(tmpSize);
            trace("New Map ",map.width,"x",map.height);
            t = (getTimer()-t);
            var strDebug:String;
            strDebug = "Generation time: " + t + " ms\n";
            strDebug += "tiles: " + map.width * map.height + " (" + Math.round((map.width * map.height) / t) + " tiles/ms)\n--\n";
            trace(strDebug);
            trace(map);

            playerPosition = new Point();

            renderer = new MapRenderer(this.graphics);

            controls = new Controls(this);

            addEventListener(Event.ENTER_FRAME, onEnterFrame);
            move(0,0);
		}

        private function onEnterFrame(event:Event):void
        {
            render(playerPosition);
        }

		private function configureStage() : void 
		{
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
		}

        public function up():void
        {
            move(0,-1);
        }

        public function down():void
        {
            move(0,1);
        }

        public function right():void
        {
            move(1,0);
        }

        public function left():void
        {
            move(-1,0);
        }

        private function move(x:int, y:int):void
        {
            var tmpPosition:Point = playerPosition.clone();
            tmpPosition.x += x;
            tmpPosition.y += y;

            if(tmpPosition.x < 0 || tmpPosition.x+1 > map.width)
                return;

            if(tmpPosition.y < 0 || tmpPosition.y+1 > map.height)
                return;

            /*if(map.canEnter(tmpPosition))
            {*/
                trace("Move");
                map.swapTile(playerPosition, oldTileValue);
                playerPosition.x = tmpPosition.x;
                playerPosition.y = tmpPosition.y;
                oldTileValue = map.swapTile(playerPosition, "@");

                render(playerPosition);
                invalidate = true;
            //}
        }

        public function render(position:Point):void
        {
            if(!invalidate)
                return;

            var t:Number = getTimer();
            var tiles = map.getSurroundingTiles(position, renderWidth, renderHeight);
            renderer.renderMap(tiles);
            t = (getTimer()-t);
            var strDebug:String;
            strDebug = "Render time: " + t + " ms\n";
            strDebug += "tiles: " + tiles.length * tiles[0].length + " (" + Math.round((tiles.length * tiles[0].length) / t) + " tiles/ms)\n--\n";
            trace(strDebug);

            invalidate = false;
            tiles.length = 0;
        }
    }
}
