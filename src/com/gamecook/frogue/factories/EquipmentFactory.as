/**
 * User: John Lindquist
 * Date: 3/19/11
 * Time: 4:36 PM
 */
package com.gamecook.frogue.factories
{
    import com.gamecook.frogue.equipment.Equipment;
    import com.gamecook.frogue.equipment.IEquipable;
    import com.gamecook.frogue.sprites.SpriteSheet;
    import com.gamecook.frogue.tiles.TileTypes;

    public class EquipmentFactory
    {


        private var modifyMap:Array = [];
        //private var materials:Array = [WOOD, STEEL, BRONZE, GOLD, DIMOND];
        private var materialColors:Array = [];
        private var baseColor:uint = 0xffa6a6a6;
        private var spriteSheet:SpriteSheet;
        private var prefixes:Array;
        private var suffixes:Array;
        private var types:Array;


        public function EquipmentFactory(spriteSheet:SpriteSheet, types:Array, prefixes:Array = null, suffixes:Array = null,  materials:Array =null)
        {
            this.spriteSheet = spriteSheet;
            this.prefixes = prefixes;
            this.types = types;
            this.suffixes = suffixes;
        }

        public function createEquipment(level:uint, equipmentType:int):IEquipable
        {
            //TODO: figure out how level matches length of arrays
            //level = Math.min(level, prefixes.length - 1);
            level = int(Math.random() * level);

            //TODO: match character level range to weapon range
            //TODO need to convert tileID to sprite ID here and not in monster class.
            var tileID:String = createTileID(equipmentType);
            var type:String = TileTypes.getTileName(tileID);
            var description:String = createDescription(level, type);
            var modifierValue:int = createModifierValue(level, TileTypes.getEquipmentValue(tileID));

            //TODO this all needs to be cleaned up
            var spriteID:String = TileTypes.getTileSprite(tileID);
            // GenerateNewSprite
            /*if(!spriteSheet.hasSprite(spriteID))
             {
             var sprite:BitmapData = spriteSheet.getSprite(spriteID);
             ColorUtil.replaceColor(sprite, baseColor, 0xffff0000);
             //tileID = tileID.concat("Wood");
             spriteSheet.cacheSprite(spriteID, sprite );
             }
             */
            trace("Created weapon", modifierValue);
            var modify:String = TileTypes.getEquipmentAttribute(tileID);

            var weapon:Equipment = new Equipment();
            weapon.parseObject({tileID:tileID, type:equipmentType, description:description, modifyValue:modifierValue, modifyAttribute:modify, slotID:equipmentType});
            return weapon;
        }

        private function createTileID(arrayName:int):String
        {
            var randomType:int = int(Math.random() * types[arrayName].length);
            return types[arrayName][randomType];
        }

        private function createDescription(level:uint, type:String):String
        {
            var description:String;
            //TODO: add small percentage chance for unique weapons
            description = createPrefix(level) + " " + type + " " + createSuffix(level);
            return description;
        }

        private function createPrefix(level:uint):String
        {
            // Handle no prefixes
            if(!prefixes) return "";

            var random:int = int(Math.random() * prefixes[level].length);
            var prefix:String = prefixes[level][random];

            return prefix;
        }

        private function createModifierValue(level:uint, baseValue:int = 1):uint
        {
            //TODO: determine damage based on level
            return int(Math.random() * level) + baseValue;
        }

        private function createSuffix(level:uint):String
        {
            // Handle no prefixes
            if(!suffixes) return "";

            var random:int = int(Math.random() * suffixes[level].length);
            var suffix:String = suffixes[level][random];
            return suffix;
        }
    }
}