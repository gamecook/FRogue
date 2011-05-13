/**
 * Created by IntelliJ IDEA.
 * User: Jesse Freeman
 * Date: 2/8/11
 * Time: 8:06 PM
 * To change this template use File | Settings | File Templates.
 */
package com.gamecook.frogue.factories
{
    import com.gamecook.frogue.tiles.BaseTile;

    public interface ITileFactory
    {
        function createTile(value:String):BaseTile;
    }
}
