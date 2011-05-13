/**
 * Created by IntelliJ IDEA.
 * User: Jesse Freeman
 * Date: 2/1/11
 * Time: 9:32 PM
 * To change this template use File | Settings | File Templates.
 */
package com.gamecook.frogue.dice
{
    public class BaseDice
    {
        private var sides:int;

        public function BaseDice(sides:int)
        {
            this.sides = sides;
        }

        public function roll():int
        {
            return randomNumber(0, sides);
        }

        protected function randomNumber(low:Number = 0, high:Number = 1):int
        {
            return Math.floor(Math.random() * (1 + high - low)) + low;
        }
    }
}
