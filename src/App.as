package
{
	/**
	 * ...
	 * @author baton
	 */
	
	import flash.display.Sprite;
	import common.Common;
	import game.rooms.*;
	
	public class App extends Sprite
	{
		public function App() 
		{
			trace('App');

			addChild(Common.roomField);
			Common.createRoom(new MainRoom, 'MainRoom');
			Common.createRoom(new GameRoom, 'GameRoom');

			Common.switchRoom('MainRoom');
			//Common.switchRoom('GameRoom');
		}

	}
}