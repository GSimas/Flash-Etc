﻿package  {	import flash.display.Sprite;	import flash.events.*;	import flash.geom.Rectangle;	public class Control extends Sprite {		public function Control(size:Number,lineColor:uint,radius:Number,ballColor:uint,contentToShow:Sprite,arrows:Boolean) {			var aSizePercent:Number = size/100			var aContentPercent:Number = (contentToShow.height-size)/100			var speed:Number = 0						contentToShow.x = 20																	var my_mask:Sprite = new Sprite												my_mask.graphics.lineStyle(0);			my_mask.graphics.beginFill(0x000000);			my_mask.graphics.drawRect(20,0,contentToShow.width,size);			my_mask.graphics.endFill();						addChild(my_mask)				contentToShow.mask = my_mask;			addChild(contentToShow)						var myLine:Sprite = new Sprite			addChild(myLine)					myLine.graphics.lineStyle(1, lineColor, 1);			myLine.graphics.moveTo(0,0); 			myLine.graphics.lineTo(0, size);								var myBall:Sprite = new Sprite			addChild(myBall)				myBall.graphics.lineStyle(1, ballColor, 1);			myBall.graphics.beginFill(ballColor);			myBall.graphics.drawCircle(0,0,radius);			myBall.graphics.endFill();						myBall.buttonMode = true;						var boundsRect:Rectangle = new Rectangle(0, 0, 0, size);			myBall.addEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);			myBall.addEventListener(MouseEvent.MOUSE_UP, mouseUpHandler);			myBall.addEventListener(MouseEvent.ROLL_OUT, mouseUpHandler);			function mouseDownHandler(evt:MouseEvent):void{				myBall.startDrag(false,boundsRect);				addEventListener(Event.ENTER_FRAME,changePosition);			}			function mouseUpHandler(evt:MouseEvent):void{				myBall.stopDrag();				removeEventListener(Event.ENTER_FRAME,changePosition);			}						function changePosition(event:Event) {				contentToShow.y =(aContentPercent*(myBall.y/aSizePercent))*-1							}			if (arrows){				var arrow1:Sprite = new Sprite						arrow1.graphics.lineStyle(1, ballColor, 1);				arrow1.graphics.beginFill(ballColor);				arrow1.graphics.moveTo(0,0); 				arrow1.graphics.lineTo(10, 15);					arrow1.graphics.lineTo(-10, 15);				arrow1.graphics.lineTo(0, 0);				arrow1.graphics.endFill();				addChild(arrow1)				arrow1.x = contentToShow.width+40								var arrow2:Sprite = new Sprite						arrow2.graphics.lineStyle(1, ballColor, 1);				arrow2.graphics.beginFill(ballColor);				arrow2.graphics.moveTo(0,0); 				arrow2.graphics.lineTo(10, -15);					arrow2.graphics.lineTo(-10, -15);				arrow2.graphics.lineTo(0, 0);				arrow2.graphics.endFill();				addChild(arrow2)				arrow2.x = contentToShow.width+40				arrow2.y = size-3								arrow1.addEventListener(MouseEvent.MOUSE_DOWN, up);				arrow2.addEventListener(MouseEvent.MOUSE_DOWN, down);					arrow1.addEventListener(MouseEvent.MOUSE_UP, stopNow);				arrow2.addEventListener(MouseEvent.MOUSE_UP, stopNow);					function up(evt:MouseEvent):void{					speed = 5				addEventListener(Event.ENTER_FRAME,changePosition2);				}								function down(evt:MouseEvent):void{					speed = -5				addEventListener(Event.ENTER_FRAME,changePosition2);			}								function stopNow(evt:MouseEvent):void{					speed = 0				removeEventListener(Event.ENTER_FRAME,changePosition2);			}												function changePosition2(event:Event) {					var newPos:Number = contentToShow.y + speed					if  (newPos>0){						newPos = 0					}					if  (newPos<(contentToShow.height-size)*-1){						newPos = (contentToShow.height-size)*-1					}					myBall.y = aSizePercent*((contentToShow.y/aContentPercent)*-1)					contentToShow.y = newPos				}			}		}	}	}