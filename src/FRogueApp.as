package  
{
    import com.gamecook.frogue.helpers.MovementHelper;
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
    [SWF(width="800",height="480",backgroundColor="#000000",frameRate="60")]
	public class FRogueApp extends Sprite implements IControl
	{

        public var map:RandomMap;
        private var renderer:MapRenderer;
        private var renderWidth:int = 800/20;
        private var renderHeight:int = 480/20;
        private var controls:Controls;

        private var populateMapHelper:PopulateMapHelper;
        private var movementHelper:MovementHelper;

        /**
		 * 
		 */
        public function FRogueApp()
		{
			
			configureStage();

            var tmpSize:int = 70;

            var t:Number = getTimer();
            map = new RandomMap();
            TimeMethodExecutionUtil.execute("generateMap",map.generateMap, tmpSize);

            populateMapHelper = new PopulateMapHelper(map);
            populateMapHelper.populateMap("x","x","x","x","x","x","x","x","x","x","x","x","x","x","x","x","x","x","x","x","x","x","x","x","x","x","x","x","x","x","x","x");

            movementHelper = new MovementHelper(map, populateMapHelper.getRandomEmptyPoint());
            renderer = new MapRenderer(this.graphics);

            controls = new Controls(this);

            addEventListener(Event.ENTER_FRAME, onEnterFrame);


		}

        private function onEnterFrame(event:Event):void
        {
            render();
        }

		private function configureStage() : void 
		{
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
		}

        public function up():void
        {
            movementHelper.up();
        }

        public function down():void
        {
            movementHelper.down();
        }

        public function right():void
        {
            movementHelper.right();
        }

        public function left():void
        {
            movementHelper.left();
        }

        public function render():void
        {
            //TODO there is a bug in renderer that doesn't let you see the last row
            var tiles =TimeMethodExecutionUtil.execute("getSurroundingTiles", map.getSurroundingTiles, movementHelper.playerPosition, renderWidth, renderHeight);

            TimeMethodExecutionUtil.execute("renderMap", renderer.renderMap,tiles);

        }

    }
}
