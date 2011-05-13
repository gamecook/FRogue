/**
 * Created by IntelliJ IDEA.
 * User: Jesse Freeman
 * Date: 2/1/11
 * Time: 10:54 AM
 * To change this template use File | Settings | File Templates.
 */
package com.gamecook.frogue.combat
{
    import com.gamecook.frogue.tiles.ISlot;
    import com.gamecook.frogue.tiles.ITile;

    public interface ICombatant extends ITile, ISlot
    {
        function set onDie(value:Function):void;

        function get onDie():Function;

        function get onAttack():Function;

        function set onAttack(value:Function):void;

        function get onDefend():Function;

        function set onDefend(value:Function):void;

        function getLife():int;

        function subtractLife(value:int):void;

        function addLife(value:int):void;

        function getHitValue():int;

        function getDefenseValue():int;

        function getMaxLife():int;

        function addAttackRoll(i:int):void;

        function addDefenseRoll(i:int):void;

        function getCharacterPoints():int;

        function setCharacterPoints(value:int):void;

        function getAttackRolls():int;

        function getDefenseRolls():int;

        function addMaxLife(value:int):void;

        function attack(monster:ICombatant, useChance:Boolean):void;

        function defend(monster:ICombatant):void;

        function get isDead():Boolean;

        function setAttackRolls(value:int):void;

        function setDefenseRolls(value:int):void;
    }
}
