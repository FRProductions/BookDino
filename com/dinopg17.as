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
	
	public class dinopg17 extends MovieClip
	{
		public var clickCount1;
		public var clickCount2;
		public var infoBoxContainer:MovieClip;
		public var myTransform:SoundTransform = SoundMixer.soundTransform;
		public var narrativeCF:int;
		public var narrativeIP:Boolean;
        public var narrativePP:Number;
		public var narrative:Sound;
		public var narrativeSC:SoundChannel;
		public var openIBButton:MovieClip;
		public var pageLoader:Loader;
		
		public function dinopg17()
		{
			clickCount1 = 1;
			clickCount2 = 1;
			infoBoxContainer = new page_20;
			infoBoxContainer.x = 280;
			infoBoxContainer.y = 170;
			openIBButton = new openIB;
			openIBButton.x = 280;
			openIBButton.y = 170;
			openIBButton.visible = false;
			container.addChild(openIBButton);
			container.addChild(infoBoxContainer);
			//container.setChildIndex(infoBoxContainer, container.numChildren - 5);			
			infoBoxContainer.play();
			narrative = new DaMh_SAM02_0018;
			narrativeSC = narrative.play();
			narrativeIP = true;
			pageLoader = new Loader();
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
		
		public function dinoFtn(event:MouseEvent):void
		{
			container.dinos.play();
			container.slidingHeaders.play();
			
			if(clickCount2 >= 3)
			{
				clickCount2 = 1;
			}
			else
			{
				clickCount2++;
			}
			
			if(clickCount2 == 1)
			{
				container.slidingHeaders.addEventListener(MouseEvent.CLICK,headerClick);
				container.slidingHeaders.addEventListener(MouseEvent.MOUSE_OUT,headerOut);
				container.slidingHeaders.addEventListener(MouseEvent.MOUSE_OVER,headerOver); 
			}
			else
			{
				container.slidingHeaders.removeEventListener(MouseEvent.CLICK,headerClick);
				container.slidingHeaders.removeEventListener(MouseEvent.MOUSE_OUT,headerOut);
				container.slidingHeaders.removeEventListener(MouseEvent.MOUSE_OVER,headerOver);
			}
		}
		
		public function duckyFtn(event:MouseEvent):void
		{
			if(clickCount1 == 1)
			{
				container.dino1.play();
				clickCount1 = 2;
			}
			else
			{
				container.fred.play();
				clickCount1 = 1;
			}
		}
		
		public function headerClick(event:MouseEvent):void
		{
			if(event.target.currentFrame == 3)
			{
				event.target.gotoAndStop(1);
			}
			else
			{
				event.target.gotoAndStop(3);
			}
		}
		
		public function headerOut(event:MouseEvent):void
		{
			event.target.gotoAndStop(1);
		}
		
		public function headerOver(event:MouseEvent):void
		{
			event.target.gotoAndStop(2);
		}
		
		public function loadEvents():void
		{   
			container.dinos.addEventListener(MouseEvent.CLICK,dinoFtn);
			container.ducky.addEventListener(MouseEvent.CLICK,duckyFtn);
			container.header2.addEventListener(MouseEvent.CLICK,headerClick);
			container.header2.addEventListener(MouseEvent.MOUSE_OUT,headerOut);
			container.header2.addEventListener(MouseEvent.MOUSE_OVER,headerOver); 
			container.header3.addEventListener(MouseEvent.CLICK,headerClick);
			container.header3.addEventListener(MouseEvent.MOUSE_OUT,headerOut);
			container.header3.addEventListener(MouseEvent.MOUSE_OVER,headerOver);
			container.ruby.addEventListener(MouseEvent.CLICK,rubyFtn);
			container.slidingHeaders.addEventListener(MouseEvent.CLICK,headerClick);
			container.slidingHeaders.addEventListener(MouseEvent.MOUSE_OUT,headerOut);
			container.slidingHeaders.addEventListener(MouseEvent.MOUSE_OVER,headerOver);  
			infoBoxContainer.infoBox.closeIB.addEventListener(MouseEvent.CLICK,closeInfoBox);
			infoBoxContainer.infoBox.muteBtn.addEventListener(MouseEvent.CLICK,muteNarrative);
			infoBoxContainer.infoBox.muteBtn.addEventListener(MouseEvent.MOUSE_OVER,muteBtnOver);
			infoBoxContainer.infoBox.muteBtn.addEventListener(MouseEvent.MOUSE_OUT,muteBtnOut);
			infoBoxContainer.infoBox.pauseBtn.addEventListener(MouseEvent.CLICK,pauseNarrative);
			infoBoxContainer.infoBox.pauseBtn.addEventListener(MouseEvent.MOUSE_OVER,pauseOver);
			infoBoxContainer.infoBox.pauseBtn.addEventListener(MouseEvent.MOUSE_OUT,pauseOut);
			narrativeSC.addEventListener(Event.SOUND_COMPLETE,resetNarrative);
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
		
		public function rubyFtn(event:MouseEvent):void
		{
			event.target.play();
			container.dino2.play();
		}
	}
}