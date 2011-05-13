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
 * Time: 11:03 PM
 * To change this template use File | Settings | File Templates.
 */
package com.gamecook.frogue.templates
{
    public class Template implements ITemplate
    {
        private var attributes:Array = [];
        private var index:int = 0;
        private var _name:String;

        public function Template(name:String, attributes:Array)
        {
            _name = name;
            this.attributes = attributes;
        }

        public function nextProperty():String
        {
            // If there is only one just return that.
            if (attributes.length == 1)
                return attributes[index];

            //
            var attribute:String = attributes[index];

            // increment index and reset to 0 if out of bounds
            index ++;
            if (index > attributes.length - 1)
                index = 0;

            return attribute;
        }

        public function getName():String
        {
            return _name;
        }
    }
}
