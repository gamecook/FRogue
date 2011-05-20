/**
 * Created by IntelliJ IDEA.
 * User: Jesse Freeman
 * Date: 2/1/11
 * Time: 8:11 PM
 * To change this template use File | Settings | File Templates.
 */
package com.gamecook.frogue.tiles
{

    public class TileTypes
    {
        public static const PASSABLE:String = "passable";
        public static const IMPASSABLE:String = "impassable";
        public static const EXIT:String = "exit";
        public static const PLAYER:String = "player";
        public static const MONSTER:String = "monster";
        public static const TREASURE:String = "treasure";
        public static const ARTIFACT:String = "artifact";
        public static const PICKUP:String = "pickup";
        public static const BOSS:String = "boss";
        public static const EQUIPMENT:String = "equipment";
        public static const DARKNESS:String = "darkness";
        public static const TYPES:Object = new Object();

        public static function registerTile(id:String, template:Object):void
        {
            TYPES[id] = template;
        }

        public static function removeTile(id:String):void
        {
            delete TYPES[id];
        }

        public static function getTileColor(tile:String):uint
        {
            if (TYPES[tile] == null)
                tile = TYPES["#"];
            return TYPES[tile].color;
        }

        public static function getTileTemplate(id:String):Object
        {
            return TYPES[id];
        }

        public static function getTileType(tile:String):String
        {
            return TYPES[tile].type;
        }

        public static function getTileSprite(tile:String):String
        {
            return TYPES[tile].sprite;
        }

        public static function isMonster(tile:String):Boolean
        {
            return (TYPES[tile].type == MONSTER);
        }

        public static function getStats(tile:String):Object
        {
            var obj:Object = TYPES[tile];
            return {hit:obj.attackRoll, defense:obj.defenseRoll};
        }

        public static function isBoss(tile:String):Boolean
        {
            return (TYPES[tile].type == BOSS);
        }

        public static function isPlayer(value:String):Boolean
        {
            return (TYPES[value].type == PLAYER);
        }

        public static function getTileName(value:String):String
        {
            return TYPES[value].name;
        }

        public static function isDarkness(value:String):Boolean
        {
            return TYPES[value] == null ? false : (TYPES[value].type == DARKNESS);
        }

        public static function getEmptyTile():String
        {
            return " ";
        }

        public static function getRandomOpenTile():String
        {
            var tileTypes:Array = [" ","_1","_2","_3","_4","_5","_6"];
            var i:int = Math.floor(Math.random() * tileTypes.length);
            return tileTypes[i];
        }

        public static function getEquipmentAttribute(value:String):String
        {
            return TYPES[value].modifyAttribute;
        }

        public static function getEquipmentValue(value:String):int
        {
            return TYPES[value].modifyValue;
        }

        public static function getEquipmentPreview(value:String):String
        {
            return TYPES[value].preview;
        }
    }
}
