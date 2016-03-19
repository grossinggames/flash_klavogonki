package common
{
	/**
	 * ...
	 * @author baton
	 */
	
	import common.query.Query;
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.display.Bitmap;
	import common.spr.Spr;
	import common.room.Room;
	import common.room.RoomHub;
	import common.room.ControllerRoom;
	import common.sound.Sound;
	import common.lock.Lock;
	import common.car.Car;
	import common.p2p.P2PCommon;
	import flash.events.Event;

	public class Common extends Sprite
	{
		public function Common()
		{
			//trace('Common');
		}
		
		// controllerRoom
		private static var controllerRoom:ControllerRoom = new ControllerRoom;
		
		// Список машин
		public static var cars:Array = [];
		
		// Включен ENV
		public static var envOn:int = 1;

		// Включены SFX
		public static var sfxOn:int = 1;
		
		public static function createRoom(room:Room, name:String):void
		{
			//trace('Common createRoom');
			controllerRoom.createRoom(room, name);
		}
		
		public static function switchRoom(room:String):void
		{
			//trace('Common switchRoom');
			controllerRoom.switchRoom(room);
		}
		
		public static function get currentRoom():String
		{
			//trace('Common currentRoom' );
			return controllerRoom.currentRoom;
		}

		public static function get previousRoom():String
		{
			//trace('Common previousRoom');
			return controllerRoom.previousRoom;
		}

		public static function get roomField():RoomHub
		{
			//trace('Common roomField' );
			return controllerRoom.roomField;
		}
		
		// Spr
		public static function createSpr(img:Bitmap):Sprite
		{
			//trace('Common createSpr' );
			
			var spr:Spr = new Spr(img);
			return spr;
		}
		
		// Sound
		private static var sound:Sound = new Sound;

		public static function soundPlay(snd:String):void
		{
			//trace('Common soundPlay' );
			sound.play(snd);
		}
		
		public static function soundStop(snd:String):void
		{
			//trace('Common soundPlay' );
			sound.stop(snd);
		}
		
		public static function soundStopAll():void
		{
			//trace('Common soundPlay' );
			sound.stopAll();
		}
		
		public static function soundOnEnv():void
		{
			envOn = 1;
		}

		public static function soundOffEnv():void
		{
			envOn = 0;
			sound.stopEnvs();
		}
		
		public static function soundOnSfx():void
		{
			sfxOn = 1;
		}
		
		public static function soundOffSfx():void
		{
			sfxOn = 0;
			sound.stopSfxs();
		}
		
		// Lock
		private static var lock:Lock = new Lock;

		public static function lockApp(value:Number):void
		{
			//trace('Common Lock' );
			lock.lockApp(value);
		}

		/* Получить автомобиль. Если параметр задан вернет указанный авто. Если параметр отстутствует - вернет рендомный авто */
		public static function getCar(number:Number = 0):Car
		{
			//trace('Common get car' );
			return new Car(number);
		}
		
		// Запрос
		private static var qr:Query = new Query;

		public static function query(typeQuery:String, param:int):void
		{
			// trace('Common Query' );
			
			switch (typeQuery) { 
				case "buyCar": 
					qr.buyCar(param);
					break; 
				case "type": 
					// Что то делаем
					break;
			}
		}
		
	}
}