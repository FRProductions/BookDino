﻿package com
{
	import flash.display.Loader;
	import flash.display.MovieClip;
	import flash.events.*;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.media.SoundMixer;
	import flash.media.SoundTransform;
	import flash.net.URLRequest;
	
	public class dinopg09 extends MovieClip
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
		public var pageLoader:Loader;
		
		public function dinopg09()
		{
			container.play();
			infoBoxContainer = new page_12;
			infoBoxContainer.x = 100;
			infoBoxContainer.y = 70;
			openIBButton = new openIB;
			openIBButton.x = 100;
			openIBButton.y = 70;
			openIBButton.visible = false;
			container.addChild(openIBButton);
			container.addChild(infoBoxContainer);
			container.setChildIndex(infoBoxContainer, container.numChildren - 5);			
			infoBoxContainer.play();
			narrative = new DaMh_SAM02_0010;
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
		
		public function dino1Ftn(event:MouseEvent):void
		{
			container.dino1.play();
		}
		
		public function dino2Ftn(event:MouseEvent):void
		{
			container.dino2.play();
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
		
		public function kid1Ftn(event:MouseEvent):void
		{
			container.kid1.play();
		}
		
		public function kid2Ftn(event:MouseEvent):void
		{
			container.kid2.play();
			container.dino2.play();
		}
		
		public function loadEvents():void
		{
			container.ballBtn.addEventListener(MouseEvent.CLICK,dino2Ftn);
			container.dino1.addEventListener(MouseEvent.CLICK,dino1Ftn);
			container.header1.addEventListener(MouseEvent.CLICK,headerClick);
			container.header1.addEventListener(MouseEvent.MOUSE_OUT,headerOut);
			container.header1.addEventListener(MouseEvent.MOUSE_OVER,headerOver);
			container.header2.addEventListener(MouseEvent.CLICK,headerClick);
			container.header2.addEventListener(MouseEvent.MOUSE_OUT,headerOut);
			container.header2.addEventListener(MouseEvent.MOUSE_OVER,headerOver);
			container.kid1.addEventListener(MouseEvent.CLICK,kid1Ftn);
			container.kid2.addEventListener(MouseEvent.CLICK,kid2Ftn);
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