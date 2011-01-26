package com.flashartofwar.frogue.enum 
{

	/**
	 * @author jessefreeman
	 */
	public class TilesEnum 
	{

		private static const TYPES : Object = new Object();
		{
		TYPES['_'] = { name: 'floor', _img: 'img/dg_dungeon32-0-8.gif', impassable:false },
		TYPES['#'] = { name: 'wall', impassable: true, opaque: true, _img: 'img/dg_dungeon32-0-4.gif' },
		TYPES['|'] = {name: 'closed_door', impassable: true, opaque: true, _img: 'img/dg_dungeon32-6-1.gif'}, 
		TYPES['='] = { name: 'open_door', _img: 'img/dg_dungeon32-7-1.gif', impassable:false}, 
		TYPES['+'] = { name: 'destroyed-door', _img: 'img/dg_dungeon32-8-1.gif', impassable:false}, 
		TYPES['\\'] = {name: 'stairs_down', opaque: true, _img: 'img/dg_dungeon32-1-7.gif', impassable:false},
		TYPES['/'] = { name: 'stairs_up', opaque: true, _img: 'img/dg_dungeon32-0-7.gif', impassable:false},
		TYPES['S'] = { name: 'secret_door', impassable: true, opaque: true, _img: 'img/dg_dungeon32-0-4.gif'};
		}

		/**
		 * <p>Looks up the property type and confirms that it exists.</p>
		 *
		 * @param property
		 */ 
		public static function isSupported(tileType : String) : Boolean 
		{
			return (TYPES.hasOwnProperty(tileType));
		}

		/**
		 * <p>Looks up if a tile is impassable.
		 */
		public static function isImpassable(tileType : String) : Boolean
		{
			return TYPES[tileType].impassable;
		}

		public static function registerTileType(name : String, description : String, impassable : Boolean) : void
		{
			TYPES[name] = {name:description, impassable: impassable};
		}

		public static function removeColor(name : String) : void
		{
			delete TYPES[name];
		}
	}
}
