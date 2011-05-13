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
    import com.jessefreeman.factivity.utils.ArrayUtil;

    public class TemplateCollection implements ITemplateCollection
    {
        private var templates:Array = [];
        private var templateNames:Array = [];

        public function TemplateCollection()
        {
        }

        public function getTemplate(id:String):ITemplate
        {
            return templates[id];
        }

        public function getRandomTemplate():ITemplate
        {
            //TODO need to look into why this would return a null template
            var id:String = ArrayUtil.pickRandomArrayElement(templateNames);

            return templates[id];
        }

        public function addTemplate(id:String, template:ITemplate, weight:int = 1):void
        {
            templates[id] = template;

            while (weight > 0)
            {
                templateNames.push(id);
                weight --;
            }
        }
    }
}
