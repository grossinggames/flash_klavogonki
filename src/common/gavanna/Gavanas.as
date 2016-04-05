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
		private var _idd:String= "123456789";
		
		public function Gavanas()
		{
			
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		public function init(e: Event = null): void {	
			var flashVars: Object = stage.loaderInfo.parameters as Object;
			if (flashVars.api_id) {
				_idd=(flashVars['viewer_id']);
			}
			findUserData();
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
			this._userData[1] = data;
			Common.screenProcessing = true;
			serverProcessing = true;
			goPhp("setup");
		}
		public function setUserCar(car:int):void // Записываем купленнуюмашинку
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
				var phpFileRequest:URLRequest = new URLRequest("http://dimidrolg.myjino.ru/pehepe/req.php");
				var phpLoader:URLLoader = new URLLoader();
				phpFileRequest.method = URLRequestMethod.POST;
				phpFileRequest.data = phpVars;
				switch (_sc) { 
					case "fndusr": 
						phpVars.sysgo = _sc;
						phpVars.uid = _idd;			
						phpLoader.load(phpFileRequest);
						phpLoader.addEventListener(Event.COMPLETE, Resload);
				
					break; 
					case "setup": 
						phpVars.sysgo = _sc;
						phpVars.uid = _idd;	
						phpVars.stp =_userData[1].join(";");
						phpLoader.load(phpFileRequest);	
						phpLoader.addEventListener(Event.COMPLETE, Resload);
					break; 	
					case "carset": 
						phpVars.sysgo = _sc;
						phpVars.uid = _idd;	
						phpVars.car =_userData[2].join(";");
						phpLoader.load(phpFileRequest);	
						phpLoader.addEventListener(Event.COMPLETE, Resload);
					break; 	
				}
		}
	 
	  public function Resload (event:Event):void {
		var _queryStr:String = "" + event.target.data;
		var _param:Array; 
		if (_queryStr=="err") {
			trace("Ахтунг! Ашыбка сервераааа!!!");// 
		}
		if (_queryStr=="noup") {
			trace("ашыбка, или запись совпадает");// 
		}
		else{
			_param = _queryStr.split("+",43); 
			_userData[0]=_param[0];
			_userData[1]=_param[1].split(";",3);
			_userData[2]=_param[2].split(";",40);
		 }
		 trace(_userData);
		 Common.screenProcessing = false;
		 serverProcessing = false;
	 }
	 
	} 
}