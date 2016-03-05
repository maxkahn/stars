package
{
    import flash.display.*;
    import flash.text.*;
    import flash.events.Event;

    [SWF(frameRate = "50", width = "640", height = "480")]

    public class Main extends Sprite
    {
        public var allStars:Array = [];

        public var  stat:TextField = new TextField();

        public function moveAllStars(event:Event):void {
            var starsNum:uint = allStars.length;
            for (var i:int = 0; i < starsNum; i++) {
                allStars[i].moveStar();
            }
        }

        public function generateStars(event:Event):void {
            //if there are 2x as many stars as pixels on the stage, adding a new star is unnoticeable
            if (allStars.length < stage.stageWidth * stage.stageHeight * 2) {
                //10 is a magic number. Number of stars increases monotonically until it hits maximum,
                //this constant increases the rate of change. Chosen for aesthetic reasons.
                for (var j:int = 0; j < 10; j++) {
                    var someStar:Star = new Star(stage.stageWidth / 2, stage.stageHeight / 2);
                    allStars.push(someStar);
                    this.addChild(someStar);
                }
                stat.text = "Number of stars is: " + allStars.length 
                    + "\n" + "Frame rate is: " + stage.frameRate + 'fps';
            }


        }

        public function Main ()
        {
            var statFormat:TextFormat = new TextFormat();
            statFormat.color = 0x00FF00;
            statFormat.size = 24;
            statFormat.align = TextFormatAlign.LEFT;

            stat.multiline = true;
            stat.autoSize = TextFieldAutoSize.RIGHT;
            stat.width = 200;
            stat.height = 100;
            stat.x = stage.stageWidth - 50;
            stat.y = stage.stageHeight - 75;
            stat.setTextFormat(statFormat);
            stat.defaultTextFormat = statFormat;
            

            this.addChild(stat);

            //creates black background
            graphics.beginFill( 0x000000 );
            graphics.drawRect(0, 0, stage.stageWidth, stage.stageHeight );
            graphics.endFill();

            stage.addEventListener(Event.ENTER_FRAME, moveAllStars);
            stage.addEventListener(Event.ENTER_FRAME, generateStars);
        }
    }
}