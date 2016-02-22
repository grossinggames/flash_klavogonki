package game.rooms.mainroom 
{
	/**
	 * ...
	 * @author baton
	 */
	import flash.display.Sprite;
	import flash.display.*;	
	import common.Common;
	
	public class Car extends Sprite
	{
		
		public function Car() 
		{
			// Добавили машину 1
			[Embed(source = "../../../../lib/images/car1.png")] 
			var car1Class:Class;
			var car1:Sprite = Common.createSpr( new car1Class() );
			car1.alpha = 0;
			addChild(car1);
			
			// Добавили машину 2
			[Embed(source = "../../../../lib/images/car2.png")] 
			var car2Class:Class;
			var car2:Sprite = Common.createSpr( new car2Class() );
			car2.alpha = 0;
			addChild(car2);
			
			// Добавили машину 3
			[Embed(source = "../../../../lib/images/car3.png")] 
			var car3Class:Class;
			var car3:Sprite = Common.createSpr( new car3Class() );
			car3.alpha = 0;
			addChild(car3);
			
			// Добавили машину 4
			[Embed(source = "../../../../lib/images/car4.png")] 
			var car4Class:Class;
			var car4:Sprite = Common.createSpr( new car4Class() );
			car4.alpha = 0;
			addChild(car4);
			
			// Добавили машину 5
			[Embed(source = "../../../../lib/images/car5.png")] 
			var car5Class:Class;
			var car5:Sprite = Common.createSpr( new car5Class() );
			car5.alpha = 0;
			addChild(car5);
			
			// Добавили машину 6
			[Embed(source = "../../../../lib/images/car6.png")] 
			var car6Class:Class;
			var car6:Sprite = Common.createSpr( new car6Class() );
			car6.alpha = 0;
			addChild(car6);
			
			// Добавили машину 7
			[Embed(source = "../../../../lib/images/car7.png")] 
			var car7Class:Class;
			var car7:Sprite = Common.createSpr( new car7Class() );
			car7.alpha = 0;
			addChild(car7);
			
			// Добавили машину 8
			[Embed(source = "../../../../lib/images/car8.png")] 
			var car8Class:Class;
			var car8:Sprite = Common.createSpr( new car8Class() );
			car8.alpha = 0;
			addChild(car8);
			
			// Добавили машину 9
			[Embed(source = "../../../../lib/images/car9.png")] 
			var car9Class:Class;
			var car9:Sprite = Common.createSpr( new car9Class() );
			car9.alpha = 0;
			addChild(car9);
			
			// Добавили машину 10
			[Embed(source = "../../../../lib/images/car10.png")] 
			var car10Class:Class;
			var car10:Sprite = Common.createSpr( new car10Class() );
			car10.alpha = 0;
			addChild(car10);
			
			var showCar:int = randomInt(1, 10);
			
			switch (showCar) { 
				case 1: 
					car1.alpha = 1;
					break; 
				case 2: 
					car2.alpha = 1;
					break; 
				case 3: 
					car3.alpha = 1;
					break; 
				case 4: 
					car4.alpha = 1;
					break; 
				case 5: 
					car5.alpha = 1;
					break; 
				case 6: 
					car6.alpha = 1;
					break; 
				case 7: 
					car7.alpha = 1;
					break; 
				case 8: 
					car8.alpha = 1;
					break; 
				case 9: 
					car9.alpha = 1;
					break; 
				case 10: 
					car10.alpha = 1;
					break; 
				default : 
					trace("some other month"); 
			}
		}
		
		// Рендомное число типа int
		private function randomInt(min:Number, max:Number):Number {
			var rand:Number = min + Math.random() * (max + 1 - min);
			rand = Math.floor(rand);
			return rand;
		}
		
	}
}