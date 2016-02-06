package common
{
	/**
	 * ...
	 * @author baton
	 */
	
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.display.Bitmap;
	import common.spr.Spr;
	import common.room.Room;
	import common.room.RoomHub;
	import common.room.ControllerRoom;
	import common.sound.Sound;
	import common.lock.Lock;
	import common.p2p.P2PCommon;
	import flash.events.Event;

	public class Common extends Sprite
	{
		public function Common()
		{
			trace('Common');
		}
		
		// controllerRoom
		private static var controllerRoom:ControllerRoom = new ControllerRoom;
		
		public static function createRoom(room:Room, name:String):void
		{
			trace('Common createRoom');
			controllerRoom.createRoom(room, name);
		}
		
		public static function switchRoom(room:String):void
		{
			trace('Common switchRoom');
			controllerRoom.switchRoom(room);
		}
		
		public static function get currentRoom():String
		{
			trace('Common currentRoom' );
			return controllerRoom.currentRoom;
		}

		public static function get previousRoom():String
		{
			trace('Common previousRoom');
			return controllerRoom.previousRoom;
		}

		public static function get roomField():RoomHub
		{
			trace('Common roomField' );
			return controllerRoom.roomField;
		}
		
		// Spr
		public static function createSpr(img:Bitmap):Sprite
		{
			trace('Common createSpr' );
			
			var spr:Spr = new Spr(img);
			return spr;
		}
		
		// Sound
		private static var sound:Sound = new Sound;

		public static function soundPlay(snd:String):void
		{
			trace('Common soundPlay' );
			sound.play(snd);
		}
		
		public static function soundStop(snd:String):void
		{
			trace('Common soundPlay' );
			sound.stop(snd);
		}
		
		public static function soundStopAll():void
		{
			trace('Common soundPlay' );
			sound.stopAll();
		}

		// Lock
		private static var lock:Lock = new Lock;

		public static function lockApp(value:Number):void
		{
			trace('Common Lock' );
			lock.lockApp(value);
		}
		
		// P2P
		private static var p2p:P2PCommon = new P2PCommon;

		public static function p2pConnect():void
		{
			trace('Common p2pConnect' );
			p2p.connect();
		}

		public static function p2pDisconnect(event:Event):void
		{
			trace('Common p2pDisconnect' );
			p2p.disconnect();
		}
		
		public static function p2pCancel(event:Event):void
		{
			trace('Common p2pCancel' );
			p2p.cancelGame();
		}

		public static function get p2pCanMove():Boolean
		{
			return p2p.canMove;
		}
		
		public static function p2pSendPositionMessage(currentX:int, currentY:int):void
		{
			trace('Common p2pSendPositionMessage' );
			p2p.sendPositionMessage(currentX, currentY);
		}

		public static function p2pSendAllowWalkMessage(event:Event):void
		{
			trace('Common p2pSendAllowWalkMessage' );
			p2p.sendAllowWalkMessage();
		}
		
		public static function get p2pUsers():Object
		{
			trace('Common p2pUsers' );
			return p2p.users;
		}
	}
}