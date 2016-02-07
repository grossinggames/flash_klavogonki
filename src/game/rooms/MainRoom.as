package game.rooms
{
	import flash.display.*;	
	import flash.display.Bitmap;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.events.Event;
	import flash.display.Sprite;
	import flash.ui.*;
	import flash.events.MouseEvent;
	import flash.net.URLRequest;
	import flash.events.KeyboardEvent;
	import common.room.Room;
	import flash.display.Sprite;
	import common.Common;

	
	public class MainRoom extends Room
	{	
		public function MainRoom()
		{
			addEventListener(Event.ADDED_TO_STAGE, init);

			// Формат текста
			var formatText:TextFormat = new TextFormat();
			formatText.font = 'Arial';
			formatText.size = 18;
			
			
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
			wheelText.addEventListener(MouseEvent.MOUSE_OUT,onMouseOutWheelText);
			function onMouseOverWheelText(event:MouseEvent):void
			{
				Mouse.cursor = MouseCursor.BUTTON;
			}
			function onMouseOutWheelText(event:MouseEvent):void
			{
				Mouse.cursor = MouseCursor.AUTO;
			}

			
			/* Список игр */
			[Embed(source = "../../../lib/images/icon-gamelist.gif")] 
			var gamelistClass:Class;
			var gamelist:Sprite = Common.createSpr( new gamelistClass() );
			gamelist.x = 310;
			gamelist.y = 10;
			addChild(gamelist);
			gamelist.addEventListener(MouseEvent.MOUSE_OVER, onMouseOverGameListText);
			gamelist.addEventListener(MouseEvent.MOUSE_OUT,onMouseOutGameListText);
					
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
			gamelistText.addEventListener(MouseEvent.MOUSE_OUT,onMouseOutGameListText);
			function onMouseOverGameListText(event:MouseEvent):void
			{
				Mouse.cursor = MouseCursor.BUTTON;
			}
			function onMouseOutGameListText(event:MouseEvent):void
			{
				Mouse.cursor = MouseCursor.AUTO;
			}
			
			
			/* Создать игру */
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
			function onMouseOverGameCreateText(event:MouseEvent):void
			{
				Mouse.cursor = MouseCursor.BUTTON;
			}
			function onMouseOutGameCreateText(event:MouseEvent):void
			{
				Mouse.cursor = MouseCursor.AUTO;
			}
			
			/*
			[Embed(source = "../../../lib/images/play.png")] 
			var sprite1:Class;
			var btnMainRoom:Sprite = Common.createSpr( new sprite1() );
			btnMainRoom.x = 500;
			btnMainRoom.y = 150;
			btnMainRoom.addEventListener(MouseEvent.MOUSE_DOWN, mouseDown);
			addChild(btnMainRoom);
			*/
			
		}
		
		public function mouseDown(event:MouseEvent):void {
			//Common.p2pConnect();
			Common.switchRoom("GameRoom");
		}
		
		private function init(e:Event):void
		{
			trace('Class MainRoom init');
		}

		private function onMouseClick(e:Event):void
		{
			trace('Class MainRoom onMouseClick');
		}
	}
}