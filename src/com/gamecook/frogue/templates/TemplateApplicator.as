/*
 *
 *  Permission is hereby granted, free of charge, to any person obtaining a copy
 *  of this software and associated documentation files (the "Software"), to deal
 *  in the Software without restriction, including without limitation the rights
 *  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 *  copies of the Software, and to permit persons to whom the Software is
 *  furnished to do so, subject to the following conditions:
 *
 *  The above copyright notice and this permission notice shall be included in
 *  all copies or substantial portions of the Software.
 *
 *  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 *  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 *  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 *  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 *  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 *  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 *  THE SOFTWARE.
 * /
 */

/**
 * Created by IntelliJ IDEA.
 * User: Jesse Freeman
 * Date: 3/3/11
 * Time: 10:57 PM
 * To change this template use File | Settings | File Templates.
 */
package com.gamecook.frogue.templates
{
    import com.gamecook.frogue.combat.ICombatant;

    public class TemplateApplicator
    {
        public function TemplateApplicator()
        {
        }

        public function apply(target:ICombatant, template:ITemplate, points:int):void
        {
            var property:String;
            while (points > 0)
            {
                property = template.nextProperty();
                addPoint(property, target);

                points --;

            }
        }

        private function addPoint(property:String, target:ICombatant):void
        {
            //TODO need to add a check to see if you can actually add point, if not it needs to go to life.
            switch (property)
            {
                case TemplateProperties.LIFE:
                    target.addMaxLife(1);
                    break;
                case TemplateProperties.ATTACK:
                    target.addAttackRoll(1);
                    break;
                case TemplateProperties.DEFENSE:
                    target.addDefenseRoll(1);
                    break;
                case TemplateProperties.ATT_DEF:
                    addPoint(getAttackOrDefenseProperty(Math.random()), target);
                    break;
                case TemplateProperties.RANDOM:
                    addPoint(getAttackOrDefenseProperty(Math.random() * 3), target);
                    break;
            }
        }

        protected function getAttackOrDefenseProperty(value:Number):String
        {
            if (value < .5)
                return TemplateProperties.ATTACK;
            else
                return TemplateProperties.DEFENSE;

        }

        protected function getRandomProperty(value:int):String
        {
            //TODO need to make sure random doesn't pull up the same value as last call
            if (value == 0)
                return TemplateProperties.LIFE;
            else if (value == 1)
                return TemplateProperties.ATTACK;
            else
                return TemplateProperties.DEFENSE;

        }
    }
}
