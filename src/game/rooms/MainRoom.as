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
	import game.rooms.mainroom.WaitPlayer;
	
	public class MainRoom extends Room
	{	
		
		// Массив игр
		private var raceList:Array = [];
		private var raceStepY:Number = 70;
		private var raceTotal:Number = 7;	
		private var loadingHub:Sprite;
		
		// Формат текста для надписи готовы
		private var formatReadyText:TextFormat = new TextFormat();
		
		//  Таймер для добавления поиска нового клиента для заезда
		private var addNewPlayeTimer:Timer = new Timer(2500);

		public function MainRoom()
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
                waitPlayers();
				//Common.switchRoom("GameRoom");
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
			gameListHub.x = 30;
			gameListHub.y = 250;
			addChild(gameListHub);

			function enterRace(event:MouseEvent):void {
				// Послать список машин
                waitPlayers();
				
				// послать номер заезда что бы удалить его из списка
				removeRace(0);
			}
			
			// Метод добавления заезда
			// Первым делом нужно брать из кучи удаленных заездов что бы не создавать новые заезды а брать старые
			function addRace():void {
				//var isAddRace:int = randomInt(0, 1);
				var isAddRace:int = 1;
				
				if ( isAddRace && (raceList.length < raceTotal) ) {
					var newRace:Race = new Race;
					raceList.push(newRace);
					
					var raceIndex:Number = raceList.length - 1;
					raceList[raceIndex].y = 0;
					raceList[raceIndex].addEventListener(MouseEvent.MOUSE_DOWN, enterRace);
					raceList[raceIndex].addEventListener(MouseEvent.MOUSE_OVER, onMouseOverGameCreateText);
					raceList[raceIndex].addEventListener(MouseEvent.MOUSE_OUT, onMouseOutGameCreateText);
					//raceList[raceIndex].y = raceStepY;
					gameListHub.addChild( raceList[raceIndex] );
				}
			}


			
			// Метод удаления заезда
			// Первым делом необходимо добавить занесение удаленных игр в общую кучу для того что бы потом брать из нее при создании нового заезда
			function removeRace(numRace:Number):void {
				if (raceList.length) {
					// Рендомно выбираем заезд для удаления
					//var raceIndex:Number = getRaceRandom();
					
					var raceIndex:Number = numRace;
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
			
			//  Таймер для добавления машины в заезд
			var addCarTimer:Timer = new Timer(1000);
            addCarTimer.addEventListener("timer", addCarTimerHandler);
            addCarTimer.start();
			
			function addCarTimerHandler(event:TimerEvent):void {
				if (raceList.length) {
					var isAdd:int = randomInt(0, 1);
					
					if (isAdd) {
						var randomRace:int = randomInt(0, (raceList.length - 1) );
						trace('randomRace = ', randomRace);
						
						if (raceList[randomRace]) {
							var raceCountCar:int = raceList[randomRace].addCar();
							
							if ( raceCountCar >= 6 || (randomInt(0, 100) < 10 ) ) {
								removeRace(randomRace);
							}
						}
					}
				}
			}
			
			//  Таймер для добавления и удаления заезда
			var raceTimer:Timer = new Timer(3000);
            raceTimer.addEventListener("timer", raceTimerHandler);
            raceTimer.start();
			
			// Обработчик на таймер
			function raceTimerHandler(event:TimerEvent):void {
				trace("timerHandler");
				//var isAddRace:Number = 1;
				
				// Только добавляем заезды
				var isAddRace:Number = randomInt(1, 30);
				
				if ( (isAddRace > 9 && isAddRace < 11) || (raceList.length > 6) ) {
					isAddRace = 0;
				}
				
				// Если количество заездов меньше 4, принудительно создаем заезд
				if (raceList.length < 4) {
					isAddRace = 1;
				}
				
				/*
				if ( isAddRace && (raceList.length < raceTotal) ) {
					addRace();
					trace('Add');
				}
				*/
				
				
				// Если добавляем
				if ( isAddRace && (raceList.length < raceTotal) ) {
					addRace();
					trace('Add');
				} else if (raceList.length > 1 && isAddRace == 0) {
					var randomRace:int = randomInt( 0, (raceList.length - 1) );
					removeRace(randomRace);
   			        trace('Remove');
				}
				
				
			}
			
			// Создаем заезды по умолчанию
			var countCrateRace:int = randomInt(3, 15);
			trace('countCrateRace = ', countCrateRace);
			if (countCrateRace) {
				for (var raceIndex:int = 0; raceIndex < countCrateRace; raceIndex++) {
					addRace();
				}
			}
			
			this.addEventListener(Event.ENTER_FRAME, enterFrameHandler);
		}

		// Рендомное число типа int
		private function randomInt(min:Number, max:Number):Number {
			var rand:Number = min + Math.random() * (max + 1 - min);
			rand = Math.floor(rand);
			return rand;
		}
		
		// Анимация ожидания игроков
        private function waitPlayers():void {
			// Контейнер ожидания
			var wait:Sprite = new Sprite();
			addChild(wait);
			
			// Задний фон
			var bg:Sprite = new Sprite();
			bg.graphics.beginFill(0);
			bg.graphics.drawRect(0, 0, 800, 850);
			bg.graphics.endFill();
			bg.alpha = 0.2;
			wait.addChild(bg);
			
			// Спрайт карты
			[Embed(source = "../../../lib/images/map.jpg")] 
			var mapClass:Class;
			var map:Sprite = Common.createSpr( new mapClass() );
			map.x = 100;
			map.y = 265;
            wait.addChild(map);
			
			// Анимация ожидания
			loadingHub = new Sprite;
			loadingHub.x = 320;
			loadingHub.y = 280;
            wait.addChild(loadingHub);
			[Embed(source = "../../../lib/images/350.png")] 
			var loadingClass:Class;
			var loading:Sprite = Common.createSpr( new loadingClass() );
			loading.x = -10;
			loading.y = -10;
            loadingHub.addChild(loading);
			
			// Отмена ожидания
			[Embed(source = "../../../lib/images/cancel.png")] 
			var cancalRaceClass:Class;
			var cancalRace:Sprite = Common.createSpr( new cancalRaceClass() );
			cancalRace.x = 680;
			cancalRace.y = 240;
			cancalRace.addEventListener(MouseEvent.MOUSE_DOWN, onCancelRace);
			cancalRace.addEventListener(MouseEvent.MOUSE_OVER, onMouseOverCancalRace);
			cancalRace.addEventListener(MouseEvent.MOUSE_OUT,onMouseOutCancalRace);
			wait.addChild(cancalRace);
			function onMouseOverCancalRace(event:MouseEvent):void
			{
				Mouse.cursor = MouseCursor.BUTTON;
			}
			function onMouseOutCancalRace(event:MouseEvent):void
			{
				Mouse.cursor = MouseCursor.AUTO;
			}
			function onCancelRace():void {
				addNewPlayeTimer.removeEventListener("timer", addNewPlayerHandler);
				addNewPlayeTimer.stop();
				removeChild(wait);
			}
			
			// Спрайт на ожидание игроков
			var player1:WaitPlayer =  new WaitPlayer;
			player1.x = 305;
			player1.y = 400;
			player1.on();
            wait.addChild(player1);
			
			var player2:WaitPlayer =  new WaitPlayer;
			player2.x = 340;
			player2.y = 400;
			player2.off();
            wait.addChild(player2);
			
			var player3:WaitPlayer =  new WaitPlayer;
			player3.x = 375;
			player3.y = 400;
			player3.off();
            wait.addChild(player3);
			
			var player4:WaitPlayer =  new WaitPlayer;
			player4.x = 410;
			player4.y = 400;
			player4.off();
            wait.addChild(player4);
			
			var player5:WaitPlayer =  new WaitPlayer;
			player5.x = 445;
			player5.y = 400;
			player5.off();
            wait.addChild(player5);
			
			var player6:WaitPlayer =  new WaitPlayer;
			player6.x = 480;
			player6.y = 400;
			player6.off();
            wait.addChild(player6);

			var findPlayerCurr:int = 1;			
			addNewPlayeTimer.addEventListener("timer", addNewPlayerHandler);
			
			// Надпись готовы
			var readyText:TextField = new TextField();
			readyText.text = 'Готовы: ' + findPlayerCurr + '/6';
			readyText.setTextFormat(formatReadyText);
			readyText.width = 150;
			readyText.height = 30;
            readyText.x = 360;
			readyText.y = 430;
			wait.addChild(readyText);

			// Надпись ожидание
			var waitText:TextField = new TextField();
			waitText.text = 'Ожидание игроков';
			waitText.setTextFormat(formatReadyText);
			waitText.width = 200;
			waitText.height = 30;
            waitText.x = 339;
			waitText.y = 270;
			wait.addChild(waitText);
			
			// Добавление изображения нового пользователя на карте
			[Embed(source = "../../../lib/images/player_on.png")] 
			var playerClass:Class;
			// Добавление изображения нового пользователя на карте
			var playerMap2:Sprite = Common.createSpr( new playerClass() );
			playerMap2.scaleX = 0.5;
			playerMap2.scaleY = 0.5;
			playerMap2.x = 100;
			playerMap2.y = 265;
			playerMap2.alpha = 0;
			wait.addChild(playerMap2);
			
			// Добавление изображения нового пользователя на карте
			var playerMap3:Sprite = Common.createSpr( new playerClass() );
			playerMap3.scaleX = 0.5;
			playerMap3.scaleY = 0.5;
			playerMap3.x = 100;
			playerMap3.y = 265;
			playerMap3.alpha = 0;
			wait.addChild(playerMap3);
			
			// Добавление изображения нового пользователя на карте
			var playerMap4:Sprite = Common.createSpr( new playerClass() );
			playerMap4.scaleX = 0.5;
			playerMap4.scaleY = 0.5;
			playerMap4.x = 100;
			playerMap4.y = 265;
			playerMap4.alpha = 0;
			wait.addChild(playerMap4);
			
			// Добавление изображения нового пользователя на карте
			var playerMap5:Sprite = Common.createSpr( new playerClass() );
			playerMap5.scaleX = 0.5;
			playerMap5.scaleY = 0.5;
			playerMap5.x = 100;
			playerMap5.y = 265;
			playerMap5.alpha = 0;
			wait.addChild(playerMap5);
			
			// Добавление изображения нового пользователя на карте
			var playerMap6:Sprite = Common.createSpr( new playerClass() );
			playerMap6.scaleX = 0.5;
			playerMap6.scaleY = 0.5;
			playerMap6.x = 100;
			playerMap6.y = 265;
			playerMap6.alpha = 0;
			wait.addChild(playerMap6);

			/*
			var playerMap7:Sprite = Common.createSpr( new playerClass() );
			playerMap7.scaleX = 0.5;
			playerMap7.scaleY = 0.5;
			playerMap7.x = 400;
			playerMap7.y = 315;
			wait.addChild(playerMap7);

			var playerMap8:Sprite = Common.createSpr( new playerClass() );
			playerMap8.scaleX = 0.5;
			playerMap8.scaleY = 0.5;
			playerMap8.x = 560;
			playerMap8.y = 390;
			wait.addChild(playerMap8);
			*/
			
			function addNewPlayerHandler():void {
				switch (findPlayerCurr) { 
					case 1: 
						player1.on();
						break; 
					case 2: 
						player2.on();
						playerMap2.x = randomInt(400, 560);
						playerMap2.y = randomInt(315, 390);
						playerMap2.alpha = 1;
						break; 
					case 3: 
						player3.on();
						playerMap3.x = randomInt(400, 560);
						playerMap3.y = randomInt(315, 390);
						playerMap3.alpha = 1;
						break; 
					case 4: 
						player4.on();
						playerMap4.x = randomInt(400, 560);
						playerMap4.y = randomInt(315, 390);
						playerMap4.alpha = 1;
						break; 
					case 5: 
						player5.on();
						playerMap5.x = randomInt(400, 560);
						playerMap5.y = randomInt(315, 390);
						playerMap5.alpha = 1;
						break; 
					case 6: 
						player6.on();
						playerMap6.x = randomInt(400, 560);
						playerMap6.y = randomInt(315, 390);
						playerMap6.alpha = 1;
						addNewPlayeTimer.delay = 500;
						break; 
					case 7: 
						addNewPlayeTimer.removeEventListener("timer", addNewPlayerHandler);
						addNewPlayeTimer.stop();
						waitPlayersHide();
						break; 
					default : 
						trace("switch default"); 
				}
				
				if (findPlayerCurr < 6) {
					var delay:int = randomInt(500, 3000);
					addNewPlayeTimer.delay = delay;
				}
				
				readyText.text = 'Готовы: ' + findPlayerCurr + '/6';
				readyText.setTextFormat(formatReadyText);
				findPlayerCurr++;

			}
			
			// Скрыть анимацию ожидания игроков
			function waitPlayersHide():void {
				removeChild(wait);
				Common.switchRoom("GameRoom");
			}
			
			addNewPlayeTimer.start();
        }
		
        public function enterFrameHandler(event:Event):void {
			// Расстановка заездов по строкам
			for (var raceIndex:int = 0, raceTotal:int = raceList.length; raceIndex < raceTotal; raceIndex++) {
                var newPosY:Number = ( ( (raceTotal - raceIndex) * raceStepY) - raceList[raceIndex].y ) * 0.1;
				raceList[raceIndex].y += newPosY;
			}
			
			if (loadingHub) {
				loadingHub.rotation += 15;
				
				if (loadingHub.rotation > 360) {
					loadingHub.rotation -= 360;
				}
			}
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