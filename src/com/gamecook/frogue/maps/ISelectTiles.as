/**
 * Created by IntelliJ IDEA.
 * User: jessefreeman
 * Date: 4/14/11
 * Time: 6:19 PM
 * To change this template use File | Settings | File Templates.
 */
package com.gamecook.frogue.maps
{
    public interface ISelectTiles
    {
        function getTileID(column:int, row:int):int

        function getTiles():Array

    }
}
