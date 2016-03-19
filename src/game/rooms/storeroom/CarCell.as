package game.rooms.storeroom 
{
	import common.car.Car;
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	/**
	 * ...
	 * @author baton
	 */
	public class CarCell extends Sprite
	{
		public function CarCell(car:Car) 
		{
			// Добавить машину в отображение
			addChild(car);
			addNameCar(car.type);
			addPriceCar(car.type);
		}
		
		private function addNameCar(num:Number) {
			// Формат текста
			var formatText:TextFormat = new TextFormat();
			formatText.font = 'Arial';
			formatText.size = 14;
			
			var carText:TextField = new TextField();
			carText.text = 'Машина номер ' + num;
			carText.setTextFormat(formatText);
			carText.width = 150;
			carText.height = 30;
            //carText.x = 365;
			carText.y = -50;
			addChild(carText);
		}
		
		private function addPriceCar(numCar:Number) {
			// Формат текста
			var formatText:TextFormat = new TextFormat();
			formatText.font = 'Arial';
			formatText.size = 14;
			
			var carText:TextField = new TextField();
			carText.text = 'Цена машины ' + numCar;
			carText.setTextFormat(formatText);
			carText.width = 150;
			carText.height = 30;
            //carText.x = 365;
			carText.y = 60;
			addChild(carText);
		}
		
	}

}