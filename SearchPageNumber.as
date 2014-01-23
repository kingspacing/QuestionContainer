package
{
	import flash.display.*;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.events.TextEvent;
	import flash.events.TimerEvent;
	import flash.system.Capabilities;
	import flash.text.*;
	import flash.utils.Timer;
	
	import greensock.TweenLite;
	
	public class SearchPageNumber extends Sprite
	{
		private var _container:Vector.<TextField> = new Vector.<TextField>(10);
		private var _btnX:int = 0;
		private var _btnY:int = 0;
		private var _thePreContaierName:String = "";
		private var _curIndex:int = -1;
		private var _preIndex:int = -1;		
		private var _bg:Sprite = new Sprite();
		private var _emptyBox:Sprite;
		
		
		public function SearchPageNumber()
		{
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.displayState = StageDisplayState.NORMAL;
			stage.align = StageAlign.TOP_LEFT;
			stage.frameRate = 24;
			
			_bg.graphics.beginFill(0x000000, 1);
			_bg.graphics.drawRect(0,0,1024,708);
			_bg.graphics.endFill();
			this.addChild(_bg);
		
			for (var i:int=9; i >=0; i--)
			{
				_container[i] = new TextField();
				_container[i].name = "txt" + i;
				_container[i].x = _btnX;
				_container[i].y = _btnY + (9-i) * 40;
				_container[i].width = 100;
				_container[i].height = 30;
				_container[i].border = true;
				_container[i].background = true;
				_container[i].backgroundColor = 0x00FF000;
				_bg.addChild(_container[i]);
				_container[i].addEventListener(MouseEvent.CLICK, onContainerClick);
			}
			
			_emptyBox = new Sprite();
			_emptyBox.graphics.beginFill(0x0000FF,1);
			_emptyBox.graphics.drawRect(0,0,100,30);
			_emptyBox.graphics.endFill();
			_emptyBox.x = 0;
			_emptyBox.y = 400;
			_emptyBox.visible = false;
			this.addChild(_emptyBox);
		}
		
		private function onContainerClick(event:MouseEvent):void
		{
			var name:String = event.target.name;
			for (var i:int=0; i < _container.length; i++)
			{
				if (_container[i].name == name)
				{
					this._curIndex = i;
					break;
				}
			}
			trace (name);
			
			var _temp:Number = _container[_curIndex].y;
			if (_container[_curIndex].y > _emptyBox.y)
			{
				for (var k:int=_curIndex; k<10;k++)
				{
					if (_container[k].y > _emptyBox.y)
					{
						TweenLite.to(_container[k], 0.5, {y : _container[k].y - 40});
					}
				}
				_emptyBox.y = _temp;
			}
			else
			{
				for (var j:int=0;j<=_curIndex;j++)
				{
					if (_container[j].y < _emptyBox.y)
					{
						TweenLite.to(_container[j], 0.5, {y : _container[j].y + 40});
					}
				}
				_emptyBox.y = _temp;
			}
			
		}
		
	}
}
