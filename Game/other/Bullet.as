﻿/*	Memory Inspection: 	May,20 2012 (pass)*/package other {	import org.flixel.*;	import core.State;	import other.Bullet;	import core.Assets;	import flash.utils.Timer;	import flash.events.TimerEvent;///////////////////////////////////////////////////////// [ CLASS ] ////////////////////////////////////////////////////////////////////////////	public class Bullet extends FlxSprite {		public var speed:Number;///////////////////////////////////////////////////////// [ CONSTRUCTOR ] ////////////////////////////////////////////////////////////////////////////				public function Bullet() {			super();			loadGraphic(Assets.ImgBullet,true);			width = 6;			height = 6;			offset.x = 1;			offset.y = 1;						addAnimation("up",[0]);			addAnimation("down",[1]);			addAnimation("left",[2]);			addAnimation("right",[3]);			addAnimation("poof",[4, 5, 6, 7], 50, false);						speed = 360;		}///////////////////////////////////////////////////////// [ METHODS ] /////////////////////////////////////////////////////////////////////////////* --------------------------- */// Update 				override public function update():void {			/* --------------------------- */// Alive or Dead			if(alive) {				//kill Bullet if outside of bounds x,y				if(x < 0 || x > State.map.width) { 					kill();				}				if(y < 0 || y > State.map.height) { 					kill();				}			}			else if(!alive) {				if(finished)					exists = false;			}			else if(touching) {				kill();			}		}/* --------------------------- */// Kill		override public function kill():void {			if(!alive)				return;			velocity.x = 0;			velocity.y = 0;			if(onScreen())				FlxG.play(Assets.SndHit);			alive = false;			solid = false;			play("poof");		}/* --------------------------- */// Shoot				public function shoot(Location:FlxPoint, Aim:uint):void {			FlxG.play(Assets.SndShoot);			FlxG.volume = .25;			super.reset(Location.x-width/2,Location.y-height/2);			solid = true;			switch(Aim)			{				case UP:					play("up");					velocity.y = -speed;					break;				case DOWN:					play("down");					velocity.y = speed;					break;				case LEFT:					play("left");					velocity.x = -speed;					break;				case RIGHT:					play("right");					velocity.x = speed;					break;				default:					break;			}		}	}//class}//package