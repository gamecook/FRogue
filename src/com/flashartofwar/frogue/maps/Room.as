package com.flashartofwar.frogue.maps 
{
	import flash.utils.Dictionary;

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
	public class Room 
	{

		public var x1 : Number;
		public var y1 : Number;
		public var x2 : Number;
		public var y2 : Number;
		public var connectedRooms : Object;

		/**
		 * 
		 * @return 
		 */
		public function get width() : Number 
		{ 
			return this.x2 - this.x1;
		};

		/**
		 * 
		 * @return 
		 */
		public function get height() : Number 
		{ 
			return this.y2 - this.y1;
		};

		/**
		 * 
		 * @return 
		 */
		public function get top() : Number 
		{ 
			return this.y1; 
		};

		/**
		 * 
		 * @return 
		 */
		public function get left() : Number 
		{ 
			return this.x1;
		};

		/**
		 * 
		 * @param x1
		 * @param y1
		 * @param x2
		 * @param y2
		 */
		public function Room(x1 : Number, y1 : Number, x2 : Number, y2 : Number) 
		{
			if (x1 > x2) 
			{ 
				var x : Number = x1; 
				x1 = x2; 
				x2 = x; 
			}
			if (y1 > y2) 
			{ 
				var y : Number = y1; 
				y1 = y2; 
				y2 = y; 
			}
			this.x1 = x1; 
			this.y1 = y1;
			this.x2 = x2; 
			this.y2 = y2;
			this.connectedRooms = new Object();
		}

		//
		/**
		 * 
		 * @return 
		 */
		public function toString() : String 
		{
			return '[room ' + this.x1 + ', ' + this.y1 + ', ' + this.x2 + ', ' + this.y2 + ']';
		}

		//
		/**
		 * 
		 * @param room
		 * @return 
		 */
		public function intersects(room : Room) : Boolean 
		{
			return this.x1 <= room.x2 && this.x2 >= room.x1 && this.y1 <= room.y2 && this.y2 >= room.y1;
		}

		//
		/**
		 * 
		 * @param x
		 * @param y
		 * @return 
		 */
		public function contains(x : Number, y : Number) : Boolean 
		{
			return x >= this.x1 && x <= this.x2 && y >= this.y1 && y <= this.y2;
		}

		//
		
		//

		//
		/**
		 * 
		 * @param otherroom
		 * @param seenlist
		 * @return 
		 */
		public function connected(otherroom : Room, seenlist : Dictionary = null) : Boolean 
		{
			if (this.connectedRooms[otherroom]) return true;
			if (! seenlist) 
			{ 
				seenlist = new Dictionary(true);
				seenlist[this] = true;
			}
			if (seenlist[otherroom]) return false;
			seenlist[otherroom] = true;
			for(var i:Object in otherroom.connectedRooms) 
			{
				if (this.connected(otherroom.connectedRooms[i], seenlist)) return true;
			}
			return false;
		}

		//
		/**
		 * 
		 * @return 
		 */
		public function edges() : Array 
		{
			var e : Array = [];
			for (var x : Number = this.x1;x <= this.x2;x ++) 
			{
				e.push({x: x, y: this.y1, dir: 3});
				e.push({x: x, y: this.y2, dir: 1});
			}
			for (var y : Number = this.y1;y <= this.y2;y ++) 
			{
				e.push({x: this.x1, y: y, dir: 0});
				e.push({x: this.x2, y: y, dir: 2});
			}
			return e;
		}
	}
}
