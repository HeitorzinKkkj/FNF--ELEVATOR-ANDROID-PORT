import openfl.Lib;
import funkin.backend.utils.WindowUtils;

var shit:FlxSprite;
var text:FunkinText;

var camera:FlxCamera = camGame;
var cameraHUD:FlxCamera = camHUD;

var cameraAngle:Bool = false;

var weones:Bool = false;

static var windowtitle:String = "ELEVATOR :D";

function create()
    {
        WindowUtils.resetTitle();
        window.title = windowtitle;

        shit = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.WHITE);
        shit.cameras = [camHUD];
        add(shit);

        text = new FunkinText(0,0,0,"SONG BY: ",35);
        text.cameras = [camHUD];
        text.setFormat(Paths.font("comici.TTF"), 35, FlxColor.BLACK);
        text.screenCenter();
        text.alpha = 0;
        add(text);
    }

function postCreate()
    {
        scoreTxt.setFormat(Paths.font("comici.TTF"), 20, FlxColor.BLACK);
        missesTxt.setFormat(Paths.font("comici.TTF"), 20, FlxColor.BLACK);
        accuracyTxt.setFormat(Paths.font("comici.TTF"), 20, FlxColor.BLACK);

        accuracyTxt.visible = false;

        iconP1.visible = false;
        iconP2.visible = false;
        healthBarBG.visible = false;

        healthBar.createFilledBar(0x00000000, 0xFF156B00);
        healthBar.x = -70;
        healthBar.y = healthBar.y + 15;
        healthBar.scale.x = 0.4;
    }

function update()
    {
        scoreTxt.x = -160;
        missesTxt.x = -100;

        if (cameraAngle)
            {
                camera.angle -= 0.1;
                camera.zoom += 0.01;
            }
        else
            {
                camera.angle = 0;
            }
    }


function beatHit(beat:Int)
    {
        if (weones)
            {

            }
    }

function stepHit(step:Int) {
    switch (step){
        case 0:
            text.alpha = 1;
            text.text = "SONG BY:";
        case 15:
            text.alpha = 1;
            text.text = "SONG BY: \n 4centt \n Frank \n Kalpy19";
        case 32:
            text.alpha = 1;
            text.text = "SPRITES BY:";
        case 48:
            text.alpha = 1;
            text.text = "SPRITES BY: \n 4centt \n Plageee \n Arcad3k";
        case 63:
            text.alpha = 1;
            text.text = "CHART BY:";
        case 80:
            text.alpha = 1;
            text.text = "CHART BY: \n JustDery";
        case 95:
            text.alpha = 1;
            text.text = "CODE BY:";
        case 112:
            text.alpha = 1;
            text.text = "CODE BY: \n ROBERTO";
        case 124:
            text.alpha = 1;
            text.setFormat(Paths.font("comici.TTF"), 45, FlxColor.BLACK);
            text.text = "ELEVATOR!";
        case 126:
            FlxTween.tween(text, { alpha: 0.0 }, 0.5);
            shit.acceleration.y = FlxG.random.float(620, 680);
            shit.angularAcceleration = FlxG.random.float(-70, 70);
        case 480:
            cameraAngle = true;
        case 512:
            cameraAngle = false;
    }
}

function onSongEnd()
    {
        Lib.current.stage.window.close();
    }