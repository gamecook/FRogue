package com.gamecook.frogue.maps
{
	import com.gamecook.frogue.enum.TilesEnum;
	import flash.geom.Point;
    import flash.geom.Rectangle;

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
	public class AbstractMap implements IMap
	{
		protected var _tiles : Array = [];
		protected var dirs : Array;


		protected var mapsize : Number;
		protected var paths : Array;
		protected var _rooms : Array;
		protected var _width : Number;
        protected var _height : Number;

		/**
		 * 
		 * @param self
		 * @throws Error
		 */
		public function AbstractMap(self : AbstractMap)
		{
			if (! self)
				throw new Error("Can not create AbstractMap, please extend.");
		}

		/**
		 * 
		 * @param tiles
		 */
		public function addRow(tiles : Array) : void
		{
			_tiles.push(tiles);
		}

		/**
		 * 
		 * @param position
		 * @return 
		 */
		public function canEnter(position : Point) : Boolean
		{
			return TilesEnum.isImpassable(getTileType(position));
		}

		/**
		 * 
		 * @param center
		 * @param horizontalRange
		 * @param verticalRange
		 * @return 
		 */
		public function getSurroundingTiles(center : Point, horizontalRange : Number, verticalRange : Number) : Array
		{
            //TODO need to test different vertical and horizontal ranges, on horizontal is being used.

			var range : Array = [];
			var i : int;

            var hRangeObj:Object = calculateRange(center.x, horizontalRange, width);
            var vRangeObj:Object = calculateRange(center.y, verticalRange+1, height);

			for (i = vRangeObj.start;i < vRangeObj.end;i ++)
			{
                range.push(getTilesInRow(i, hRangeObj.start, hRangeObj.end));
			}

			return range;
		}

        protected function calculateRange(center:int, range:int, length:int):Object
        {
            var obj:Object = {};

            range --;

            if(center == 0)
            {
                // At far right
                obj.start = center;
                obj.end = range;
            }
            else if(center == length-1)
            {
                // At far right
                obj.start = center - range;
                obj.end = center;
            }
            else
            {
                // Center
                var split:int = Math.floor(range * .5);
                var paddingLeft:int = split;
                var paddingRight:int = range - split;
                var mapCenter:int = Math.floor(length * .5);

                if(center < mapCenter)
                {
                    var leftOutOfBounds:int = center - paddingLeft;
                    if(leftOutOfBounds < 0)
                    {
                        paddingRight -= leftOutOfBounds;
                        paddingLeft += leftOutOfBounds;
                    }
                }
                else if(center > mapCenter)
                {
                    var rightOutOfBounds:int = (length-1) - (center + paddingRight);
                    if(rightOutOfBounds < 0)
                    {
                        paddingRight += rightOutOfBounds;
                        paddingLeft -= rightOutOfBounds;
                    }
                }
                obj.start = center - paddingLeft;
                obj.end = obj.start + paddingLeft + paddingRight;
            }

            // Just in case, make sure set is always in range
            if(obj.start < 0)
            {
                // If start is less then 0, shift selection back into range.
                obj.start = 0;
                obj.end ++;
            }

            // Make sure selection is never larger then the length.
            if(obj.end > length)
                obj.end = length;

            return obj;
        }

		/**
		 * 
		 * @param position
		 * @return 
		 */
		public function getTileType(position : Point) : String
		{
			return tiles[position.y][position.x];
		}

		/**
		 * 
		 * @param id
		 */
		public function removeRow(id : int) : void
		{
			_tiles.splice(id, 1);
		}

		/**
		 * 
		 * @return 
		 */
		public function get tiles() : Array
		{
			return _tiles.slice();
		}

		/**
		 * 
		 * @param value
		 */
		public function set tiles(value : Array) : void
		{
			_tiles = value.slice();
            _width = tiles[0].length;
            _height = tiles.length;
		}

		/**
		 * 
		 * @return 
		 */
		public function toString() : String
		{
			var stringMap : String = "";
			var total : int = _tiles.length;
			var i : int;
			// Render Map
			for (i = 0;i < total;i ++)
			{
				stringMap = stringMap + (_tiles[i] as Array).join() + "\n";
			}

			return stringMap;
		}

		/**
		 * 
		 * @param i
		 * @param start
		 * @param end
		 * @return 
		 */
		protected function getTilesInRow(i : int, start : Number, end : Number) : Array
		{

			var row : Array = _tiles[i] as Array;

			var tiles : Array = row.slice(start, end+1);

			return tiles;
		}

        public function get rooms():Array
        {
            return _rooms;
        }

        public function get width():int
        {
            return _width;
        }

        public function get height():int
        {
            return _height;
        }

        //TODO need to unit test this
        public function swapTile(point:Point, value:String):String
        {
            var oldValue:String = tiles[point.y][point.x];
            tiles[point.y][point.x] = value;
            return oldValue;
        }

    }
}
