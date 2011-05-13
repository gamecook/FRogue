/**
 * Created by IntelliJ IDEA.
 * User: Jesse Freeman
 * Date: 2/6/11
 * Time: 11:40 AM
 * To change this template use File | Settings | File Templates.
 */
package com.gamecook.frogue.factories
{
    import com.gamecook.frogue.tiles.BaseTile;

    import com.gamecook.frogue.tiles.TileTypes;

    import flash.utils.getDefinitionByName;

    public class TileFactory implements ITileFactory
    {

        private const TILE_PACKAGE:String = "com.gamecook.frogue.tiles.";

        public function TileFactory()
        {
            //TODO I removed the reference of TileTypes when it wasn't static. So remember that in case you need to go back.
        }

        public function createTile(value:String):BaseTile
        {
            var template:Object = TileTypes.getTileTemplate(value);
            if (!template)
                return null;

            var classReference:Class;
            try
            {
                classReference = getDefinitionByName(TILE_PACKAGE + template.classPath) as Class;
            }
            catch(error:Error)
            {
                classReference = BaseTile;
            }

            var instance:BaseTile = new classReference;

            if (instance.hasOwnProperty("parseObject"))
                instance["parseObject"](template);

            return instance;
        }

    }
}
