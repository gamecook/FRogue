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

        public static const TYPES:Object = new Object();
        public static const DARKNESS:String = "darkness";
        {
            TYPES[' '] = { name: 'Floor', sprite: "sprite0", type: PASSABLE},
                    TYPES['#'] = { name: 'Wall', sprite: "sprite1", type: IMPASSABLE},
                    TYPES['E'] = { name: 'Exit', sprite: "sprite2", type: EXIT},
                    TYPES['_1'] = { name: 'Empty1', sprite: "sprite53", type: PASSABLE},
                    TYPES['_2'] = { name: 'Empty2', sprite: "sprite54", type: PASSABLE},
                    TYPES['_3'] = { name: 'Empty3', sprite: "sprite55", type: PASSABLE},
                    TYPES['_4'] = { name: 'Empty4', sprite: "sprite56", type: PASSABLE},
                    TYPES['_5'] = { name: 'Empty5', sprite: "sprite57", type: PASSABLE},
                    TYPES['_6'] = { name: 'Empty6', sprite: "sprite58", type: PASSABLE},
                    TYPES['T'] = { name: 'Treasure', sprite: "sprite4", type: TREASURE, classPath:"TreasureChestTile"},
                    TYPES['$'] = { name: 'Gold', sprite: "sprite5", type: PICKUP, classPath:"GoldTile"},
                    TYPES['P'] = { name: 'Potion', sprite: "sprite6", type: PICKUP},
                    TYPES['X'] = { name: 'Blood', sprite: "sprite7", type: PASSABLE},
                    TYPES['@'] = { name: 'Player', sprite: "sprite8", type: PLAYER, classPath:"PlayerTile"},
                    TYPES['1'] = { name: 'Ork', sprite: "sprite9", type: MONSTER, classPath:"MonsterTile", pointPercent:"0"},
                    TYPES['2'] = { name: 'Oger', sprite: "sprite10", type: MONSTER, classPath:"MonsterTile", pointPercent:".1"},
                    TYPES['3'] = { name: 'Goblin', sprite: "sprite11", type: MONSTER, classPath:"MonsterTile", pointPercent:".1"},
                    TYPES['4'] = { name: 'Wolfman', sprite: "sprite12", type: MONSTER, classPath:"MonsterTile", pointPercent:".3"},
                    TYPES['5'] = { name: 'Vampire', sprite: "sprite13", type: MONSTER, classPath:"MonsterTile", pointPercent:".3"},
                    TYPES['6'] = { name: 'Mummy', sprite: "sprite14", type: MONSTER, classPath:"MonsterTile", pointPercent:".4"},
                    TYPES['7'] = { name: 'Skeleton', sprite: "sprite15", type: MONSTER, classPath:"MonsterTile", pointPercent:".4"},
                    TYPES['8'] = { name: 'Imp', sprite: "sprite16", type: MONSTER, classPath:"MonsterTile", pointPercent:".6"},
                    TYPES['9'] = { name: 'Gargoyle', sprite: "sprite17", type: BOSS, classPath:"MonsterTile", pointPercent:"1"},
                    TYPES['A'] = { name: 'Artifact', sprite: "sprite100", type: ARTIFACT},

                /* Weapons */
                    TYPES['w1'] = { name: 'Spear', sprite: "sprite18", classPath:"EquipmentTile", type: EQUIPMENT, modifyValue: 1 , modifyAttribute: "modifyAttack"},
                    TYPES['w2'] = { name: 'Cane', sprite: "sprite19", classPath:"EquipmentTile", type: EQUIPMENT, modifyValue: 1 , modifyAttribute: "modifyAttack"},
                    TYPES['w3'] = { name: 'Magic Wand', sprite: "sprite20", classPath:"EquipmentTile", type: EQUIPMENT, modifyValue: 1 , modifyAttribute: "modifyAttack"},
                    TYPES['w4'] = { name: 'Lead Pipe', sprite: "sprite21", classPath:"EquipmentTile", type: EQUIPMENT, modifyValue: 1 , modifyAttribute: "modifyAttack"},
                    TYPES['w5'] = { name: 'Knuckles', sprite: "sprite22", classPath:"EquipmentTile", type: EQUIPMENT, modifyValue: 1 , modifyAttribute: "modifyAttack"},
                    TYPES['w6'] = { name: 'Dagger', sprite: "sprite23", classPath:"EquipmentTile", type: EQUIPMENT, modifyValue: 1 , modifyAttribute: "modifyAttack"},
                    TYPES['w7'] = { name: 'Foil', sprite: "sprite24", classPath:"EquipmentTile", type: EQUIPMENT, modifyValue: 1 , modifyAttribute: "modifyAttack"},
                    TYPES['w8'] = { name: 'Sword', sprite: "sprite25", classPath:"EquipmentTile", type: EQUIPMENT, modifyValue: 1 , modifyAttribute: "modifyAttack"},
                    TYPES['w9'] = { name: 'Mace', sprite: "sprite26", classPath:"EquipmentTile", type: EQUIPMENT, modifyValue: 1 , modifyAttribute: "modifyAttack"},
                    TYPES['w10'] = { name: 'Axe', sprite: "sprite27", classPath:"EquipmentTile", type: EQUIPMENT, modifyValue: 1 , modifyAttribute: "modifyAttack"},
                    TYPES['w11'] = { name: 'Croquet Mallot', sprite: "sprite28", classPath:"EquipmentTile", type: EQUIPMENT, modifyValue: 1 , modifyAttribute: "modifyAttack"},
                    TYPES['w12'] = { name: 'Whip', sprite: "sprite29", classPath:"EquipmentTile", type: EQUIPMENT, modifyValue: 1 , modifyAttribute: "modifyAttack"},
                    TYPES['w13'] = { name: 'Club', sprite: "sprite30", classPath:"EquipmentTile", type: EQUIPMENT, modifyValue: 1 , modifyAttribute: "modifyAttack"},
                    TYPES['w14'] = { name: 'Stick', sprite: "sprite31", classPath:"EquipmentTile", type: EQUIPMENT, modifyValue: 1 , modifyAttribute: "modifyAttack"},

                    TYPES['sl1'] = { name: 'Shield 1', sprite: "sprite32", classPath:"EquipmentTile", type: EQUIPMENT, modifyValue: 1 , modifyAttribute: "modifyDefense"},
                    TYPES['sl2'] = { name: 'Shield 2', sprite: "sprite33", classPath:"EquipmentTile", type: EQUIPMENT, modifyValue: 1 , modifyAttribute: "modifyDefense"},
                    TYPES['sl3'] = { name: 'Shield 3', sprite: "sprite34", classPath:"EquipmentTile", type: EQUIPMENT, modifyValue: 1 , modifyAttribute: "modifyDefense"},
                    TYPES['sl4'] = { name: 'Shield 4', sprite: "sprite35", classPath:"EquipmentTile", type: EQUIPMENT, modifyValue: 1 , modifyAttribute: "modifyDefense"},
                    TYPES['sl5'] = { name: 'Shield 5', sprite: "sprite36", classPath:"EquipmentTile", type: EQUIPMENT, modifyValue: 1 , modifyAttribute: "modifyDefense"},

                    TYPES['h1'] = { name: 'Helmet 1', sprite: "sprite37", classPath:"EquipmentTile", type: EQUIPMENT, modifyValue: 1 , modifyAttribute: "modifyDefense"},
                    TYPES['h2'] = { name: 'Helmet 2', sprite: "sprite38", classPath:"EquipmentTile", type: EQUIPMENT, modifyValue: 1 , modifyAttribute: "modifyDefense"},
                    TYPES['h3'] = { name: 'Helmet 3', sprite: "sprite39", classPath:"EquipmentTile", type: EQUIPMENT, modifyValue: 1 , modifyAttribute: "modifyDefense"},
                    TYPES['h4'] = { name: 'Helmet 4', sprite: "sprite40", classPath:"EquipmentTile", type: EQUIPMENT, modifyValue: 1 , modifyAttribute: "modifyDefense"},
                    TYPES['h5'] = { name: 'Helmet 5', sprite: "sprite41", classPath:"EquipmentTile", type: EQUIPMENT, modifyValue: 1 , modifyAttribute: "modifyDefense"},
                    TYPES['h6'] = { name: 'Helmet 6', sprite: "sprite42", classPath:"EquipmentTile", type: EQUIPMENT, modifyValue: 1 , modifyAttribute: "modifyDefense"},
                    TYPES['h7'] = { name: 'Helmet 7', sprite: "sprite43", classPath:"EquipmentTile", type: EQUIPMENT, modifyValue: 1 , modifyAttribute: "modifyDefense"},

                    TYPES['a1'] = { name: 'Armor 1', sprite: "sprite44", classPath:"EquipmentTile", type: EQUIPMENT, modifyValue: 1 , modifyAttribute: "modifyDefense"},
                    TYPES['a2'] = { name: 'Armor 2', sprite: "sprite45", classPath:"EquipmentTile", type: EQUIPMENT, modifyValue: 1 , modifyAttribute: "modifyDefense"},
                    TYPES['a3'] = { name: 'Armor 3', sprite: "sprite46", classPath:"EquipmentTile", type: EQUIPMENT, modifyValue: 1 , modifyAttribute: "modifyDefense"},
                    TYPES['a4'] = { name: 'Armor 4', sprite: "sprite47", classPath:"EquipmentTile", type: EQUIPMENT, modifyValue: 1 , modifyAttribute: "modifyDefense"},
                    TYPES['a5'] = { name: 'Armor 5', sprite: "sprite48", classPath:"EquipmentTile", type: EQUIPMENT, modifyValue: 1 , modifyAttribute: "modifyDefense"},
                    TYPES['a6'] = { name: 'Armor 6', sprite: "sprite49", classPath:"EquipmentTile", type: EQUIPMENT, modifyValue: 1 , modifyAttribute: "modifyDefense"},

                    TYPES['sh1'] = { name: 'Shoe 1', sprite: "sprite50", classPath:"EquipmentTile", type: EQUIPMENT, modifyValue: 1 , modifyAttribute: "modifyDefense"},
                    TYPES['sh2'] = { name: 'Shoe 2', sprite: "sprite51", classPath:"EquipmentTile", type: EQUIPMENT, modifyValue: 1 , modifyAttribute: "modifyDefense"},
                    TYPES['sh3'] = { name: 'Shoe 3', sprite: "sprite52", classPath:"EquipmentTile", type: EQUIPMENT, modifyValue: 1 , modifyAttribute: "modifyDefense"}
        }

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
    }
}
