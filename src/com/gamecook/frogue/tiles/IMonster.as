/**
 * Created by IntelliJ IDEA.
 * User: jfreeman
 * Date: 3/4/11
 * Time: 10:37 AM
 * To change this template use File | Settings | File Templates.
 */
package com.gamecook.frogue.tiles
{
    import com.gamecook.frogue.combat.ICombatant;
    import com.gamecook.frogue.equipment.IEquip;

    public interface IMonster extends ICombatant, IEquip, ISlot
    {
        function getCharacterPointPercent():Number;
    }
}
