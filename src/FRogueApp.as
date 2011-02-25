package  
{
    import com.gamecook.frogue.helpers.MovementHelper;
    import com.gamecook.frogue.helpers.PopulateMapHelper;
    import com.gamecook.frogue.io.Controls;
    import com.gamecook.frogue.io.IControl;
    import com.gamecook.frogue.maps.FogOfWarMapSelection;
    import com.gamecook.frogue.maps.MapSelection;
    import com.gamecook.frogue.maps.RandomMap;

    import com.gamecook.frogue.renderer.MapDrawingRenderer;

    import flash.display.StageScaleMode;
	import flash.display.StageAlign;
	import flash.display.Sprite;
    import flash.events.Event;
    import flash.geom.Point;
    import flash.geom.Rectangle;
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
        private var renderer:MapDrawingRenderer;
        private var renderWidth:int = 800/20;
        private var renderHeight:int = 480/20;
        private var controls:Controls;

        private var populateMapHelper:PopulateMapHelper;
        private var movementHelper:MovementHelper;
        private var invalid:Boolean = true;
        private var mapSelection:MapSelection;
        private var fogOfWarSelection:FogOfWarMapSelection;

        /**
		 * 
		 */
        public function FRogueApp()
		{
			
			configureStage();

            var tmpSize:int = 70;

            var t:Number = getTimer();
            map = new RandomMap();
            map.generateMap(tmpSize);
            mapSelection = new MapSelection(map, renderWidth, renderHeight);
            fogOfWarSelection = new FogOfWarMapSelection(map, mapSelection, 4, 4);

            populateMapHelper = new PopulateMapHelper(map);
            populateMapHelper.populateMap("x","x","x","x","x","x","x","x","x","x","x","x","x","x","x","x","x","x","x","x","x","x","x","x","x","x","x","x","x","x","x","x");

            movementHelper = new MovementHelper(map);
            movementHelper.startPosition(populateMapHelper.getRandomEmptyPoint());

            fogOfWarSelection.setCenter(movementHelper.playerPosition);

            renderer = new MapDrawingRenderer(this.graphics, new Rectangle(0, 0, 20, 20));

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
            move(MovementHelper.UP);
        }

        public function down():void
        {
            move(MovementHelper.DOWN);
        }

        public function right():void
        {
            move(MovementHelper.RIGHT);
        }

        public function left():void
        {
            move(MovementHelper.LEFT);
        }

        public function render():void
        {
            if(invalid)
            {
                renderer.renderMap(fogOfWarSelection);
                invalid = false;
            }
        }

        public function move(value:Point):void
        {

            var tmpPoint:Point = movementHelper.previewMove(value.x, value.y);

            if(tmpPoint != null)
            {
                var tile:String = map.getTileType(tmpPoint);
                switch(tile)
                {
                    case " ": case "x":
                        movementHelper.move(value.x, value.y);
                        fogOfWarSelection.setCenter(movementHelper.playerPosition);
                        invalidate();
                        break;
                }
            }
        }

        protected function invalidate():void
        {
            invalid = true;
        }

    }
}
