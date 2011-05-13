/**
 * User: John Lindquist
 * Date: 3/28/11
 * Time: 12:23 PM
 */
package com.gamecook.frogue.combat
{
    public class AttackResult
    {
        private var _success:Boolean;
        private var _hitValue:int;
        private var _difference:int;
        private var _attacker:ICombatant;
        private var _defender:ICombatant;

        public function get attacker():ICombatant
        {
            return _attacker;
        }

        public function get defender():ICombatant
        {
            return _defender;
        }

        public function get success():Boolean
        {
            return _success;
        }

        public function get hitValue():int
        {
            return _hitValue;
        }

        public function get difference():int
        {
            return _difference;
        }

        public function AttackResult(attacker:ICombatant, defender:ICombatant, success:Boolean, hitValue:int, difference:int)
        {
            _attacker = attacker;
            _defender = defender;
            _success = success;
            _hitValue = hitValue;
            _difference = difference;
        }
    }
}