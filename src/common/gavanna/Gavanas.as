package common.gavanna 
{
	import common.sound.SoundButtons;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.*;
	import flash.net.*;
	import common.vk.*;
	import common.Common;
	/**
	 * ...
	 * @author Gospodin.Sorokin; dimon
	 */
	public class Gavanas extends Sprite
	{
		private var _serverAlarm :int = 0;
		private var _userData  	 :Array = [[1919191919],[0,0,1],[1,0,0,0,0,0,0,0,0,0 ,0,0,0,0,0,0,0,0,0,0 ,0,0,0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0,0,0]];
		public  var serverProcessing : Boolean = false;
		private var _idd:String= "123456789";
		private var _api_id:Number;
		private var _viewer_id:String;
		private var _sid:String;
		private var _secret:String;

		
		public function Gavanas()
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
    }	

		public function init(e: Event = null): void {	
			var flashVars:Object = stage.loaderInfo.parameters as Object;
				if (flashVars.api_id) {
					_api_id = flashVars['api_id'];
					_viewer_id = flashVars['viewer_id'];
					_sid = flashVars['sid'];
					_secret = flashVars['secret'];
					Common.idd = _viewer_id;
					
				}
				findUserData();
			
		}  
		public function buyCar(carNumber:Number):void { 
			var flVars:Object = stage.loaderInfo.parameters as Object;
			var VK:APIConnection = new APIConnection(flVars);
				//serverProcessing = true;	
//добавляем три слушателя событии
					VK.addEventListener('onOrderSuccess', onSuccess); //если все прошло удачно
					VK.addEventListener('onOrderCancel', onCanc); //если пользователь отменил передачу
					VK.addEventListener('onOrderFail', onError); //если произошла ошибка
					VK.callMethod('showOrderBox', { type:'item', item:carNumber } );//вызов окна перевода голосов ;type:'item' - окно покупки товара(возможно также окно вызова офферов или окно пополнения голосов),item:'item1'- номер товара
					
					
					function onSuccess(data: Object):void
					{
						trace("Голоса переведены");
						
					}
//при отмене      
					function onCanc(data: Object):void
					{
						trace("Вы отменили перевод");
					}
//при ошибке
					function onError(data: Object):void
					{
						trace(data.error_msg);
					}	
				//
						
				//serverProcessing = false;		
						
					}
		
		public function findUserData():void
		{
			Common.screenProcessing = true;
			serverProcessing = true;
			//Типа ищем
			goPhp("fndusr");
			//Common.screenProcessing = false; //в Resload
			//serverProcessing = false;
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
			//buyCar(4); 
			this._userData[1] = data;
			//Common.screenProcessing = true;
			serverProcessing = true;
			
			//goPhp("setup");
		}
		public function setUserCar(car:int):void // Записываем купленную машинку
		{
			this._userData[2][car - 1] = 1; 
			Common.screenProcessing = true;
			serverProcessing = true;
			goPhp("carset");
		}
		private function setError(_error:String):void
		{
			//_game.collectorError[0] = true;
			//_game.collectorError[1] = _error;
		}
		
		public function goPhp(_sc:String):void {
				var phpVars:URLVariables = new URLVariables();		
				var phpFileRequest:URLRequest = new URLRequest("http://keybrdrace.myjino.ru/php/req.php");
				var phpLoader:URLLoader = new URLLoader();
				phpFileRequest.method = URLRequestMethod.POST;
				phpFileRequest.data = phpVars;
				switch (_sc) { 
					case "fndusr": 
						phpVars.sysgo = _sc;
						phpVars.uid =Common.idd;			
						phpLoader.load(phpFileRequest);
						phpLoader.addEventListener(Event.COMPLETE, Resload);
				
					break; 
					case "setup": 
						phpVars.sysgo = _sc;
						phpVars.uid =Common.idd;	
						phpVars.stp =_userData[1].join(";");
						phpLoader.load(phpFileRequest);	
						phpLoader.addEventListener(Event.COMPLETE, Resload);
					break; 	
					case "carset": 
						phpVars.sysgo = _sc;
						phpVars.uid =Common.idd;	
						phpVars.car =_userData[2].join(";");
						phpLoader.load(phpFileRequest);	
						phpLoader.addEventListener(Event.COMPLETE, Resload);
					break; 	
				}
		}
	 
	  public function Resload (event:Event):void {
		var _queryStr:String = "" + event.target.data;
		var _param:Array; 
		var _per:int;
		if (_queryStr=="err") {
			trace("Ахтунг! Ашыбка сервераааа!!!");// 
		}
		if (_queryStr=="noup") {
			trace("ашыбка, или запись совпадает");// 
		}
		else{
			_param = _queryStr.split("+",43); 
			_idd = _param[0];
			_userData[0] = _param[0];
			_userData[1]=_param[1].split(",",3);
			_userData[2] = _param[2].split(",", 40);
			Common.envOn = _userData[1][0];
			Common.sfxOn = _userData[1][1];
			
		 }
		 trace(_userData[1][1]);
		 Common.screenProcessing = false;
		 serverProcessing = false;
		
	 }
	 
	} 
}