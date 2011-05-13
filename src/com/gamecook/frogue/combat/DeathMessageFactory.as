/**
 * User: John Lindquist
 * Date: 3/28/11
 * Time: 1:06 PM
 */
package com.gamecook.frogue.combat
{
    public class DeathMessageFactory
    {

        include "deathMessages.as"

        public static function getRandomDeathMessage():String
        {
            var length:uint = deathMessages.length;
            var randomIndex:Number = Math.floor(Math.random() * length);

            return deathMessages[randomIndex];
        }
    }
}