package game.rooms
{
	import flash.display.Bitmap;
	import flash.events.Event;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.events.MouseEvent;
	import flash.display.Sprite;
	import flash.events.KeyboardEvent;
	import common.room.Room;
	import common.Common;
	
	public class GameRoom extends Room
	{	
		private var character:Bitmap;
		private var newFormat:TextFormat = new TextFormat();
		private var currentX:int = 0;
		private var currentY:int = 0;
		
		public function GameRoom()
		{
			addEventListener(Event.ADDED_TO_STAGE, init);
			
			[Embed(source = "../../../lib/images/back2.jpg")]
			var back:Class;
			var mainBack:Bitmap = new back();
			addChild(mainBack);
			
			[Embed(source = "../../../lib/images/exit.png")] 
			var sprite1:Class;
			var btnMainRoom:Sprite = Common.createSpr( new sprite1() );
			btnMainRoom.x = 500;
			btnMainRoom.y = 150;
			btnMainRoom.addEventListener(MouseEvent.MOUSE_DOWN, mouseDown);
			addChild(btnMainRoom);
			/*
			//Кнопка Передачи хода
			[Embed(source = "../../../lib/images/allow_walk.png")] 
			var sprite2:Class;
			var btnSendAllowWalk:Sprite = Common.createSpr( new sprite2() );
			btnSendAllowWalk.x = 500;
			btnSendAllowWalk.y = 200;
			btnSendAllowWalk.addEventListener(MouseEvent.CLICK, Common.p2pSendAllowWalkMessage);
			addChild(btnSendAllowWalk);
			
			//Кнопка Выйти из p2p комнаты
			[Embed(source = "../../../lib/images/disconnect.png")] 
			var sprite3:Class;
			var btnDisconnect:Sprite = Common.createSpr( new sprite3() );
			btnDisconnect.x = 500;
			btnDisconnect.y = 250;
			btnDisconnect.addEventListener(MouseEvent.CLICK, Common.p2pDisconnect);
			addChild(btnDisconnect);
			
			//Кнопка Отменить поиск
			[Embed(source = "../../../lib/images/cancel.png")] 
			var sprite4:Class;
			var btnCancel:Sprite = Common.createSpr( new sprite4() );
			btnCancel.x = 500;
			btnCancel.y = 300;
			btnCancel.addEventListener(MouseEvent.CLICK, Common.p2pCancel);
			addChild(btnCancel);
			*/
		}
		
		public function mouseDown(event:MouseEvent):void {
			Common.switchRoom("MainRoom");
		}

		private function init(e:Event):void
		{
			trace('Class GameRoom init');

			if (Common.p2pUsers['me'])
			{
				addChild(Common.p2pUsers['me']);
			}
			
			if (Common.p2pUsers['neighbor'])
			{
				addChild(Common.p2pUsers['neighbor']);
			}
		}
		
		override public function keyDownHandler(event:KeyboardEvent):void
		{
			if (Common.p2pCanMove)
			{
				trace('Class GameRoom keyDownHandler');
				
				var step:int = 5;
				
				switch (event.keyCode)
				{
					case 37:
						currentX-=step;
						Common.p2pSendPositionMessage(currentX, currentY);
						break;
					
					case 38:
						currentY-=step;
						Common.p2pSendPositionMessage(currentX, currentY);
						break;
					
					case 39:
						currentX+=step;
						Common.p2pSendPositionMessage(currentX, currentY);
						break;
					
					case 40:
						currentY+=step;
						Common.p2pSendPositionMessage(currentX, currentY);
						break;
				}
			}
		}
		
		private function onMouseClick(e:Event):void
		{
			trace('Class GameRoom onMouseClick');
		}
	}
}