package menu 
{
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	

	public class AboutState extends BaseOtherState
	{
		[Embed(source="../assets/textures/ui/bg_about.png")]
		private var bgImg:Class;
		
		public function AboutState() 
		{
			super("About", bgImg);
            var padding:int = 10;
								  
			var infoText:String = "This is about page This is about page This is about page This is about page";
			var info:FlxText = new FlxText(0,0,FlxG.width - 50 - 20);
            info.x = padding+50+4;
            info.y = padding;
            info.text = infoText;
			info.setFormat(null, 8, 0xFFFFFF, "left");
			add(info);
            
            var thxText:String = "This is about page This is about page This is about page This is about page";
            var thx:FlxText = new FlxText(0,0,info.width);
            thx.x = info.x;
            thx.y = info.y+info.height+6;
            thx.text = thxText;
            thx.setFormat(null, 8, 0xFFFFFF, "left");
            add(thx);
			
		}
	}
}