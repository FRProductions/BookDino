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
	
	public class dinopg10 extends MovieClip
	{
		public var dino:MovieClip;
		public var headers:MovieClip;
		public var infoBoxContainer:MovieClip;
		public var myTransform:SoundTransform = SoundMixer.soundTransform;
		public var narrativeCF:int;
		public var narrativeIP:Boolean;
        public var narrativePP:Number;
		public var narrative:Sound;
		public var narrativeSC:SoundChannel;
		public var openIBButton:MovieClip;
		public var pageLoader:Loader;
		public var urlRequest:URLRequest;
		
		public function dinopg10()
		{
			container.stop();
			dino = new Para_01;
			dino.x = 567.25;
            dino.y = 356.90;
			headers = new header1;
			headers.x = 567.25;
			headers.y = 100;
			infoBoxContainer = new page_13;
			infoBoxContainer.x = 170;
			infoBoxContainer.y = 49;
			openIBButton = new openIB;
			openIBButton.x = 170;
			openIBButton.y = 49;
			openIBButton.visible = false;
			container.addChild(dino);
			container.addChild(openIBButton);
			container.addChild(infoBoxContainer);
			container.addChild(headers);
			container.setChildIndex(dino, container.numChildren - 10);			
			infoBoxContainer.play();
			narrative = new DaMh_SAM02_0011();
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
			if(container.contains(dino))
			{
				container.removeChild(dino);
			}
			if(container.contains(headers))
			{
				container.removeChild(headers);
			}
			
			container.gotoAndStop(1);
			
			dino = new Para_01;
			dino.x = 567.25;
            dino.y = 356.90;
			
			headers = new header1;
			headers.x = 567.25;
			headers.y = 100;
			headers.addEventListener(MouseEvent.CLICK,headerClick);
			headers.addEventListener(MouseEvent.MOUSE_OUT,headerOut);
			headers.addEventListener(MouseEvent.MOUSE_OVER,headerOver);
			
			container.addChild(dino);
			container.addChild(headers);
			container.setChildIndex(dino, container.numChildren - 10);
			
			dino.play();
		}
		
		public function dino3Ftn(event:MouseEvent):void
		{
			if(container.contains(dino))
			{
				container.removeChild(dino);
			}
			if(container.contains(headers))
			{
				container.removeChild(headers);
			}
			
			container.gotoAndStop(100);
			
			dino = new Cory_01;
			dino.x = 567.25;
            dino.y = 356.90;
			
			headers = new header2;
			headers.x = 567.25;
			headers.y = 100;
			headers.addEventListener(MouseEvent.CLICK,headerClick);
			headers.addEventListener(MouseEvent.MOUSE_OUT,headerOut);
			headers.addEventListener(MouseEvent.MOUSE_OVER,headerOver);
			
			container.addChild(dino);
			container.addChild(headers);
			container.setChildIndex(dino, container.numChildren - 10);
			
			dino.play();
		}
		
		public function dino4Ftn(event:MouseEvent):void
		{
			if(container.contains(dino))
			{
				container.removeChild(dino);
			}
			if(container.contains(headers))
			{
				container.removeChild(headers);
			}
			
			container.gotoAndStop(200);
			
			dino = new Paki_01;
			dino.x = 567.25;
            dino.y = 356.90;
			
			headers = new header3;
			headers.x = 567.25;
			headers.y = 100;
			headers.addEventListener(MouseEvent.CLICK,headerClick);
			headers.addEventListener(MouseEvent.MOUSE_OUT,headerOut);
			headers.addEventListener(MouseEvent.MOUSE_OVER,headerOver);
			
			container.addChild(dino);
			container.addChild(headers);
			container.setChildIndex(dino, container.numChildren - 10);
			
			dino.play();
		}
		
		public function headerClick(event:MouseEvent):void
		{
			if(headers.currentFrame == 3)
			{
				headers.gotoAndStop(1);
			}
			else
			{
				headers.gotoAndStop(3);
			}
		}
		
		public function headerOut(event:MouseEvent):void
		{
			headers.gotoAndStop(1);
		}
		
		public function headerOver(event:MouseEvent):void
		{
			headers.gotoAndStop(2);
		}
		
		public function kid1Ftn(event:MouseEvent):void
		{
			container.kid1.play();
		}
		
		public function kid2Ftn(event:MouseEvent):void
		{
			container.kid2.play();
		}
		
		public function kid3Ftn(event:MouseEvent):void
		{
			container.kid3.play();
		}
		
		public function kid4Ftn(event:MouseEvent):void
		{
			container.kid4.play();
		}
		
		public function kid5Ftn(event:MouseEvent):void
		{
			container.kid5.play();
		}
		
		public function loadEvents():void
		{
			container.bushBtn.addEventListener(MouseEvent.CLICK,dino1Ftn);
			container.dino2Btn.addEventListener(MouseEvent.CLICK,dino2Ftn);
			container.dino3Btn.addEventListener(MouseEvent.CLICK,dino3Ftn);
			container.dino4Btn.addEventListener(MouseEvent.CLICK,dino4Ftn);
			container.kid1.addEventListener(MouseEvent.CLICK,kid1Ftn);
			container.kid2.addEventListener(MouseEvent.CLICK,kid2Ftn);
			container.kid3.addEventListener(MouseEvent.CLICK,kid3Ftn);
			container.kid4.addEventListener(MouseEvent.CLICK,kid4Ftn);
			container.kid5.addEventListener(MouseEvent.CLICK,kid5Ftn);
			headers.addEventListener(MouseEvent.CLICK,headerClick);
			headers.addEventListener(MouseEvent.MOUSE_OUT,headerOut);
			headers.addEventListener(MouseEvent.MOUSE_OVER,headerOver);
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