﻿/*	Memory Inspection: 	May,28 2012 (pass)	Note: Ensure classes are being destroyed or re-used not recreated everytime. Otherwise code is sound.	Update - MenuState is indeed being recreated so this is definately something we need to look into and maybe pool the menu objects to reuse them if not already.*/package menu{	import core.Assets;	import core.State;		import org.flixel.FlxButton;	import org.flixel.FlxG;	import org.flixel.FlxSound;	import org.flixel.FlxSprite;	import org.flixel.FlxState;	import org.flixel.FlxText;	///////////////////////////////////////////////////////// [ CLASS ] ////////////////////////////////////////////////////////////////////////////	public class MenuState extends FlxState	{				//button		private var _playBtn:FlxButton;		private var _aboutBtn:FlxButton;		private var _helpBtn:FlxButton;		private var _muteBtn:FlxButton;		//text		private var _info:FlxText;			//sound		private var _btnSound:FlxSound;///////////////////////////////////////////////////////// [ CONSTRUCTOR ] ////////////////////////////////////////////////////////////////////////////				public function MenuState()		{CONFIG::DEBUG {			trace("[+] Created MenuState");}			FlxG.mouse.show(null,1,0,0);			initDisplayObjects();			FlxG.play(Assets.startSound);		}		/* --------------------------- */// Initialize Background/Buttons		private function initDisplayObjects():void		{			var bg:FlxSprite = new FlxSprite();			bg.loadGraphic(Assets.bgClass, false, false);			bg.alpha = 0.5;            bg.x = (FlxG.width - bg.width)/2;            bg.y = (FlxG.height - bg.height)/2;						add(bg);						_playBtn = new FlxButton();			_playBtn.loadGraphic(Assets.btnPlayClass, false, false, 140,40);			_playBtn.soundDown = getBtnSound();			_playBtn.x = (FlxG.width - _playBtn.width) / 2;			_playBtn.y = FlxG.height / 3;			_playBtn.onDown = playHandler;			add(_playBtn);						var padding:int = 10;						_muteBtn = new FlxButton();			_muteBtn.loadGraphic(Assets.btnMuteClass, false, false, 32, 32);			_muteBtn.soundDown = getBtnSound();			_muteBtn.onDown = optionHandler;			_muteBtn.x = (FlxG.width - _muteBtn.width) / 2;			_muteBtn.y = FlxG.height - _muteBtn.height - padding;			add(_muteBtn);						_aboutBtn = new FlxButton();			_aboutBtn.loadGraphic(Assets.btnProfileClass, false, false, 32, 32);			_aboutBtn.soundDown = getBtnSound();			_aboutBtn.x = FlxG.width - padding - _aboutBtn.width;			_aboutBtn.y = FlxG.height - padding - _aboutBtn.height;			_aboutBtn.onDown = aboutHandler;			add(_aboutBtn);						_helpBtn = new FlxButton();			_helpBtn.loadGraphic(Assets.btnHelpClass, false, false, 32, 32);			_helpBtn.soundDown = getBtnSound();			_helpBtn.x = padding;			_helpBtn.y = FlxG.height - padding - _helpBtn.height;			_helpBtn.onDown = helpHandler;			add(_helpBtn);		}		/* --------------------------- */// Return Button Sound		private function getBtnSound():FlxSound		{			var snd:FlxSound = new FlxSound();			snd.loadEmbedded(Assets.btnSound);			return snd;		}		/* --------------------------- */// Switch to Play State				private function goPlayHandler():void		{			FlxG.switchState(new State());		}				/* --------------------------- */// Switch to Help State      		private function goHelpHandler():void		{			FlxG.switchState(new HelpState);		}		/* --------------------------- *///	Switch to About State       		private function goAboutHandler():void		{			FlxG.switchState(new AboutState); 		}		/* --------------------------- */// Transition to Play Handler		private function playHandler():void		{			FlxG.fade(0xFFFFFF, 1, goPlayHandler);		}		/* --------------------------- */// Transition to Help Handler		private function helpHandler():void		{			FlxG.fade(0xffffff, 0.5, goHelpHandler);		}		/* --------------------------- */// Transition to About Handler		private function aboutHandler():void		{			FlxG.fade(0xffffff, 0.5, goAboutHandler);		}		/* --------------------------- */// Transition to Option Handler		private function optionHandler():void		{			// option menu		}					}//class}//package