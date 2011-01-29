package com.gamecook.frogue.enum
{

	/**
	 * @author jessefreeman
	 */
	public class TilesEnum 
	{

		private static const TYPES : Object = new Object();
		{
		TYPES[' '] = { name: 'floor', _img: '', impassable:false },
		TYPES['#'] = { name: 'wall', impassable: true, _img: '' },
		TYPES['|'] = {name: 'closed_door', impassable: true, _img: ''},
		TYPES['='] = { name: 'open_door', _img: '', impassable:false},
		TYPES['+'] = { name: 'destroyed-door', _img: '', impassable:false},
		TYPES['\\'] = {name: 'stairs_down', _img: '', impassable:false},
		TYPES['/'] = { name: 'stairs_up', _img: '', impassable:false},
		TYPES['S'] = { name: 'secret_door', impassable: true, _img: ''};
		TYPES['x'] = { name: 'item_placeholder', impassable: false, _img: ''};
		}

		/**
		 * <p>Looks up the property type and confirms that it exists.</p>
		 *
		 * @param property
		 */ 
		public static function isSupported(tileType : String) : Boolean 
		{
			trace("Test Tile", tileType);
            return (TYPES.hasOwnProperty(tileType));
		}

		/**
		 * <p>Looks up if a tile is impassable.
		 */
		public static function isImpassable(tileType : String) : Boolean
		{
			return tileType == null ? false : TYPES[tileType].impassable;
		}

        public static function registerTileType(name : String, description : String, impassable : Boolean) : void
		{
			TYPES[name] = {name:description, impassable: impassable};
		}

		public static function removeTileType(name : String) : void
		{
			delete TYPES[name];
		}

	}
}
