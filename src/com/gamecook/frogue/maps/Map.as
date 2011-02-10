package com.gamecook.frogue.maps
{
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
	public class Map implements IMap
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
		public function Map()
		{
            //TODO need to pass in width/height into constructor
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

        public function getTileID(row:int, column:int):int
        {
            return row * width + column;
        }
    }
}
