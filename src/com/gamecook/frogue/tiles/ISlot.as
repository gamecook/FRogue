/**
 * Created by IntelliJ IDEA.
 * User: jessefreeman
 * Date: 4/11/11
 * Time: 8:01 AM
 * To change this template use File | Settings | File Templates.
 */
package com.gamecook.frogue.tiles
{
    import com.gamecook.frogue.equipment.IEquipable;

    public interface ISlot
    {
        function setWeaponSlot(value:IEquipable):void;

        function getWeaponSlot():IEquipable;

        function setHelmetSlot(value:IEquipable):void;

        function getHelmetSlot():IEquipable;

        function setArmorSlot(value:IEquipable):void;

        function getArmorSlot():IEquipable;

        function setShieldSlot(value:IEquipable):void;

        function getShieldSlot():IEquipable;

        function setShoeSlot(value:IEquipable):void;

        function getShoeSlot():IEquipable;
    }
}
