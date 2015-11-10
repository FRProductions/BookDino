package com
{
	import flash.display.Loader;
	import flash.display.MovieClip;
	import flash.events.*;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.media.SoundMixer;
	import flash.media.SoundTransform;
	import flash.net.URLRequest;
	
	public class dinopg05 extends MovieClip
	{
		public var cb:MovieClip;
		public var myTransform:SoundTransform = SoundMixer.soundTransform;
		//public var narrative:Sound;
		//public var narrativeSC:SoundChannel;
		public var pageLoader:Loader;
		
		public function dinopg05()
		{
			cb = new chalkboard;
			cb.x = 275.55;
			cb.y = 191.65;
			
			//container.setChildIndex(cb, container.numChildren - 5);
			//container.play();
			//narrativeSC = narrative.play();
			pageLoader = new Loader();
			loadEvents();
		}
		
		public function closeCBFtn(event:MouseEvent):void
		{			
			container.removeChild(cb);
		}
		
		public function dino1Ftn(event:MouseEvent):void
		{
			container.salt.play();
		}
		
		public function dino2Ftn(event:MouseEvent):void
		{
			container.dino2.play();
		}
		
		public function header1Click(event:MouseEvent):void
		{
			container.addChild(cb);
			cb.gotoAndStop(1);
		}
		
		public function header1Over(event:MouseEvent):void
		{
			this.buttonMode = true;
			MovieClip(root).container.header1.gotoAndStop(2);
			MovieClip(root).container.sketch1.gotoAndStop(2);
		}
		
		public function header1Out(event:MouseEvent):void
		{
			container.header1.gotoAndStop(1);
			container.sketch1.gotoAndStop(1);
		}
		
		public function header2Click(event:MouseEvent):void
		{
			container.addChild(cb);
			cb.gotoAndStop(2);
		}
		
		public function header2Over(event:MouseEvent):void
		{
			container.header2.gotoAndStop(2);
			container.sketch2.gotoAndStop(2);
		}
		
		public function header2Out(event:MouseEvent):void
		{
			container.header2.gotoAndStop(1);
			container.sketch2.gotoAndStop(1);
		}
		
		public function header3Click(event:MouseEvent):void
		{
			container.addChild(cb);
			cb.gotoAndStop(3);
		}
		
		public function header3Over(event:MouseEvent):void
		{
			container.header3.gotoAndStop(2);
			container.sketch3.gotoAndStop(2);
		}
		
		public function header3Out(event:MouseEvent):void
		{
			container.header3.gotoAndStop(1);
			container.sketch3.gotoAndStop(1);
		}
		
		public function header4Click(event:MouseEvent):void
		{
			container.addChild(cb);
			cb.gotoAndStop(4);
		}
		
		public function header4Over(event:MouseEvent):void
		{
			container.header4.gotoAndStop(2);
			container.sketch4.gotoAndStop(2);
		}
		
		public function header4Out(event:MouseEvent):void
		{
			container.header4.gotoAndStop(1);
			container.sketch4.gotoAndStop(1);
		}
		
		public function header5Click(event:MouseEvent):void
		{
			container.addChild(cb);
			cb.gotoAndStop(5);
		}
		
		public function header5Over(event:MouseEvent):void
		{
			container.header5.gotoAndStop(2);
			container.sketch5.gotoAndStop(2);
			container.sketch6.gotoAndStop(2);
		}
		
		public function header5Out(event:MouseEvent):void
		{
			container.header5.gotoAndStop(1);
			container.sketch5.gotoAndStop(1);
			container.sketch6.gotoAndStop(1);
		}
		
		public function header6Click(event:MouseEvent):void
		{
			container.addChild(cb);
			cb.gotoAndStop(6);
		}
		
		public function header6Over(event:MouseEvent):void
		{
			container.header6.gotoAndStop(2);
			container.sketch7.gotoAndStop(2);
			container.sketch8.gotoAndStop(2);
			container.sketch9.gotoAndStop(2);
			container.sketch10.gotoAndStop(2);
		}
		
		public function header6Out(event:MouseEvent):void
		{
			container.header6.gotoAndStop(1);
			container.sketch7.gotoAndStop(1);
			container.sketch8.gotoAndStop(1);
			container.sketch9.gotoAndStop(1);
			container.sketch10.gotoAndStop(1);
		}
		
		public function header7Click(event:MouseEvent):void
		{
			container.addChild(cb);
			cb.gotoAndStop(7);
		}
		
		public function header7Over(event:MouseEvent):void
		{
			container.header7.gotoAndStop(2);
			container.sketch11.gotoAndStop(2);
			container.sketch12.gotoAndStop(2);
		}
		
		public function header7Out(event:MouseEvent):void
		{
			container.header7.gotoAndStop(1);
			container.sketch11.gotoAndStop(1);
			container.sketch12.gotoAndStop(1);
		}
		
		public function header8Click(event:MouseEvent):void
		{
			container.addChild(cb);
			cb.gotoAndStop(8);
		}
		
		public function header8Over(event:MouseEvent):void
		{
			container.header8.gotoAndStop(2);
			container.sketch13.gotoAndStop(2);
			container.sketch14.gotoAndStop(2);
		}
		
		public function header8Out(event:MouseEvent):void
		{
			container.header8.gotoAndStop(1);
			container.sketch13.gotoAndStop(1);
			container.sketch14.gotoAndStop(1);
		}
		
		public function kid1Ftn(event:MouseEvent):void
		{
			event.target.play();
			event.target.removeEventListener(MouseEvent.CLICK,kid1Ftn);
		}
		
		public function loadEvents():void
		{	
			cb.closeCB.addEventListener(MouseEvent.CLICK,closeCBFtn);
			container.earl.addEventListener(MouseEvent.CLICK,kid1Ftn);
			container.screen.addEventListener(MouseEvent.CLICK,dino1Ftn);
			container.hitArea1.addEventListener(MouseEvent.CLICK,header1Click);
			container.hitArea1.addEventListener(MouseEvent.MOUSE_OVER,header1Over);
			container.hitArea1.addEventListener(MouseEvent.MOUSE_OUT,header1Out);
			container.hitArea2.addEventListener(MouseEvent.CLICK,header2Click);
			container.hitArea2.addEventListener(MouseEvent.MOUSE_OVER,header2Over);
			container.hitArea2.addEventListener(MouseEvent.MOUSE_OUT,header2Out);
			container.hitArea3.addEventListener(MouseEvent.CLICK,header3Click);
			container.hitArea3.addEventListener(MouseEvent.MOUSE_OVER,header3Over);
			container.hitArea3.addEventListener(MouseEvent.MOUSE_OUT,header3Out);
			container.hitArea4.addEventListener(MouseEvent.CLICK,header4Click);
			container.hitArea4.addEventListener(MouseEvent.MOUSE_OVER,header4Over);
			container.hitArea4.addEventListener(MouseEvent.MOUSE_OUT,header4Out);
			container.hitArea5.addEventListener(MouseEvent.CLICK,header5Click);
			container.hitArea5.addEventListener(MouseEvent.MOUSE_OVER,header5Over);
			container.hitArea5.addEventListener(MouseEvent.MOUSE_OUT,header5Out);
			container.hitArea6.addEventListener(MouseEvent.CLICK,header6Click);
			container.hitArea6.addEventListener(MouseEvent.MOUSE_OVER,header6Over);
			container.hitArea6.addEventListener(MouseEvent.MOUSE_OUT,header6Out);
			container.hitArea7.addEventListener(MouseEvent.CLICK,header7Click);
			container.hitArea7.addEventListener(MouseEvent.MOUSE_OVER,header7Over);
			container.hitArea7.addEventListener(MouseEvent.MOUSE_OUT,header7Out);
			container.hitArea8.addEventListener(MouseEvent.CLICK,header8Click);
			container.hitArea8.addEventListener(MouseEvent.MOUSE_OVER,header8Over);
			container.hitArea8.addEventListener(MouseEvent.MOUSE_OUT,header8Out);
		}
		
		public function removePage():void
		{
			var i:int = container.numChildren;
			
			while(i --)
			{
    			container.removeChildAt(i);
			} 
			
			removeChild(container);
			//narrativeSC.stop();
		}
		
		public function sketch1Click(event:MouseEvent):void
		{
			container.addChild(cb);
			cb.gotoAndStop(1);
		}
		
		public function sketch1Over(event:MouseEvent):void
		{
			container.header1.gotoAndStop(2);
		}
		
		public function sketch1Out(event:MouseEvent):void
		{
			container.header1.gotoAndStop(1);
		}
	}
}