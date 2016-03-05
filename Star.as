package {
  import flash.display.*;

  public class Star extends Shape {
            public var xpos:Number ;
            public var ypos:Number;

            //random x and y steps, so that step has random direction and magnitude
            //4/3 because stageWidth/stageHeight = 4/3 -> normalizes speed along the axes
            public var xdir:Number = 4 * (Math.random() * 2 - 1);
            public var ydir:Number = 3 * (Math.random() * 2 - 1);

            public function Star(hor:Number, vert:Number) {
                this.xpos = hor;
                this.ypos = vert;
            }

            public function moveStar():void {
              if (this.xpos >= 0 && this.xpos <= stage.stageWidth && this.ypos >= 0 && this.ypos <= stage.stageHeight) {
                this.xpos = this.xpos + this.xdir;
                this.ypos = this.ypos + this.ydir;
              }
              else {
                //if star leaves the stage, recycle it as a new star appearing at the origin
                this.xpos = (stage.stageWidth / 2) +  this.xdir;
                this.ypos = (stage.stageHeight / 2) + this.ydir;
              }
              this.graphics.clear();
                this.graphics.beginFill(0xFFFFFF);
                this.graphics.drawRect(this.xpos, this.ypos, 1, 1);
                this.graphics.endFill();
            }
  }
}