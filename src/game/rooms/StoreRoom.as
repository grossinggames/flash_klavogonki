package game.rooms
{
	import common.car.Car;
	import common.room.Room;
	import common.*;
	import flash.display.LineScaleMode;
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	public class StoreRoom extends Room
	{	
		private var cars:Array = [
		[1,  2,  3,  4,  5 ],
		[6,  7,  8,  9,  10],
		[11, 12, 13, 14, 15],
		[16, 17, 18, 19, 20],
		[21, 22, 23, 24, 25],
		[26, 27, 28, 29, 30],
		[31, 32, 33, 34, 35],
		[36, 37, 38, 39, 40]
		];
		private var carHub:Sprite = new Sprite;
		
		// Формат текста для надписи готовы
		private var formatText:TextFormat = new TextFormat();
		
		public function StoreRoom()
		{
			createCars(); // Создать автомобили
			addTextStore(); // Добавить текст "Магазин"
        }

		private function addTextStore():void {
			// Формат текста для меню
			formatText.font = 'Arial';
			formatText.size = 18;
			formatText.color = 0x0099FF;
			
			var storeText:TextField = new TextField();
			storeText.text = 'Магазин';
			storeText.setTextFormat(formatText);
			storeText.width = 150;
			storeText.height = 30;
            storeText.x = 365;
			storeText.y = 50;
			addChild(storeText);
		}
		
		private function createCars():void {
			addChild(carHub);
			carHub.x = 50;
			carHub.y = 200;
			
			for (var i:Number = 0; i < 8; i++) { 
				for (var j:Number = 0; j < 5; j++) { 
					cars[ i ][ j ] = Common.getCar(cars[ i ][ j ]);
					carHub.addChild(cars[ i ][ j ]);
					cars[ i ][ j ].x = j * 150;
					cars[ i ][ j ].y = i * 200;
				}
			}
		}
		
		override public function open():void {
			trace('Class StoreRoom Open');
		}
	}
}