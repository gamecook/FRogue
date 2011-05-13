/**
 * Created by IntelliJ IDEA.
 * User: jessefreeman
 * Date: 4/5/11
 * Time: 10:08 PM
 * To change this template use File | Settings | File Templates.
 */
package com.gamecook.frogue.tiles
{
    import com.gamecook.frogue.equipment.Equipment;
    import com.gamecook.frogue.equipment.IEquipable;

    public class EquipmentTile extends BaseTile
    {

        private var equipment:IEquipable;

        public function EquipmentTile()
        {
        }

        override public function parseObject(obj:Object):void
        {
            super.parseObject(obj);

            if (obj.hasOwnProperty("equipment"))
            {
                equipment = new Equipment();
                equipment.parseObject(obj.equipment);
            }

        }

        override public function toObject():Object
        {
            var obj:Object = super.toObject();
            obj.weapon = equipment.toObject();

            return obj;
        }

        public function getEquipment():IEquipable
        {
            return equipment;
        }
    }
}
