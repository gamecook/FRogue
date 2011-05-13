/**
 * Created by IntelliJ IDEA.
 * User: Jesse Freeman
 * Date: 2/1/11
 * Time: 10:53 AM
 * To change this template use File | Settings | File Templates.
 */
package com.gamecook.frogue.tiles
{
    import com.jessefreeman.factivity.serialize.ISerializeToObject;
    import com.jessefreeman.factivity.utils.ClassUtil;

    public class BaseTile implements ITile, ISerializeToObject
    {
        private var name:String = "undefined";
        private var _type:String;
        private var _id:String;
        private var className:String;

        public function BaseTile()
        {
            className = ClassUtil.className(this);
        }

        public function getName():String
        {
            return name;
        }

        public function setName(value:String):void
        {
            name = value;
        }

        public function get type():String
        {
            return _type;
        }

        public function set type(value:String):void
        {
            _type = value;
        }

        public function get id():String
        {
            return _id;
        }

        public function set id(value:String):void
        {
            _id = value;
        }

        public function parseObject(obj:Object):void
        {
            if (obj.hasOwnProperty("name"))
                name = obj.name;

            if (obj.hasOwnProperty("id"))
                id = obj.id;

            if (obj.hasOwnProperty("type"))
                type = obj.type;
        }

        public function toObject():Object
        {
            return {name:name, type:type, id: id, classPath:className};
        }

    }
}
