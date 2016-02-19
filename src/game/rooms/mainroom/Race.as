package game.rooms.mainroom 
{
	/**
	 * ...
	 * @author baton
	 */
	import common.Common;
	import flash.display.Sprite;
	import flash.display.*;	
	
	public class Race  extends Sprite
	{
		public function Race() 
		{

			/* Заезд */
			// Войти
			[Embed(source = "../../../../lib/images/enter.png")] 
			var enterClass:Class;
			var enter:Sprite = Common.createSpr( new enterClass() );
			addChild(enter);
			//enter.addEventListener(MouseEvent.MOUSE_OVER, onMouseOverWheelText);
			//enter.addEventListener(MouseEvent.MOUSE_OUT, onMouseOutWheelText);
		}
		
	}

}