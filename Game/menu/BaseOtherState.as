package menu
{
	
	import org.flixel.FlxButton;
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	

	public class BaseOtherState extends FlxState 
	{
        [Embed(source="../assets/textures/ui/btn_return.png")]
        public var returnBtnPNG:Class;
        
		protected var _bg:FlxSprite;
		protected var _bgFlx:FlxSprite;
		
		protected var _titleField:FlxText;
		protected var _introField:FlxText;
		protected var _backBtn:FlxButton;
		
		public function BaseOtherState(title:String,bgClass:Class=null) 
		{
			super();
			if (bgClass)
			{
				_bg = new FlxSprite();
				_bg.loadGraphic(bgClass, false, false);
            	_bg.x = (FlxG.width - _bg.width)/2;
            	_bg.y = (FlxG.height - _bg.height)/2;					
				add(_bg);
			}
			
			_titleField = new FlxText(0, 0, 100, title);
			add(_titleField);
			
			_backBtn = new FlxButton();
            _backBtn.loadGraphic(returnBtnPNG,false,false,32,24);
            _backBtn.x = FlxG.width-_backBtn.width-2;
            _backBtn.y = FlxG.height-_backBtn.height - 2;
            _backBtn.onDown = backHandler;
			add(_backBtn);
		}
		
		private function backHandler():void 
		{
			FlxG.switchState(new MenuState());
		}
		
	}

}