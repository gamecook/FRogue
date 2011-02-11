/**
 * Created by IntelliJ IDEA.
 * User: Jesse Freeman
 * Date: 1/29/11
 * Time: 8:00 PM
 * To change this template use File | Settings | File Templates.
 */
package com.gamecook.frogue.helpers
{
    import com.gamecook.frogue.io.IControl;
    import com.gamecook.frogue.maps.IMap;

    import flash.geom.Point;

    public class MovementHelper
    {
        private var _playerPosition:Point;
        private var oldTileValue:String;
        private var map:IMap;
        public static const UP:Point = new Point(0,-1);
        public static const DOWN:Point = new Point(0,1);
        public static const RIGHT:Point = new Point(1,0);
        public static const LEFT:Point = new Point(-1,0);

        public function MovementHelper(map:IMap)
        {
            this.map = map;

        }

        public function move(x:int, y:int, playerToken:String = "@"):void
        {
            map.swapTile(playerPosition, oldTileValue);
            playerPosition.x += x;
            playerPosition.y += y;
            oldTileValue = map.swapTile(playerPosition, playerToken);
        }

        public function previewMove(x:int, y:int):Point
        {
            var tmpPosition:Point = playerPosition.clone();
            tmpPosition.x += x;
            tmpPosition.y += y;

            if(tmpPosition.x < 0 || tmpPosition.x+1 > map.width)
                return null;

            if(tmpPosition.y < 0 || tmpPosition.y+1 > map.height)
                return null;

            return tmpPosition;

        }

        public function get playerPosition():Point
        {
            return _playerPosition;
        }

        public function startPosition(value:Point):void
        {
            _playerPosition = value;
            oldTileValue = "E";
            map.swapTile(value, "@");
        }
    }

}
