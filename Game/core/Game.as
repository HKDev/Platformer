/*
	Parent of: State.as

	Memory Inspection: 	May,20 2012 (pass)

*/

package core {
	
	import org.flixel.FlxGame;
	import core.State;
	import other.GameSaver;
	import menu.MenuState;




///////////////////////////////////////////////////////// [ CLASS ] ////////////////////////////////////////////////////////////////////////////




	public class Game extends FlxGame {




///////////////////////////////////////////////////////// [ CONSTRUCTOR ] ////////////////////////////////////////////////////////////////////////////




		public function Game() {
			super(550,400,MenuState,1 /* zoom */);
			GameSaver.load();
//			forceDebugger = true;	// debugger currently disabled. when enabled activate during runtime with '`' key.
		}

	
	}//class
}//package
