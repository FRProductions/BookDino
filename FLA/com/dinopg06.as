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
	
	public class dinopg06 extends MovieClip
	{
		public var chew:Sound;
		public var chewSC:SoundChannel;
		public var volcano1:Sound;
		public var volcano1SC:SoundChannel;
		public var volcano2:Sound;
		public var volcano2SC:SoundChannel;
		public var currentDino:int = 1;
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
		
		public function dinopg06()
		{
			chew                 = new BRONTO_CHEW;
			chewSC               = chew.play(0,9999);
			container.dino1.play();
			container.dino3.stop();			
			infoBoxContainer     = new page_09;
			infoBoxContainer.x   = 157.1;
			infoBoxContainer.y   = 49;
			openIBButton         = new openIB;
			openIBButton.x       = 157.1;
			openIBButton.y       = 49;
			openIBButton.visible = false;
			addChild(openIBButton);
			addChild(infoBoxContainer);
			infoBoxContainer.play();
			narrative            = new DaMh_SAM02_0007;
			narrativeSC          = narrative.play();
			narrativeIP          = true;
			pageLoader           = new Loader();
			volcano1             = new Thunder_Dry_Rumbles;
			volcano1SC           = volcano1.play();
			volcano2             = new Rumble;
			volcano2SC           = volcano2.play();
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
		
		public function headerClick1(event:MouseEvent):void
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
		
		public function headerClick2(event:MouseEvent):void
		{
			if(event.target.currentFrame >= 3)
			{
				event.target.gotoAndStop(1);
			}
			else
			{
				event.target.gotoAndPlay(3);
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
		
		public function loadEvents():void
		{
			container.dino1.addEventListener(MouseEvent.CLICK,dino1Ftn);
			container.bush.addEventListener(MouseEvent.CLICK,switchDino);
			container.tree.addEventListener(MouseEvent.CLICK,dino2Ftn);
			infoBoxContainer.infoBox.closeIB.addEventListener(MouseEvent.CLICK,closeInfoBox);
			infoBoxContainer.infoBox.muteBtn.addEventListener(MouseEvent.CLICK,muteNarrative);
			infoBoxContainer.infoBox.muteBtn.addEventListener(MouseEvent.MOUSE_OVER,muteBtnOver);
			infoBoxContainer.infoBox.muteBtn.addEventListener(MouseEvent.MOUSE_OUT,muteBtnOut);
			infoBoxContainer.infoBox.pauseBtn.addEventListener(MouseEvent.CLICK,pauseNarrative);
			infoBoxContainer.infoBox.pauseBtn.addEventListener(MouseEvent.MOUSE_OVER,pauseOver);
			infoBoxContainer.infoBox.pauseBtn.addEventListener(MouseEvent.MOUSE_OUT,pauseOut);
			narrativeSC.addEventListener(Event.SOUND_COMPLETE,resetNarrative);
			openIBButton.addEventListener(MouseEvent.CLICK,openInfoBox);
			school.addEventListener(MouseEvent.CLICK,schoolClick);
			school.addEventListener(MouseEvent.MOUSE_OUT,schoolOut);
			school.addEventListener(MouseEvent.MOUSE_OVER,schoolOver);
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
			
			chewSC.stop();
			narrativeSC.stop();
			volcano1SC.stop();
			volcano2SC.stop();
			removeChild(container);
		}
		
		public function resetNarrative(event):void
		{
			infoBoxContainer.infoBox.pauseBtn.gotoAndStop(3);
			narrativeIP = false;
			narrativePP = 0;
		}
		
		public function schoolClick(event:MouseEvent):void
		{
			if(event.target.currentFrame >= 3)
			{
				event.target.gotoAndStop(1);
			}
			else
			{
				event.target.gotoAndPlay(3);
			}
		}
		
		public function schoolOut(event:MouseEvent):void
		{
			event.target.gotoAndStop(1);
		}
		
		public function schoolOver(event:MouseEvent):void
		{
			event.target.gotoAndStop(2);
		}
		
		public function switchDino(event:MouseEvent):void
		{
			if(currentDino == 1)
			{
				container.bush.salt1.play();
				currentDino = 2;
			}
			else if(currentDino == 2)
			{
				container.bush.salt2.play();
				currentDino = 3;
			}
			else
			{
				container.bush.salt3.play();
				currentDino = 1;
			}
		}
	}
}