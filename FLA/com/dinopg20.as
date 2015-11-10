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
	
	public class dinopg20 extends MovieClip
	{
		public var currentPage:int = 1;
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
		
		public function dinopg20()
		{
			container.play();
			openIBButton = new openIB;
			openIBButton.x = 147.10;
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
			container.dino1.addEventListener(MouseEvent.CLICK, playFtn);
			container.dino2.addEventListener(MouseEvent.CLICK, playFtn);
			container.dino3.addEventListener(MouseEvent.CLICK, playFtn);
			openIBButton.addEventListener(MouseEvent.CLICK,openInfoBox);
		}
		
		public function muteBtnOut(event:MouseEvent):void
		{
			if(myTransform.volume == 1)
			{
				infoBoxContainer.muteBtn.gotoAndStop(1);
			}
		}
		
		public function muteBtnOver(event:MouseEvent):void
		{
			if(myTransform.volume == 1)
			{
				infoBoxContainer.muteBtn.gotoAndStop(2);
			}
		}
		
		public function muteNarrative(event:MouseEvent):void
		{
			if(myTransform.volume == 0)
			{
				myTransform.volume = 1;
				infoBoxContainer.muteBtn.gotoAndStop(1);
			}
			else
			{
				myTransform.volume = 0;
				infoBoxContainer.muteBtn.gotoAndStop(3);
			}
            
            SoundMixer.soundTransform = myTransform;
		}
		
		public function nextFtn(event):void
		{
			narrativeSC.stop();
			infoBoxContainer.parent.removeChild(infoBoxContainer);
			
			if(currentPage == 2)
			{
				pageThree();
			}
			else if(currentPage == 1)
			{
				pageTwo();
			}
			else
			{
				pageOne();
			}
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
			currentPage = 1;
			infoBoxContainer = new page_23;
			infoBoxContainer.x = 146.95;
			infoBoxContainer.y = 37.75;
			addChild(infoBoxContainer);
			infoBoxContainer.play();
			narrative = new DaMh_SAM02_0024_1;
			narrativeSC = narrative.play();
			narrativeIP = true; 
			infoBoxContainer.closeIB.addEventListener(MouseEvent.CLICK,closeInfoBox);
			infoBoxContainer.muteBtn.addEventListener(MouseEvent.CLICK,muteNarrative);
			infoBoxContainer.muteBtn.addEventListener(MouseEvent.MOUSE_OVER,muteBtnOver);
			infoBoxContainer.muteBtn.addEventListener(MouseEvent.MOUSE_OUT,muteBtnOut);
			infoBoxContainer.nextBtn.addEventListener(MouseEvent.CLICK,nextFtn);
			infoBoxContainer.pauseBtn.addEventListener(MouseEvent.CLICK,pauseNarrative);
			infoBoxContainer.pauseBtn.addEventListener(MouseEvent.MOUSE_OVER,pauseOver);
			infoBoxContainer.pauseBtn.addEventListener(MouseEvent.MOUSE_OUT,pauseOut);
			infoBoxContainer.radio1.gotoAndStop(2);
			infoBoxContainer.radio2.gotoAndStop(1);
			infoBoxContainer.radio3.gotoAndStop(1);
			narrativeSC.addEventListener(Event.SOUND_COMPLETE,resetNarrative1);
		}
		
		public function pageTwo():void
		{
			currentPage = 2;
			infoBoxContainer = new page_24;
			infoBoxContainer.x = 146.95;
			infoBoxContainer.y = 37.75;
			addChild(infoBoxContainer);
			infoBoxContainer.play();
			narrative = new DaMh_SAM02_0024_2;
			narrativeSC = narrative.play();
			narrativeIP = true;
			infoBoxContainer.closeIB.addEventListener(MouseEvent.CLICK,closeInfoBox);
			infoBoxContainer.muteBtn.addEventListener(MouseEvent.CLICK,muteNarrative);
			infoBoxContainer.muteBtn.addEventListener(MouseEvent.MOUSE_OVER,muteBtnOver);
			infoBoxContainer.muteBtn.addEventListener(MouseEvent.MOUSE_OUT,muteBtnOut);
			infoBoxContainer.nextBtn.addEventListener(MouseEvent.CLICK,nextFtn);
			infoBoxContainer.pauseBtn.addEventListener(MouseEvent.CLICK,pauseNarrative);
			infoBoxContainer.pauseBtn.addEventListener(MouseEvent.MOUSE_OVER,pauseOver);
			infoBoxContainer.pauseBtn.addEventListener(MouseEvent.MOUSE_OUT,pauseOut);
			infoBoxContainer.prevBtn.addEventListener(MouseEvent.CLICK,prevFtn);
			infoBoxContainer.radio1.gotoAndStop(1);
			infoBoxContainer.radio2.gotoAndStop(2);
			infoBoxContainer.radio3.gotoAndStop(1);
			narrativeSC.addEventListener(Event.SOUND_COMPLETE,resetNarrative2);
		}
		
		public function pageThree():void
		{
			currentPage = 3;
			infoBoxContainer = new page_25;
			infoBoxContainer.x = 146.95;
			infoBoxContainer.y = 37.75;
			addChild(infoBoxContainer);
			infoBoxContainer.play();
			narrative = new DaMh_SAM02_0024_3;
			narrativeSC = narrative.play();
			narrativeIP = true;
			infoBoxContainer.closeIB.addEventListener(MouseEvent.CLICK,closeInfoBox);
			infoBoxContainer.muteBtn.addEventListener(MouseEvent.CLICK,muteNarrative);
			infoBoxContainer.muteBtn.addEventListener(MouseEvent.MOUSE_OVER,muteBtnOver);
			infoBoxContainer.muteBtn.addEventListener(MouseEvent.MOUSE_OUT,muteBtnOut);
			infoBoxContainer.pauseBtn.addEventListener(MouseEvent.CLICK,pauseNarrative);
			infoBoxContainer.pauseBtn.addEventListener(MouseEvent.MOUSE_OVER,pauseOver);
			infoBoxContainer.pauseBtn.addEventListener(MouseEvent.MOUSE_OUT,pauseOut);
			infoBoxContainer.prevBtn.addEventListener(MouseEvent.CLICK,prevFtn);
			infoBoxContainer.radio1.gotoAndStop(1);
			infoBoxContainer.radio2.gotoAndStop(1);
			infoBoxContainer.radio3.gotoAndStop(2);
			narrativeSC.addEventListener(Event.SOUND_COMPLETE,resetNarrative3);
		}
		
		public function pauseNarrative(event:MouseEvent):void
		{
			if(narrativeIP) 
			{
				infoBoxContainer.pauseBtn.gotoAndStop(3);
				infoBoxContainer.stop();
				narrativePP = narrativeSC.position;
				narrativeSC.stop();
				narrativeCF = infoBoxContainer.currentFrame;
        		narrativeIP = false;
    		} 
			else 
			{
				infoBoxContainer.pauseBtn.gotoAndStop(1);
				
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
				infoBoxContainer.pauseBtn.gotoAndStop(1);
			}
			else
			{
				infoBoxContainer.pauseBtn.gotoAndStop(3);
			}
		}
		
		public function pauseOver(event:MouseEvent):void
		{
			if(narrativeIP) 
			{
				infoBoxContainer.pauseBtn.gotoAndStop(2);
			}
			else
			{
				infoBoxContainer.pauseBtn.gotoAndStop(4);
			}
		}
		
		public function playFtn(event:MouseEvent):void
		{
			event.target.play();
		}
		
		public function prevFtn(event:MouseEvent):void
		{
			narrativeSC.stop();
			infoBoxContainer.parent.removeChild(infoBoxContainer);
			
			if(currentPage == 3)
			{
				pageTwo();
			}
			else if(currentPage == 2)
			{
				pageOne();
			}
			else
			{
				pageThree();
			}
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
			infoBoxContainer.parent.removeChild(infoBoxContainer);
			narrativeSC.stop();
			pageThree();
		}
		
		public function resetNarrative3(event):void
		{
			infoBoxContainer.pauseBtn.gotoAndStop(3);
			narrativeIP = false;
			narrativePP = 0;
		}
	}
}