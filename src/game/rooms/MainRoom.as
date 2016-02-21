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
	import game.rooms.mainroom.Race;
    import flash.utils.Timer;
    import flash.events.TimerEvent;
	
	public class MainRoom extends Room
	{	
		
		// Массив игр
		private var raceList:Array = [];
		private var raceStepY:Number = 70;
		
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
			
			/* Контейнер списока игр */
			var gameListHub:Sprite = new Sprite;
			gameListHub.x = 50;
			gameListHub.y = 300;
			addChild(gameListHub);

			// Метод добавления заезда
			function addRace():void {
				var newRace:Race = new Race;
				raceList.push(newRace);
			    
				var raceIndex:Number = raceList.length - 1;
				raceList[raceIndex].y = raceIndex * raceStepY;
				gameListHub.addChild( raceList[raceIndex] );
			}

			// Метод удаления заезда
			function removeRace():void {
				if (raceList.length) {
					var raceIndex:Number = getRaceRandom();
					gameListHub.removeChild( raceList[raceIndex] );
					trace('Remove index ', raceIndex);
					raceList.splice(raceIndex, 1);
				}
			}
			
			// Получить случайный индекс в массиве
			function getRaceRandom():Number {
				var raceIndex:Number = 0;
				var raceTotal:Number = raceList.length - 1;
				raceIndex = randomInt(raceIndex, raceTotal);
				return raceIndex;
			}
			
			// Рендомное число типа int
			function randomInt(min:Number, max:Number):Number {
			    var rand:Number = min + Math.random() * (max + 1 - min);
			    rand = Math.floor(rand);
			    return rand;
			}
			
			//  Таймер для добавления и удаления заезда
			var raceTimer:Timer = new Timer(2000);
            raceTimer.addEventListener("timer", raceTimerHandler);
            raceTimer.start();
			
			// Обработчик на таймер
			function raceTimerHandler(event:TimerEvent):void {
				trace("timerHandler");
				var raceTotal:Number = 7;
				var isAddRace:Number = randomInt(0, 1);
				
				// Если количество заездов меньше 4, принудительно создаем заезд
				if (raceList.length < 4) {
					isAddRace = 1;
				}
				
				// Если добавл
				if ( isAddRace && (raceList.length < raceTotal) ) {
					addRace();
					trace('Add');
				} else if (raceList.length > 0) {
					removeRace();
   			        trace('Remove');
				} else {
					trace('Ошибка! Не создаем и не удаляем заезды!');
				}
				
			}
			
			addRace();
			addRace();
			addRace();
			addRace();
			addRace();
			
			this.addEventListener(Event.ENTER_FRAME, enterFrameHandler);
			
		}
		
        public function enterFrameHandler(event:Event):void {
			// Расстановка заездов по строкам
			for (var raceIndex:int = 0, raceTotal:int = raceList.length; raceIndex < raceTotal; raceIndex++) {
                var newPosY:Number = ( (raceIndex * raceStepY) - raceList[raceIndex].y ) * 0.1;
				raceList[raceIndex].y += newPosY;
			}
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