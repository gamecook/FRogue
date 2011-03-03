/**
 * Created by IntelliJ IDEA.
 * User: Jesse Freeman
 * Date: 2/10/11
 * Time: 8:03 AM
 * To change this template use File | Settings | File Templates.
 */
package com.gamecook.frogue.maps
{
    import flash.geom.Point;

    public interface IMapSelection
    {
        function getTileID(column:int, row:int):int
        function getTiles():Array
        function getOffsetX():int
        function getOffsetY():int
        function setCenter(value:Point):void;
        function getCenter():Point;
        function toString():String;
    }
}
