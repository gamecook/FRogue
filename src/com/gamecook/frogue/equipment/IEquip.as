/**
 * Created by IntelliJ IDEA.
 * User: jessefreeman
 * Date: 4/5/11
 * Time: 8:29 PM
 * To change this template use File | Settings | File Templates.
 */
package com.gamecook.frogue.equipment
{
    public interface IEquip
    {

        function equip(item:IEquipable):IEquipable;

        function canEquip(item:IEquipable):Boolean;

    }
}
