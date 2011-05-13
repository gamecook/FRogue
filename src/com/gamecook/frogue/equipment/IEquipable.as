/**
 * Created by IntelliJ IDEA.
 * User: jfreeman
 * Date: 4/5/11
 * Time: 6:07 PM
 * To change this template use File | Settings | File Templates.
 */
package com.gamecook.frogue.equipment
{
    import com.jessefreeman.factivity.serialize.ISerializeToObject;

    public interface IEquipable extends ISerializeToObject
    {
        function get tileID():String;

        function getSlotID():int;

        function getModifyAttribute():String;

        function getValue():Number;

        function get description():String;
    }
}
