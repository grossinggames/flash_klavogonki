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
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.ui.*;
	
	public class GameRoom extends Room
	{	
		private var character:Bitmap;
		private var newFormat:TextFormat = new TextFormat();
		private var currentX:int = 0;
		private var currentY:int = 0;
		
		// Формат текста для надписи готовы
		private var formatReadyText:TextFormat = new TextFormat();
		
		public function GameRoom()
		{
			
			addEventListener(Event.ADDED_TO_STAGE, init);

			// Формат текста для меню
			var formatText:TextFormat = new TextFormat();
			formatText.font = 'Arial';
			formatText.size = 18;
			
			// Формат текста для надписи готовы
			formatReadyText.font = 'Arial';
			formatReadyText.size = 16;
			formatReadyText.color = 0xFFFFFF;

			/* Быстрый страт */
			// Колесо
			[Embed(source = "../../../lib/images/wheel.gif")] 
			var wheelClass:Class;
			var wheel:Sprite = Common.createSpr( new wheelClass() );
			wheel.x = 10;
			wheel.y = 10;
			addChild(wheel);
			wheel.addEventListener(MouseEvent.MOUSE_OVER, onMouseOverWheelText);
			wheel.addEventListener(MouseEvent.MOUSE_OUT,onMouseOutWheelText);
			wheel.addEventListener(MouseEvent.MOUSE_DOWN, mouseDown);
			
			// Быстрый старт
			var wheelText:TextField = new TextField();
			wheelText.text = 'Быстрый старт';
			wheelText.setTextFormat(formatText);
			wheelText.width = 150;
			wheelText.height = 30;
            wheelText.x = 60;
			wheelText.y = 220;
			addChild(wheelText);
			wheelText.addEventListener(MouseEvent.MOUSE_OVER, onMouseOverWheelText);
			wheelText.addEventListener(MouseEvent.MOUSE_OUT, onMouseOutWheelText);
			wheelText.addEventListener(MouseEvent.MOUSE_DOWN, mouseDown);
			function onMouseOverWheelText(event:MouseEvent):void
			{
				Mouse.cursor = MouseCursor.BUTTON;
			}
			function onMouseOutWheelText(event:MouseEvent):void
			{
				Mouse.cursor = MouseCursor.AUTO;
			}
			function mouseDown(event:MouseEvent):void {
			}

			
			/* Список игр */
			/*
			[Embed(source = "../../../lib/images/icon-gamelist.gif")] 
			var gamelistClass:Class;
			var gamelist:Sprite = Common.createSpr( new gamelistClass() );
			gamelist.x = 310;
			gamelist.y = 10;
			addChild(gamelist);
			gamelist.addEventListener(MouseEvent.MOUSE_OVER, onMouseOverGameListText);
			gamelist.addEventListener(MouseEvent.MOUSE_OUT, onMouseOutGameListText);
			gamelist.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDownGameListText);
					
			// Выбрать заезд
			var gamelistText:TextField = new TextField();
			gamelistText.text = 'Выбрать заезд';
			gamelistText.setTextFormat(formatText);
			gamelistText.width = 150;
			gamelistText.height = 30;
            gamelistText.x = 350;
			gamelistText.y = 220;
			addChild(gamelistText);
			gamelistText.addEventListener(MouseEvent.MOUSE_OVER, onMouseOverGameListText);
			gamelistText.addEventListener(MouseEvent.MOUSE_OUT, onMouseOutGameListText);
			gamelistText.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDownGameListText);
			function onMouseOverGameListText(event:MouseEvent):void
			{
				Mouse.cursor = MouseCursor.BUTTON;
			}
			function onMouseOutGameListText(event:MouseEvent):void
			{
				Mouse.cursor = MouseCursor.AUTO;
			}
			function onMouseDownGameListText(event:MouseEvent):void
			{
				Common.switchRoom("MainRoom");
			}
			*/			
			
			/* Создать игру */
			/*
			[Embed(source = "../../../lib/images/icon-create.gif")] 
			var gamecreateClass:Class;
			var gamecreate:Sprite = Common.createSpr( new gamecreateClass() );
			gamecreate.x = 570;
			gamecreate.y = 10;
			addChild(gamecreate);
			gamecreate.addEventListener(MouseEvent.MOUSE_OVER, onMouseOverGameCreateText);
			gamecreate.addEventListener(MouseEvent.MOUSE_OUT,onMouseOutGameCreateText);
			
			// Своя игра
			var gamecreateText:TextField = new TextField();
			gamecreateText.text = 'Своя игра';
			gamecreateText.setTextFormat(formatText);
			gamecreateText.width = 150;
			gamecreateText.height = 30;
            gamecreateText.x = 645;
			gamecreateText.y = 220;
			addChild(gamecreateText);
			gamecreateText.addEventListener(MouseEvent.MOUSE_OVER, onMouseOverGameCreateText);
			gamecreateText.addEventListener(MouseEvent.MOUSE_OUT,onMouseOutGameCreateText);
			*/
			function onMouseOverGameCreateText(event:MouseEvent):void
			{
				Mouse.cursor = MouseCursor.BUTTON;
			}
			function onMouseOutGameCreateText(event:MouseEvent):void
			{
				Mouse.cursor = MouseCursor.AUTO;
			}

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