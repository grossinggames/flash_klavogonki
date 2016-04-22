package common.gavanna 
{
	//import flash.display.Sprite;
	import common.events.AppGavannaEvent;
    import flash.events.TimerEvent;
    import flash.utils.Timer;

    /**
	 * ...
	 * @author Gospodin.Sorokin
	 */
    public class AppGavanna extends Gavanas
    {
        private var systemTimer:Timer;
		private var _id:String;
		private var _argument:Array;
		private var _resultServer :Array = [""];
		
        public function AppGavanna()
        {
            super();
			
            systemTimer = new Timer(1000);
            systemTimer.addEventListener(TimerEvent.TIMER, tickHandler);
            //systemTimer.addEventListener(TimerEvent.TIMER_COMPLETE, completeHandler);
        }
        
        private function sendColmplete():void
        {
            var event:AppGavannaEvent = new AppGavannaEvent(AppGavannaEvent.COMPLETE);
			
			switch(_id)
			{
				case "Start":
					_resultServer[0] = getUserSetting();
					_resultServer[1] = getUserCar();
					break;
				case "GetSetting":
					_resultServer = getUserSetting();
					break;
				case "GetCar":
					_resultServer = getUserCar();
					break;
				case "SetSetting":
					//setUserSetting(_argument);
					break;
				case "SetCar":
					//setUserCar(_argument[0]);
					break;
				default:
					trace("Out of range");
					break;
			}
            event.result = _resultServer;
            this.dispatchEvent(event);
			systemTimer.stop();
        }
        
        private function tickHandler(event:TimerEvent):void
        {
            if (serverProcessing == false) {
				sendColmplete();
			}
        }
        
        private function completeHandler(event:TimerEvent):void
        {
            this.dispatchEvent(new AppGavannaEvent(AppGavannaEvent.COMPLETE));
        }
		
		public function Please(_id:String, ... _argument):void
		{
			
			systemTimer.start();
			
			switch(_id)
			{
				case "StartUser":
					findUserData();
					break;
				case "SetSetting":
					trace(_argument);
					setUserSetting(_argument);
					break;
				case "SetCar":
					setUserCar(_argument[0]);
					break;
				case "GetSetting":
					//_resultServer = getUserSetting();
					break;
				case "GetCar":
					//_resultServer = getUserCar();
					break;
				default:
					trace("Out of range");
					break;
			}
			
			this._id = _id;
			this._argument = _argument;
		}
    }
}