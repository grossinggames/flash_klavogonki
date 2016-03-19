package game.rooms.storeroom 
{
	import common.car.Car;
	import common.Common;
	import flash.ui.*;
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author baton
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
			formatText.size = 14;
			
			var carText:TextField = new TextField();
			carText.text = description;
			carText.setTextFormat(formatText);
			carText.width = 150;
			carText.height = 30;
            carText.x = 15;
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
			carText.text = price + " Голос";
			carText.setTextFormat(formatText);
			carText.width = 150;
			carText.height = 30;
            carText.x = 20;
			carText.y = 55;
			carText.selectable = false;
			addChild(carText);
		}

		private function addBuyCar():void {
			/* Купить */
			[Embed(source = "../../../../lib/images/buy.png")] 
			var buyCarClass:Class;
			var buyCar:Sprite = Common.createSpr( new buyCarClass() );
			buyCar.x = 20;
			buyCar.y = 90;
			addChild(buyCar);
			buyCar.addEventListener(MouseEvent.MOUSE_OVER, onMouseOverBuyCar);
			buyCar.addEventListener(MouseEvent.MOUSE_OUT,onMouseOutBuyCar);
			buyCar.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDownBuyCar);
			
			function onMouseOverBuyCar(event:MouseEvent):void
			{
				Mouse.cursor = MouseCursor.BUTTON;
			}
			function onMouseOutBuyCar(event:MouseEvent):void
			{
				Mouse.cursor = MouseCursor.AUTO;
			}
			function onMouseDownBuyCar(event:MouseEvent):void {
				Common.query("buyCar", type);
			}
		}
	}

}