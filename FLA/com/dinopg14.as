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
	
	public class dinopg14 extends MovieClip
	{
		public var dino:MovieClip;
		public var infoBoxContainer:MovieClip;
		public var myTransform:SoundTransform = SoundMixer.soundTransform;
		public var narrativeCF:int;
		public var narrativeIP:Boolean;
        public var narrativePP:Number;
		public var narrative:Sound;
		public var narrativeSC:SoundChannel;
		public var openIBButton:MovieClip;
		public var overClip:MovieClip;
		public var pageLoader:Loader;
		
		public function dinopg14()
		{
			container.play();
			infoBoxContainer = new page_17;
			infoBoxContainer.x = 67;
			infoBoxContainer.y = 40;
			openIBButton = new openIB;
			openIBButton.x = 67;
			openIBButton.y = 40;
			openIBButton.visible = false;
			container.addChild(openIBButton);
			container.addChild(infoBoxContainer);
			//container.setChildIndex(infoBoxContainer, container.numChildren - 5);			
			infoBoxContainer.play();
			narrative = new DaMh_SAM02_0015;
			narrativeSC = narrative.play();
			narrativeIP = true;
			pageLoader = new Loader();
			loadEvents();  
		}
		
		public function dino1Ftn(event:MouseEvent):void
		{
			container.salt.play();
		}
		
		public function closeInfoBox(event:MouseEvent):void
		{
			infoBoxContainer.visible = false;
			openIBButton.visible = true;
			
			if(narrativeIP)
			{
				pauseNarrative(event);
			}
		}
		
		public function outFeet(event:MouseEvent):void
		{
			container.feet.visible = true;
			container.removeChild(overClip);
		}
		
		public function outHead(event:MouseEvent):void
		{
			container.head.visible = true;
			container.removeChild(overClip);
		}
		
		public function outHips(event:MouseEvent):void
		{
			container.hips.visible = true;
			container.removeChild(overClip);
		}
		
		public function outLegs(event:MouseEvent):void
		{
			container.legs.visible = true;
			container.removeChild(overClip);
		}
		
		public function outRibs(event:MouseEvent):void
		{
			container.ribs.visible = true;
			container.removeChild(overClip);
		}
		
		public function outShins(event:MouseEvent):void
		{
			container.shins.visible = true;
			container.removeChild(overClip);
		}
		
		public function outVertibra(event:MouseEvent):void
		{
			container.vertibra.visible = true;
			container.removeChild(overClip);
		}
		
		public function outTail(event:MouseEvent):void
		{
			container.tail.gotoAndStop(1);
		}
		
		public function overLegs(event:MouseEvent):void
		{
			container.legs.visible = false;
				
			//overClip = new legsOver;
			overClip.x = 475.5;
			overClip.y = 191.15;
			
			container.addChild(overClip);
		}
		
		public function overHips(event:MouseEvent):void
		{
			container.hips.visible = false;
				
			//overClip = new hipsOver;
			overClip.x = 337.7;
			overClip.y = 45.35;
			
			container.addChild(overClip);
		}
		
		public function overTail(event:MouseEvent):void
		{
			container.tail.gotoAndStop(2);
		}
		
		public function loadEvents():void
		{
			container.skeleton.addEventListener(MouseEvent.CLICK,playFtn);
			container.hitArea1.addEventListener(MouseEvent.CLICK,dino1Ftn);
			container.hitArea2.addEventListener(MouseEvent.MOUSE_OVER, overTail);
			container.hitArea2.addEventListener(MouseEvent.MOUSE_OUT, outTail);/*
			container.hitArea3.addEventListener(MouseEvent.MOUSE_OVER, overHips);
			container.hitArea3.addEventListener(MouseEvent.MOUSE_OUT, outHips);
			container.hitArea4.addEventListener(MouseEvent.MOUSE_OVER, overLegs);
			container.hitArea4.addEventListener(MouseEvent.MOUSE_OUT, outLegs);
			infoBoxContainer.infoBox.closeIB.addEventListener(MouseEvent.CLICK,closeInfoBox);
			infoBoxContainer.infoBox.muteBtn.addEventListener(MouseEvent.CLICK,muteNarrative);
			infoBoxContainer.infoBox.muteBtn.addEventListener(MouseEvent.MOUSE_OVER,muteBtnOver);
			infoBoxContainer.infoBox.muteBtn.addEventListener(MouseEvent.MOUSE_OUT,muteBtnOut);
			infoBoxContainer.infoBox.pauseBtn.addEventListener(MouseEvent.CLICK,pauseNarrative);
			infoBoxContainer.infoBox.pauseBtn.addEventListener(MouseEvent.MOUSE_OVER,pauseOver);
			infoBoxContainer.infoBox.pauseBtn.addEventListener(MouseEvent.MOUSE_OUT,pauseOut);
			narrativeSC.addEventListener(Event.SOUND_COMPLETE,resetNarrative);
			openIBButton.addEventListener(MouseEvent.CLICK,openInfoBox); */
		}
		
		public function muteBtnOut(event:MouseEvent):void
		{
			if(myTransform.volume == 1)
			{
				infoBoxContainer.infoBox.muteBtn.gotoAndStop(1);
			}
		}
		
		public function muteBtnOver(event:MouseEvent):void
		{
			if(myTransform.volume == 1)
			{
				infoBoxContainer.infoBox.muteBtn.gotoAndStop(2);
			}
		}
		
		public function muteNarrative(event:MouseEvent):void
		{
			if(myTransform.volume == 0)
			{
				myTransform.volume = 1;
				infoBoxContainer.infoBox.muteBtn.gotoAndStop(1);
			}
			else
			{
				myTransform.volume = 0;
				infoBoxContainer.infoBox.muteBtn.gotoAndStop(3);
			}
            
            SoundMixer.soundTransform = myTransform;
		}
		
		public function openInfoBox(event:MouseEvent):void
		{
			infoBoxContainer.visible = true;
			openIBButton.visible = false;
			pauseNarrative(event);
		}
		
		public function pauseNarrative(event:MouseEvent):void
		{
			if(narrativeIP) 
			{
				infoBoxContainer.infoBox.pauseBtn.gotoAndStop(3);
				infoBoxContainer.stop();
				narrativePP = narrativeSC.position;
				narrativeSC.stop();
				narrativeCF = infoBoxContainer.currentFrame;
        		narrativeIP = false;
    		} 
			else 
			{
				infoBoxContainer.infoBox.pauseBtn.gotoAndStop(1);
				
				if(narrativePP)
				{
					infoBoxContainer.gotoAndPlay(narrativeCF);
        			narrativeSC = narrative.play(narrativePP);
				}
				else
				{
					infoBoxContainer.play();
					narrativeSC = narrative.play();
				}
				
				narrativeIP = true;
            }
		}
		
		public function pauseOut(event:MouseEvent):void
		{
			if(narrativeIP) 
			{
				infoBoxContainer.infoBox.pauseBtn.gotoAndStop(1);
			}
			else
			{
				infoBoxContainer.infoBox.pauseBtn.gotoAndStop(3);
			}
		}
		
		public function pauseOver(event:MouseEvent):void
		{
			if(narrativeIP) 
			{
				infoBoxContainer.infoBox.pauseBtn.gotoAndStop(2);
			}
			else
			{
				infoBoxContainer.infoBox.pauseBtn.gotoAndStop(4);
			}
		}
		
		public function playFtn(event:MouseEvent):void
		{
			event.currentTarget.play();
		}
		
		public function removePage():void
		{
			var i:int = container.numChildren;
			
			while(i --)
			{
    			container.removeChildAt(i);
			} 
			
			removeChild(container);
			narrativeSC.stop();
		}
		
		public function resetNarrative(event):void
		{
			infoBoxContainer.infoBox.pauseBtn.gotoAndStop(3);
			narrativeIP = false;
			narrativePP = 0;
		}
	}
}