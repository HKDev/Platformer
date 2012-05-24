package  other {
	
	import org.flixel.*;
	
	
	
///////////////////////////////////////////////////////// [ CLASS ] ////////////////////////////////////////////////////////////////////////////





	public class GameSaver {
		
		//The FlxSave instance
		private static var _save:FlxSave; 
		
		//Holds level data if bind() did not work. This is not persitent, and will be deleted when the application ends
		private static var _temp1:int = 0; 
		private static var _temp2:int = 0;
		
		 //Did bind() work? Do we have a valid SharedObject?
		private static var _loaded:Boolean = false;
 
 
 		public function GameSaver() {
			// constructor code
		}
		
		
		
		/* --------------------------- */// Returns the last xpos saved
		public static function get xposition():int
		{
			//We only get data from _save if it was loaded properly. Otherwise, use _temp
			if (_loaded)
			{
				return _save.data.xposition;
			}
			else
			{
				return _temp1;
			}
		}
 
		
		/* --------------------------- */// Sets xpos to be saved
		public static function set xposition(xpos:int):void
		{
			if (_loaded)
			{
				_save.data.xposition = xpos;
			}
			else
			{
				_temp1 = xpos;
			}
		}
 
 		/* --------------------------- */// Returns the last ypos saved
 		public static function get yposition():int
		{
			//We only get data from _save if it was loaded properly. Otherwise, use _temp
			if (_loaded)
			{
				return _save.data.yposition;
			}
			else
			{
				return _temp1;
			}
		}
 
		/* --------------------------- */// Sets ypos to be saved
		public static function set yposition(ypos:int):void
		{
			if (_loaded)
			{
				_save.data.yposition = ypos;
			}
			else
			{
				_temp1 = ypos;
			}
		}
		
		
		/* --------------------------- */// Setup xpos and ypos
		public static function load():void
		{
			_save = new FlxSave();
			_loaded = _save.bind("myLevelData");
			if (_loaded && (_save.data.xposition == null || _save.data.yposition == null))
			{
				_save.data.xposition = 100;
				_save.data.yposition = 100;
			}
		}


	}
	
}
