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
	
	public class dinopg02 extends MovieClip
	{
		public var infoBoxContainer:MovieClip;
		public var myTransform:SoundTransform = SoundMixer.soundTransform;
		public var narrativeCF:int;
		public var narrativeIP:Boolean;
        public var narrativePP:Number;
		public var narrative:Sound;
		public var narrativeSC:SoundChannel;
		public var openIBButton:MovieClip;
		public var pageLoader:Loader;
		public var pageNum:int;
		
		public function dinopg02()
		{
			container.play();
			openIBButton = new openIB;
			openIBButton.x = 157;
			openIBButton.y = 49;
			openIBButton.visible = false;
			addChild(openIBButton);
			pageLoader = new Loader();
			pageOne();
			loadEvents();  
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
		
		public function loadEvents():void
		{
			container.bonnie.addEventListener(MouseEvent.CLICK, playFtn);
			container.earl.addEventListener(MouseEvent.CLICK, playFtn);
			container.salt.addEventListener(MouseEvent.CLICK, playFtn);
			container.snodgrass.addEventListener(MouseEvent.CLICK, playFtn);
			container.tommie.addEventListener(MouseEvent.CLICK, playFtn);
			openIBButton.addEventListener(MouseEvent.CLICK,openInfoBox);
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
		
		public function nextFtn(event):void
		{
			narrativeSC.stop();
			infoBoxContainer.parent.removeChild(infoBoxContainer);
			pageTwo();
		}
		
		public function openInfoBox(event:MouseEvent):void
		{
			infoBoxContainer.visible = true;
			openIBButton.visible = false;
			pauseNarrative(event);
		}
		
		public function outFtn(event:MouseEvent):void
		{
			event.target.gotoAndStop(1);
		}
		
		public function overFtn(event:MouseEvent):void
		{
			event.target.gotoAndStop(2);
		}
		
		public function pageOne():void
		{
			infoBoxContainer = new page_05;
			infoBoxContainer.x = 157;
			infoBoxContainer.y = 49;
			addChild(infoBoxContainer);
			infoBoxContainer.play();
			narrative = new DaMh_SAM02_0004;
			narrativeSC = narrative.play();
			narrativeIP = true;
			infoBoxContainer.closeIB.addEventListener(MouseEvent.CLICK,closeInfoBox);
			infoBoxContainer.infoBox.muteBtn.addEventListener(MouseEvent.CLICK,muteNarrative);
			infoBoxContainer.infoBox.muteBtn.addEventListener(MouseEvent.MOUSE_OVER,muteBtnOver);
			infoBoxContainer.infoBox.muteBtn.addEventListener(MouseEvent.MOUSE_OUT,muteBtnOut);
			infoBoxContainer.infoBox.nextBtn.addEventListener(MouseEvent.CLICK,nextFtn);
			infoBoxContainer.infoBox.pauseBtn.addEventListener(MouseEvent.CLICK,pauseNarrative);
			infoBoxContainer.infoBox.pauseBtn.addEventListener(MouseEvent.MOUSE_OVER,pauseOver);
			infoBoxContainer.infoBox.pauseBtn.addEventListener(MouseEvent.MOUSE_OUT,pauseOut);
			infoBoxContainer.infoBox.switchBtn1.gotoAndStop(2);
			infoBoxContainer.infoBox.switchBtn2.gotoAndStop(1);
			narrativeSC.addEventListener(Event.SOUND_COMPLETE,resetNarrative1);
		}
		
		public function pageTwo():void
		{
			infoBoxContainer = new page_06;
			infoBoxContainer.x = 157;
			infoBoxContainer.y = 49;
			addChild(infoBoxContainer);
			infoBoxContainer.play();
			narrative = new DaMh_SAM02_0004B;
			narrativeSC = narrative.play();
			narrativeIP = true;
			infoBoxContainer.closeIB.addEventListener(MouseEvent.CLICK,closeInfoBox);
			infoBoxContainer.infoBox.muteBtn.addEventListener(MouseEvent.CLICK,muteNarrative);
			infoBoxContainer.infoBox.muteBtn.addEventListener(MouseEvent.MOUSE_OVER,muteBtnOver);
			infoBoxContainer.infoBox.muteBtn.addEventListener(MouseEvent.MOUSE_OUT,muteBtnOut);
			infoBoxContainer.infoBox.nextBtn.addEventListener(MouseEvent.CLICK,nextFtn);
			infoBoxContainer.infoBox.pauseBtn.addEventListener(MouseEvent.CLICK,pauseNarrative);
			infoBoxContainer.infoBox.pauseBtn.addEventListener(MouseEvent.MOUSE_OVER,pauseOver);
			infoBoxContainer.infoBox.pauseBtn.addEventListener(MouseEvent.MOUSE_OUT,pauseOut);
			infoBoxContainer.infoBox.prevBtn.addEventListener(MouseEvent.CLICK,prevFtn);
			infoBoxContainer.infoBox.switchBtn1.gotoAndStop(1);
			infoBoxContainer.infoBox.switchBtn2.gotoAndStop(2);
			narrativeSC.addEventListener(Event.SOUND_COMPLETE,resetNarrative2);
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
		
		public function prevFtn(event:MouseEvent):void
		{
			narrativeSC.stop();
			infoBoxContainer.parent.removeChild(infoBoxContainer);
			pageOne();
		}
		
		public function playFtn(event:MouseEvent):void
		{
			event.target.play();
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
		
		public function resetNarrative1(event):void
		{
			infoBoxContainer.parent.removeChild(infoBoxContainer);
			narrativeSC.stop();
			pageTwo();
		}
		
		public function resetNarrative2(event):void
		{
			infoBoxContainer.infoBox.pauseBtn.gotoAndStop(3);
			narrativeIP = false;
			narrativePP = 0;
		}
	}
}