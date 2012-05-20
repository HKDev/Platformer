﻿package core {
	
	import flash.display.Sprite;
	import flash.events.Event;
	import core.Game;

	[SWF(width="550", height="400", backgroundColor="#000000")]
		
	public class DocumentClass extends Sprite {

		public function DocumentClass() {
			if(stage) initialize();
			else addEventListener(Event.ADDED_TO_STAGE, initialize);
		}

		private function initialize(e:Event = null):void {
			if(hasEventListener(Event.ADDED_TO_STAGE))
				removeEventListener(Event.ADDED_TO_STAGE, initialize);

			var game:Game = new Game;
			addChild(game);
		}

	}//class
}//package
