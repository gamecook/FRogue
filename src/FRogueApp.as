package  
{
	import com.flashartofwar.frogue.maps.RandomMap;

    import com.flashartofwar.frogue.renderer.MapRenderer;

    import flash.display.StageScaleMode;
	import flash.display.StageAlign;
	import flash.display.Sprite;
    import flash.geom.Point;

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
	public class FRogueApp extends Sprite 
	{

		/**
		 * 
		 */

		public function FRogueApp() 
		{
			
			configureStage();
			trace("Hello World");
			
			var map : RandomMap = new RandomMap(20);
			trace(map);

            var renderer:MapRenderer = new MapRenderer(this.graphics);

            renderer.renderMap(map.getSurroundingTiles(new Point(8,8), map.mapWidth, map.mapHeight));
		}

		private function configureStage() : void 
		{
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
		}
	}
}
