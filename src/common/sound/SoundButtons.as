package common.sound
{
	import common.Common;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.ui.*;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author baton
	 */
	public class SoundButtons extends Sprite
	{	
		private var buttonSfx:Sprite;
		private var buttonEnv:Sprite;
		
		public function SoundButtons()
		{
			[Embed(source = "../../../lib/images/player_off.png")] 
			var buttonSfxOffClass:Class;
			var buttonSfxOff:Sprite = Common.createSpr( new buttonSfxOffClass() );
			addChild(buttonSfxOff);
			
			[Embed(source = "../../../lib/images/player_on.png")] 
			var buttonSfxClass:Class;
			buttonSfx = Common.createSpr( new buttonSfxClass() );
			addChild(buttonSfx);
			buttonSfx.addEventListener(MouseEvent.MOUSE_OVER, onMouseOverButtonSfx);
			buttonSfx.addEventListener(MouseEvent.MOUSE_OUT,onMouseOutButtonSfx);
			buttonSfx.addEventListener(MouseEvent.MOUSE_DOWN, mouseDownButtonSfx);
			
			function onMouseOverButtonSfx(event:MouseEvent):void
			{
				Mouse.cursor = MouseCursor.BUTTON;
			}
			function onMouseOutButtonSfx(event:MouseEvent):void
			{
				Mouse.cursor = MouseCursor.AUTO;
			}
			function mouseDownButtonSfx(event:MouseEvent):void {
				clickSfx();
			}
			
			
			
			[Embed(source = "../../../lib/images/player_off.png")] 
			var buttonEnvOffClass:Class;
			var buttonEnvOff:Sprite = Common.createSpr( new buttonEnvOffClass() );
			buttonEnvOff.x = 30;
			addChild(buttonEnvOff);
			
			[Embed(source = "../../../lib/images/player_on.png")] 
			var buttonEnvClass:Class;
			buttonEnv = Common.createSpr( new buttonEnvClass() );
			buttonEnv.x = 30;
			addChild(buttonEnv);
			buttonEnv.addEventListener(MouseEvent.MOUSE_OVER, onMouseOverButtonEnv);
			buttonEnv.addEventListener(MouseEvent.MOUSE_OUT,onMouseOutButtonEnv);
			buttonEnv.addEventListener(MouseEvent.MOUSE_DOWN, mouseDownButtonEnv);
			
			function onMouseOverButtonEnv(event:MouseEvent):void
			{
				Mouse.cursor = MouseCursor.BUTTON;
			}
			function onMouseOutButtonEnv(event:MouseEvent):void
			{
				Mouse.cursor = MouseCursor.AUTO;
			}
			function mouseDownButtonEnv(event:MouseEvent):void {
				clickEnv();
			}
		}
		
		public function clickEnv():void {
			if (Common.envOn) {
				Common.soundOffEnv();
				buttonEnv.alpha = 0;
			} else {
				Common.soundOnEnv();
				buttonEnv.alpha = 1;
			}
			trace("env: " + Common.envOn);
		}
		
		public function clickSfx():void {
			if (Common.sfxOn) {
				Common.soundOffSfx();
				buttonSfx.alpha = 0;
			} else {
				Common.soundOnSfx();
				buttonSfx.alpha = 1;
			}
			trace("sfx: " + Common.sfxOn);
		}
		
		public function update():void {
			
			if (Common.sfxOn) {
				buttonSfx.alpha = 1;
			} else {
				buttonSfx.alpha = 0;
			}
			
			if (Common.envOn) {
				buttonEnv.alpha = 1;
			} else {
				buttonEnv.alpha = 0;
			}
		}
		
	}
}