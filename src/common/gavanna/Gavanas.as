package common.gavanna 
{
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.*;
	import flash.net.*;
	import common.vk.*;
	import common.Common;
	/**
	 * ...
	 * @author Gospodin.Sorokin
	 */
	public class Gavanas extends Sprite
	{
		private var _serverAlarm :int = 0;
		private var _userData  	 :Array = [[1919191919],[1,1,1],[1,0,0,0,0,0,0,0,0,0 ,0,0,0,0,0,0,0,0,0,0 ,0,0,0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0,0,0]];
		public  var serverProcessing : Boolean = false;
		
		public function Gavanas()
		{
			findUserData();
		}
		public function findUserData():void
		{
			Common.screenProcessing = true;
			serverProcessing = true;
			//Типа ищем
			Common.screenProcessing = false;
			serverProcessing = false;
		}
		public function getUserSetting():Array // Возвращаем настройки
		{
			return _userData[1];
		}
		public function getUserCar():Array // Возвращаем машинки
		{
			return _userData[2];
		}
		public function setUserSetting(data:Array):void // Записываем данные игрока
		{
			this._userData[1] = data;
		}
		public function setUserCar(car:int):void // Записываем купленнуюмашинку
		{
			this._userData[2][car - 1] = 1; 
		}
		private function setError(_error:String):void
		{
			//_game.collectorError[0] = true;
			//_game.collectorError[1] = _error;
		}
	} 
}