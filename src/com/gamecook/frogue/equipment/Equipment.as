/**
 * User: John Lindquist
 * Date: 3/19/11
 * Time: 5:53 PM
 */
package com.gamecook.frogue.equipment
{
    public class Equipment implements IEquipable
    {
        private var _type:String;
        private var _description:String;
        private var modifyValue:int;
        private var _tileID:String;
        private var slotID:int;
        private var modifyAttribute:String;

        public function get tileID():String
        {
            return _tileID;
        }

        public function get type():String
        {
            return _type;
        }

        public function get description():String
        {
            return _description;
        }

        public function Equipment()
        {

        }

        public function parseObject(value:Object):void
        {
            if (value.hasOwnProperty("tileID"))
                _tileID = value.tileID;

            if (value.hasOwnProperty("type"))
                _type = value.type;

            if (value.hasOwnProperty("description"))
                _description = value.description;

            if (value.hasOwnProperty("modifyValue"))
                modifyValue = value.modifyValue;

            if (value.hasOwnProperty("modifyAttribute"))
                modifyAttribute = value.modifyAttribute;

            if (value.hasOwnProperty("slotID"))
                slotID = value.slotID;
        }

        public function toObject():Object
        {
            return {tileID:tileID, type:type, description:description, damage:modifyValue, slotID:slotID}
        }

        public function getSlotID():int
        {
            return slotID;
        }

        public function getModifyAttribute():String
        {
            return modifyAttribute;
        }

        public function getValue():Number
        {
            return modifyValue;
        }
    }
}