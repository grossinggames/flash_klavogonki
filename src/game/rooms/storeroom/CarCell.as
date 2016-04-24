package game.rooms.storeroom 
{
	import common.car.Car;
	import common.Common;
	import flash.ui.*;
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.events.MouseEvent;
	
	//import common.events.AppGavannaEvent;
	/**
	 * ...
	 * @author baton; Gospodin.Sorokin
	 */
	public class CarCell extends Sprite
	{
		private var type:Number = 0;
		private var description:String = "Название машины по умолчанию";
		private var price:int = 0;
		
		public function CarCell(car:Car) 
		{
			// Добавить машину в отображение
			type = car.type;
			description = car.description;
			price = car.price;
			
			addChild(car);
			addNameCar();
			addPriceCar();
			addBuyCar();
		}
		
		private function addNameCar():void {
			// Формат текста
			var formatText:TextFormat = new TextFormat();
			formatText.font = 'Arial';
			formatText.size = 13;
			formatText.bold = true;
			
			var carText:TextField = new TextField();
			carText.text = description;
			carText.setTextFormat(formatText);
			carText.width = 150;
			carText.height = 60;
            carText.x = 5;
			carText.y = -30;
			carText.selectable = false;
			addChild(carText);
		}
		
		private function addPriceCar():void {
			// Формат текста
			var formatText:TextFormat = new TextFormat();
			formatText.font = 'Arial';
			formatText.size = 14;
			
			var carText:TextField = new TextField();
			carText.text = price + " Голосов";
			if (price < 1) 
			{
				carText.text = "  Бесплатно";
			}
			carText.setTextFormat(formatText);
			carText.width = 150;
			carText.height = 30;
            carText.x = 10;
			carText.y = 55;
			carText.selectable = false;
			addChild(carText);
		}

		private function addBuyCar():void {
			/* Купить */
			// Если цена 0 то ставить кнопку "выбрать" иначе ставить "купить"
			if (price < 1) 
			{
				[Embed(source = "../../../../lib/images/select.png")] 
				var selectCarClass:Class;
				var selectCar:Sprite = Common.createSpr( new selectCarClass() );
				selectCar.x = 20;
				selectCar.y = 90;
				addChild(selectCar);
				selectCar.addEventListener(MouseEvent.MOUSE_OVER, onMouseOverBuyCar);
				selectCar.addEventListener(MouseEvent.MOUSE_OUT,onMouseOutBuyCar);
				selectCar.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDownBuyCar);

			}
			else 
			{
				[Embed(source = "../../../../lib/images/buy.png")] 
				var buyCarClass:Class;
				var buyCar:Sprite = Common.createSpr( new buyCarClass() );
				buyCar.x = 20;
				buyCar.y = 90;
				addChild(buyCar);
				buyCar.addEventListener(MouseEvent.MOUSE_OVER, onMouseOverBuyCar);
				buyCar.addEventListener(MouseEvent.MOUSE_OUT,onMouseOutBuyCar);
				buyCar.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDownBuyCar);
			}

			
			function onMouseOverBuyCar(event:MouseEvent):void
			{
				Mouse.cursor = MouseCursor.BUTTON;
			}
			function onMouseOutBuyCar(event:MouseEvent):void
			{
				Mouse.cursor = MouseCursor.AUTO;
			}
			
			// Купить автомобиль
			function onMouseDownBuyCar(event:MouseEvent):void 
			{
				if (price > 0) {
					trace('Купить автомобиль: ' + type);
				} else {
					trace('Выбрать автомобиль: ' + type);
				}
				
				//Common.server.addEventListener(AppGavannaEvent.COMPLETE, gavannaCompleteHandler);
				//Common.server.Please("SetCar", type);
			}
			
			//function gavannaCompleteHandler(e:AppGavannaEvent):void {
			//	
			//}
		}
	}

}