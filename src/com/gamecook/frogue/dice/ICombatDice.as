/**
 * Created by IntelliJ IDEA.
 * User: Jesse Freeman
 * Date: 2/6/11
 * Time: 8:53 PM
 * To change this template use File | Settings | File Templates.
 */
package com.gamecook.frogue.dice
{
    public interface ICombatDice
    {
        function attackRoll(rolls:int = 1):int;

        function defenseRoll(rolls:int = 1):int;

        function monsterDefenseRoll(rolls:int = 1):int;
    }
}
