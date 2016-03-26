package
{
	/**
	 * ...
	 * @author baton
	 */
	
	import common.gavanna.Gavanas;
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
			//trace('App');
			addChild(Common.roomField);
			
			ironScreen = new IronScreen(this);
			ironScreen.x = 400;
			ironScreen.y = 425;
			addChild(ironScreen);
			

			//addChild(Common.vkonte);
			addChild(gavanas);
			appGavanna = new AppGavanna();
            appGavanna.addEventListener(AppGavannaEvent.COMPLETE, gavannaCompleteHandler);
			appGavanna.Please("Start");
            this.addChild(appGavanna);
			
			Common.createRoom(new MainRoom, 'MainRoom');
			Common.createRoom(new GameRoom, 'GameRoom');
			Common.createRoom(new StoreRoom, 'StoreRoom');

			Common.switchRoom('MainRoom');
			//Common.switchRoom('GameRoom');
			//Common.switchRoom('StoreRoom');
			
			if (stage) { init() 
			} else { addEventListener(Event.ADDED_TO_STAGE, init) };
			
		}
		private function init(e: Event = null): void {
			//Для локальной работы закоментировать 
			//flashVars = stage.loaderInfo.parameters as Object;
			//Для локальной работы раскоментировать все поля
			/*
			flashVars['api_id'] = 4711425;
			flashVars['viewer_id'] = 13508828;
			flashVars['sid'] = "d4ef99ebf711049de67d9c5563e904cef96356e4ce9a5f609e7fb2e06f89148b90bc1c7efcbce8b7b42c5";
			flashVars['secret'] = "8aa15b9580";
			VK = new APIConnection(flashVars);
			VK.api('getProfiles', { uids: flashVars['viewer_id'] } );
			Common.vkonte = VK;
			*/
		}
		private function gavannaCompleteHandler(e:AppGavannaEvent):void {
			Common.userSettings = e.result[0];
			Common.userCar = e.result[1];
		}
	}
}