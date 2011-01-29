/**
 * Created by IntelliJ IDEA.
 * User: Jesse Freeman
 * Date: 1/26/11
 * Time: 3:39 PM
 * To change this template use File | Settings | File Templates.
 */
package com.gamecook.frogue.io
{
    import flash.display.DisplayObject;
    import flash.display.Stage;
    import flash.events.IEventDispatcher;
    import flash.events.KeyboardEvent;
    import flash.ui.Keyboard;

    public class Controls implements IControl
    {
        private var _target:IControl;

        public function Controls(target:IControl)
        {
            this.target = target;
        }

        public function registerEvent():void
        {
            if(target is IEventDispatcher && target is DisplayObject)
            {
                if(DisplayObject(target).hasOwnProperty("stage"))
                {
                    var dispatcher:IEventDispatcher = target["stage"] as IEventDispatcher;

                    dispatcher.addEventListener(KeyboardEvent.KEY_UP, onKeyDown);
                }
            }
        }

        private function onKeyDown(event:KeyboardEvent):void
        {
            switch(event.keyCode)
            {
                case Keyboard.UP:
                    up();
                break;
                case Keyboard.RIGHT:
                    right();
                break;
                case Keyboard.DOWN:
                    down();
                break;
                case Keyboard.LEFT:
                    left();
                break;
            }
        }

        public function up():void
        {
            target.up();
        }

        public function down():void
        {
            target.down();
        }

        public function right():void
        {
            target.right();
        }

        public function left():void
        {
            target.left();
        }

        public function get target():IControl
        {
            return _target;
        }

        public function set target(value:IControl):void
        {
            _target = value;
            registerEvent();
        }
    }
}
