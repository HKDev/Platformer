package menu
{
	import flash.printing.PrintJob;
	
	import org.flixel.FlxButton;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	

	public class HelpState extends BaseOtherState 
	{
		[Embed(source="../assets/textures/ui/bg_help.png")]
		private var bgClass:Class;
		
        [Embed(source="../assets/textures/ui/btn_help_num_bg.png")]
        private var numberBgPNG:Class;
        
        private var _helpList:Array;
              
		public function HelpState() 
		{
			super("Help", bgClass);
            
            initHelp();
            
            var sx:int = 20;
            var sy:int = 20;
            var padding:int = 2;
            for (var i:int = 0; i < 4; i++) 
            {
                var btn:FlxButton = new FlxButton();
                btn.x = sx+i*(15+padding);
                btn.y = sy;
                btn.loadGraphic(numberBgPNG,false,false,15,15);
                btn.onDown = onDownHandler;
          
                add(btn);
            }
            
		}
        
        private function initHelp():void
        {
            _helpList = [];
            for (var i:int = 0; i < 3; i++) 
            {
                var help:FlxSprite = new FlxSprite();
                help.loadGraphic(bgClass);
                
                _helpList.push(help);
            }
        }
        
        private function onDownHandler():void
        {
            trace("click");
        }
    }
}