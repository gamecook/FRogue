/**
 * Created by IntelliJ IDEA.
 * User: Jesse Freeman
 * Date: 2/2/11
 * Time: 8:52 AM
 * To change this template use File | Settings | File Templates.
 */
package com.gamecook.frogue.dice
{
    public class CombatDice extends BaseDice implements ICombatDice
    {
        public static const BLACK_SHIELD:int = 0;
        public static const SKULL_1:int = 1;
        public static const SKULL_2:int = 2;
        public static const SKULL_3:int = 3;
        public static const SHIELD_1:int = 4;
        public static const SHIELD_2:int = 5;

        public function CombatDice(sides:int = 5)
        {
            super(sides);
        }

        public function attackRoll(rolls:int = 1):int
        {
            var rollValue:int;
            var i:int;
            var value:int = 0;

            for (i = 0; i < rolls; ++i)
            {
                rollValue = roll();
                switch (rollValue)
                {
                    case SKULL_1: case SKULL_2: case SKULL_3:
                    value ++;
                    break;
                }
            }

            return value;
        }

        public function defenseRoll(rolls:int = 1):int
        {
            var rollValue:int;
            var i:int;
            var value:int = 0;

            for (i = 0; i < rolls; ++i)
            {
                rollValue = roll();
                switch (rollValue)
                {
                    case SHIELD_1: case SHIELD_2:
                    value ++;
                    break;
                }
            }

            return value;
        }

        public function monsterDefenseRoll(rolls:int = 1):int
        {
            var rollValue:int;
            var i:int;
            var value:int;

            for (i = 0; i < rolls; ++i)
            {
                rollValue = roll();
                value += rollValue == BLACK_SHIELD ? 1 : 0;
            }

            return value;
        }
    }
}
