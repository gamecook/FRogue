/**
 * Created by IntelliJ IDEA.
 * User: Jesse Freeman
 * Date: 2/1/11
 * Time: 10:54 AM
 * To change this template use File | Settings | File Templates.
 */
package com.gamecook.frogue.tiles
{
    import com.gamecook.frogue.combat.ICombatant;

    public class PlayerTile extends MonsterTile
    {

        private var gold:int = 0;
        private var potions:int = 0;
        private var maxPotions:int = 0;
        private var kills:int = 0;
        private var steps:int = 0;
        private var visibility:int = 3;

        public var onUsePotion:Function;

        public function PlayerTile()
        {
        }

        override protected function set life(value:int):void
        {
            if (value == 0 && getPotions() > 0)
            {
                usePotion();
                return;
            }

            super.life = value;
        }

        private function usePotion():void
        {
            setLife(getMaxLife());
            subtractPotion();

            onUsePotion();
        }

        public function setGold(value:int):void
        {
            gold = value;
        }

        public function getGold():int
        {
            return gold;
        }

        public function addGold(value:int):void
        {
            gold += value;
        }

        public function subtractGold(value:int):void
        {
            gold -= value;
            if (gold < 0) gold = 0;
        }

        public function getPotions():int
        {
            return potions;
        }

        public function setPotions(value:int):void
        {
            potions = value;
        }

        override public function parseObject(obj:Object):void
        {
            super.parseObject(obj);

            if (obj.hasOwnProperty("gold"))
                gold = obj.gold;

            if (obj.hasOwnProperty("maxPotions"))
                maxPotions = obj.maxPotions;

            if (obj.hasOwnProperty("potions"))
                potions = obj.potions;

            if (obj.hasOwnProperty("kills"))
                kills = obj.kills;

            if (obj.hasOwnProperty("steps"))
                steps = obj.steps;

            if (obj.hasOwnProperty("visibility"))
                visibility = obj.visibility;

        }

        public function addPotion(value:int):void
        {
            potions += value;
        }

        public function getKills():int
        {
            return kills;
        }

        public function addKill():void
        {
            kills ++;
        }

        public function subtractPotion():void
        {
            potions --;
        }

        public function getMaxPotions():int
        {
            return maxPotions;
        }

        override public function toObject():Object
        {
            var obj:Object = super.toObject();

            obj.gold = gold;
            obj.maxPotions = maxPotions;
            obj.potions = potions;
            obj.kills = kills;
            obj.steps = steps;
            obj.visibility = visibility;

            return obj;
        }

        public function addStep():void
        {
            steps ++;
        }

        public function getSteps():int
        {
            return steps;
        }

        public function getVisibility():int
        {
            return visibility;
        }

        public function setVisibility(value:int):void
        {
            visibility = value;
        }

        override public function attack(monster:ICombatant, useChance:Boolean):void
        {
            super.attack(monster, useChance);

            if (monster.isDead)
            {
                addKill();
            }
        }

    }

}
