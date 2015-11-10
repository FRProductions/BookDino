package com
{
	import flash.display.Loader;
	import flash.display.MovieClip;
	import flash.events.*;
	import flash.media.SoundMixer;
	import flash.net.URLRequest;
	
	public class container extends MovieClip
	{
		public var canvas:MovieClip;
		public var indexNum:int;
		public var pageLoader:Loader;
		public var urlRequest:URLRequest;
		
		public function container()
		{
			indexNum = 1;
			
			buildCanvas();
			loadEvents();
			setNav();
			
			urlRequest = new URLRequest("dino_pg_"+indexNum+"_KG-JH.swf"); 
			pageLoader = new Loader();
			pageLoader.load(urlRequest); 
			canvas.addChild(pageLoader);
		}
		
		public function buildCanvas():void
		{
			canvas = new MovieClip();
			canvas.x = 0;
			canvas.y = 0;
			addChild(canvas);
			MovieClip(root).setChildIndex(canvas, MovieClip(root).numChildren - 3);
		}
		
		public function leftArrowClick(event:MouseEvent)
		{
			indexNum--;
			setNav();
			crank.play();
			removePage();
			buildCanvas();
			pageLoader.unloadAndStop();
       		urlRequest = new URLRequest("dino_pg_"+indexNum+"_KG-JH.swf"); 
			pageLoader.load(urlRequest); 
			canvas.addChild(pageLoader); 
		}
		
		public function leftArrowOut(event:MouseEvent)
		{
			crank.arrowLeft.play();
			MovieClip(root).index.visible = false;
		}
		
		public function leftArrowOver(event:MouseEvent)
		{
			crank.arrowLeft.play();
			MovieClip(root).index.visible = true;
		}
		
		public function loadEvents():void
		{
			crank.arrowLeft.addEventListener(MouseEvent.MOUSE_OUT, leftArrowOut);
			crank.arrowLeft.addEventListener(MouseEvent.MOUSE_OVER, leftArrowOver);
			crank.arrowRight.addEventListener(MouseEvent.MOUSE_OUT, rightArrowOut);
			crank.arrowRight.addEventListener(MouseEvent.MOUSE_OVER, rightArrowOver);
		}
		
		public function removePage():void
		{
			var i:int = canvas.numChildren;
			
			while(i --)
			{
    			canvas.removeChildAt(i);
			} 
			
			removeChild(canvas);
			
			SoundMixer.stopAll();
		}
		
		public function rightArrowClick(event:MouseEvent)
		{
			indexNum++;
			setNav();
			crank.play();
			removePage();
			buildCanvas();
			pageLoader.unloadAndStop();
       		urlRequest = new URLRequest("dino_pg_"+indexNum+"_KG-JH.swf"); 
			pageLoader.load(urlRequest); 
			canvas.addChild(pageLoader);
		}
		
		public function rightArrowOut(event:MouseEvent):void
		{
			MovieClip(root).index.visible = false;
		}
		
		public function rightArrowOver(event:MouseEvent):void
		{
			crank.arrowRight.play();
			MovieClip(root).index.visible = true;
		}
		
		public function setNav():void
		{
			//index.visible = false;
			index.gotoAndStop(indexNum+1);
			
			if(indexNum == 1)
			{ 
				crank.arrowLeft.removeEventListener(MouseEvent.CLICK,leftArrowClick);
			}
			else
			{
				crank.arrowLeft.addEventListener(MouseEvent.CLICK,leftArrowClick);
			}
			
			if(indexNum == 20)
			{
				crank.arrowRight.removeEventListener(MouseEvent.CLICK,rightArrowClick);
			}
			else
			{
				crank.arrowRight.addEventListener(MouseEvent.CLICK,rightArrowClick);
			}
		}
	}
}