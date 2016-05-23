package
{
	/**
	 * ...
	 * @author baton; Gospodin.Sorokin
	 */
	
	import common.gavanna.Gavanas;
	import common.gavanna.Shop;
	import common.vk.Vkonte;
	import flash.display.Sprite;
	import common.Common;
	import common.gavanna.IronScreen;
	import game.rooms.*;
	import flash.events.*;
	
	import common.gavanna.AppGavanna;
	import common.events.AppGavannaEvent;
	
	import common.vk.*;
	import flash.events.*;
	
	public class App extends Sprite
	{
		private static var ironScreen:IronScreen;
		
		private static var gavanas:Gavanas = new Gavanas();
	
		private var appGavanna:AppGavanna;
		private var vkonte:Vkonte;
		
		private var flashVars: Object;
		private var VK: APIConnection;
		
		public function App() 
		{
			addChild(Common.roomField);
			
			ironScreen = new IronScreen(this);
			ironScreen.x = 400;
			ironScreen.y = 425;
			addChild(ironScreen);
			
			addChild(gavanas);
			appGavanna = new AppGavanna(gavanas);
			Common.server = appGavanna;
            appGavanna.addEventListener(AppGavannaEvent.COMPLETE, gavannaCompleteHandler);
			appGavanna.Please("Start");
		}
		private function gavannaCompleteHandler(e:AppGavannaEvent):void {
			appGavanna.removeEventListener(AppGavannaEvent.COMPLETE, gavannaCompleteHandler);
			Common.envOn = e.result[0][0];
		    Common.sfxOn = e.result[0][1];
			Common.carCur = e.result[0][2];
			Common.buyCars = e.result[1];
			trace('Common.carCur = ' + Common.carCur);
			//Common.carCur = 1;
			//Common.buyCars = [1,1,1,1,1,1,1,0,0,0 ,0,0,0,0,0,0,0,0,0,0 ,0,0,0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0,0,0, 0];
			
			Common.createRoom(new MainRoom, 'MainRoom');
			Common.createRoom(new GameRoom, 'GameRoom');
			Common.createRoom(new StoreRoom, 'StoreRoom');
			
			Common.switchRoom('MainRoom');
		}
	}
}