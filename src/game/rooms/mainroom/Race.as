package game.rooms.mainroom 
{
	/**
	 * ...
	 * @author baton
	 */
	import common.Common;
	import flash.display.Sprite;
	import flash.display.*;	
	import flash.events.MouseEvent;
	import flash.ui.*;
	
	public class Race  extends Sprite
	{
		private var enterOver:Sprite;
		private var carList:Array = [];
		
		public function Race() 
		{

			/* Заезд */
			// Спрайт войти
			[Embed(source = "../../../../lib/images/enter.png")] 
			var enterClass:Class;
			var enter:Sprite = Common.createSpr( new enterClass() );
            addChild(enter);
			// Активный спрайт войти
			[Embed(source = "../../../../lib/images/enter_over.png")] 
			var enterOverClass:Class;
			enterOver = Common.createSpr( new enterOverClass() );
			enterOver.alpha = 0;
			enter.addChild(enterOver);
			enter.addEventListener(MouseEvent.MOUSE_OVER, onMouseOverEnter);
			enter.addEventListener(MouseEvent.MOUSE_OUT, onMouseOutEnter);
			
			addCar();
		}
		
	    // Наведение на кнопку войти
		private function onMouseOverEnter(event:MouseEvent):void {
			Mouse.cursor = MouseCursor.BUTTON;
			enterOver.alpha = 1;
			trace('onMouseOverEnter');
		}
		
		// Убрать курсор с кнопки войти
		private function onMouseOutEnter(event:MouseEvent):void {
			Mouse.cursor = MouseCursor.AUTO;
			enterOver.alpha = 0;
			trace('onMouseOutEnter');
		}

		// Добавить машину в заезд
		public function addCar():int {
			[Embed(source = "../../../../lib/images/car1.png")] 
			var carClass:Class;
			var car:Sprite = Common.createSpr( new carClass() );
			car.y = 0;
			car.x = (carList.length * 100) + 75;
			this.addChild(car);            
			carList.push(car);
			trace('carList.length = ', carList.length);
			return carList.length;
		}
		
	}
}