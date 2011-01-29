package  
{
    import com.gamecook.frogue.helpers.PopulateMapHelper;
    import com.gamecook.frogue.io.Controls;
    import com.gamecook.frogue.io.IControl;
    import com.gamecook.frogue.maps.RandomMap;

    import com.gamecook.frogue.renderer.MapRenderer;

    import com.gamecook.util.TimeMethodExecutionUtil;

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
        private var renderWidth:int = 800/20;
        private var renderHeight:int = 480/20;
        private var controls:Controls;
        private var invalidate:Boolean = true;
        private var oldTileValue:String;
        private var populateMapHelper:PopulateMapHelper;

        /**
		 * 
		 */
        public function FRogueApp()
		{
			
			configureStage();
			trace("Hello World");

            var tmpSize:int = 40;

            var t:Number = getTimer();
            map = new RandomMap();
            TimeMethodExecutionUtil.execute("generateMap",map.generateMap, tmpSize);

            populateMapHelper = new PopulateMapHelper(map);
            populateMapHelper.populateMap("x","x","x","x","x","x","x","x","x","x","x","x","x","x","x","x","x","x","x","x","x","x","x","x","x","x","x","x","x","x","x","x");

            //Setup player position
            playerPosition = populateMapHelper.getRandomEmptyPoint();
            oldTileValue = " ";
            map.swapTile(playerPosition, "@");

            renderer = new MapRenderer(this.graphics);

            controls = new Controls(this);

            addEventListener(Event.ENTER_FRAME, onEnterFrame);
            move(playerPosition.x,playerPosition.y);

            //TODO there is a bug in renderer that doesn't let you see the last row
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

            if(!map.canEnter(tmpPosition))
            {;
                map.swapTile(playerPosition, oldTileValue);
                playerPosition.x = tmpPosition.x;
                playerPosition.y = tmpPosition.y;
                oldTileValue = map.swapTile(playerPosition, "@");

                render(playerPosition);
                invalidate = true;
            }
        }

        public function render(position:Point):void
        {
            if(!invalidate)
                return;

            var tiles =TimeMethodExecutionUtil.execute("getSurroundingTiles", map.getSurroundingTiles,position, renderWidth, renderHeight);

            TimeMethodExecutionUtil.execute("renderMap", renderer.renderMap,tiles);

            invalidate = false;
            tiles.length = 0;
        }

    }
}
