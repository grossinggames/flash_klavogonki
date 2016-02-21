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
		
		public function Race() 
		{

			/* Заезд */
			// Войти
			[Embed(source = "../../../../lib/images/enter.png")] 
			var enterClass:Class;
			var enter:Sprite = Common.createSpr( new enterClass() );
            addChild(enter);
			[Embed(source = "../../../../lib/images/enter_over.png")] 
			var enterOverClass:Class;
			enterOver = Common.createSpr( new enterOverClass() );
			enterOver.alpha = 0;
			enter.addChild(enterOver);
			enter.addEventListener(MouseEvent.MOUSE_OVER, onMouseOverEnter);
			enter.addEventListener(MouseEvent.MOUSE_OUT, onMouseOutEnter);
			
		}
	
		private function onMouseOverEnter(event:MouseEvent):void {
			Mouse.cursor = MouseCursor.BUTTON;
			enterOver.alpha = 1;
			trace('onMouseOverEnter');
		}

		private function onMouseOutEnter(event:MouseEvent):void {
			Mouse.cursor = MouseCursor.AUTO;
			enterOver.alpha = 0;
			trace('onMouseOutEnter');
		}
		
	}
	
}