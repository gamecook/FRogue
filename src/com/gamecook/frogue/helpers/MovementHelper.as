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

    public class MovementHelper implements IControl
    {
        private var _playerPosition:Point;
        private var oldTileValue:String;
        private var map:IMap;

        public function MovementHelper(map:IMap, startPosition:Point)
        {
            this.map = map;
            _playerPosition = startPosition;
            oldTileValue = " ";
            map.swapTile(playerPosition, "@");
        }

        public function up():void
        {
            move(0,-1);
        }

        public function down():void
        {
            move(0,1);
        }

        public function right():void
        {
            move(1,0);
        }

        public function left():void
        {
            move(-1,0);
        }

        public function move(x:int, y:int):void
        {
            var tmpPosition:Point = playerPosition.clone();
            tmpPosition.x += x;
            tmpPosition.y += y;

            if(tmpPosition.x < 0 || tmpPosition.x+1 > map.width)
                return;

            if(tmpPosition.y < 0 || tmpPosition.y+1 > map.height)
                return;

            var tile:String = map.getTileType(tmpPosition);

           if(tile == " ")
           {
                map.swapTile(playerPosition, oldTileValue);
                playerPosition.x = tmpPosition.x;
                playerPosition.y = tmpPosition.y;
                oldTileValue = map.swapTile(playerPosition, "@");
           }
            else
           {
               // Lookup what to do with this
           }
        }

        public function get playerPosition():Point
        {
            return _playerPosition;
        }
    }

}
