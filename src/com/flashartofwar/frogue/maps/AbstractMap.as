package com.flashartofwar.frogue.maps
{
	import com.flashartofwar.frogue.enum.TilesEnum;
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
	public class AbstractMap implements IMap
	{
		protected var _tiles : Array = [];
		protected var autoAddTiles : Boolean = true;
		protected var dirs : Array;
		protected var height : Number;

		protected var mapsize : Number;
		protected var paths : Array;
		protected var _rooms : Array;
		protected var width : Number;

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

			for (i = 0;i < verticalRange;i ++)
			{
				range.push(getTilesInRow(center.y + i, center.x, horizontalRange));
			}

            if(verticalRange == 1)
            {
                if(horizontalRange == 1)
                    range[0] = "@";
                else
                    range[center.x] = "@";
            }
            else
                range[center.x][center.y] = "@";

			return range;
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

			var offset : Number = 0;
			if (start < 0)
			{
				offset = start * - 1;
				start = 0;
			}

			var row : Array = _tiles[i] as Array;

			var total : int = row.length;

			var length : Number = end + start + offset;

			var tiles : Array = row.slice(start, end + start + offset);

			var leftOver : Number = length > total ? length - tiles.length : 0;

			if (autoAddTiles && (leftOver > 0))
			{
				for (i = 0;i < leftOver;i ++)
				{
					tiles.push("X");
				}
			}
			return tiles;
		}

        public function get rooms():Array
        {
            return _rooms;
        }

        public function get mapWidth():Number
        {
            return tiles[0].length;
        }

        public function get mapHeight():Number
        {
            return tiles.length;
        }
    }
}
