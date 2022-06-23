package;

import flixel.*;
import flixel.text.FlxText;
import flixel.tweens.FlxTween;
import flixel.util.*;
import flixel.graphics.FlxGraphic;
import flixel.ui.FlxButton;
import flixel.addons.ui.FlxUIButton;

class PoyoMainMenuState extends MusicBeatState
{
  //Defining Variables
  var StoryMode:FlxSprite;
  var FreePlay:FlxSprite;
  var Options:FlxSprite;
  var Credits:FlxSprite;
  var BackGround:FlxSprite;
    override public function create():Void
    {
      BackGround = new FlxSprite(0, 0).loadGraphic(Paths.image('menuDesat'));
      BackGround.color = 0xFF2b2e94;
      BackGround.updateHitbox();
      add(BackGround);
      //Adding the Stuff
      StoryMode = new FlxSprite(0, 0);
      StoryMode.frames = Paths.getSparrowAtlas('mainmenu/menu_story_mode');
      StoryMode.animation.addByPrefix('idle', 'story_mode basic', 24, false);
      StoryMode.animation.addByPrefix('press', 'story_mode white', 24, false);
      StoryMode.animation.play('idle');
      add(StoryMode);
      
      FreePlay = new FlxSprite(1280 + -629, 0);
      FreePlay.frames = Paths.getSparrowAtlas('mainmenu/menu_freeplay');
      FreePlay.animation.addByPrefix('idle', 'freeplay basic', 24, false);
      FreePlay.animation.addByPrefix('press', 'freeplay white', 24, false);
      FreePlay.animation.play('idle');
      add(FreePlay);
      
      Options = new FlxSprite(0, 720 + -163);
      Options.frames = Paths.getSparrowAtlas('mainmenu/menu_options');
      Options.animation.addByPrefix('idle', 'options basic', 24, false);
      Options.animation.addByPrefix('press', 'options white', 24, false);
      Options.animation.play('idle');
      add(Options);
      
      Credits = new FlxSprite(1280 + -585, 720 + -155);
      Credits.frames = Paths.getSparrowAtlas('mainmenu/menu_credits');
      Credits.animation.addByPrefix('idle', 'credits basic', 24, false);
      Credits.animation.addByPrefix('press', 'credits white', 24, false);
      Credits.animation.play('idle');
      add(Credits);
      
      super.create();
    }

    override public function update(elapsed:Float):Void
    {
      #if mobile
        for (touch in FlxG.touches.list)
        {
            if (touch.overlaps(StoryMode) && touch.justPressed)
            {
              MusicBeatState.switchState(new StoryMenuState());
            }
            
            if (touch.overlaps(FreePlay) && touch.justPressed)
            {
              MusicBeatState.switchState(new FreeplayState());
            }
            
            if (touch.overlaps(Options) && touch.justPressed)
            {
              LoadingState.loadAndSwitchState(new options.OptionsState());
            }
            
            if (touch.overlaps(Credits) && touch.justPressed)
            {
              MusicBeatState.switchState(new CreditsState());
            }
        }
      #else
        if (FlxG.mouse.overlaps(StoryMode) && FlxG.mouse.justPressed)
        {
          MusicBeatState.switchState(new StoryMenuState());
        }
        
        if (FlxG.mouse.overlaps(FreePlay) && FlxG.mouse.justPressed)
        {
          MusicBeatState.switchState(new FreeplayState());
        }
        
        if (FlxG.mouse.overlaps(Options) && FlxG.mouse.justPressed)
        {
          LoadingState.loadAndSwitchState(new options.OptionsState());
        }
        
        if (FlxG.mouse.overlaps(Credits) && FlxG.mouse.justPressed)
        {
          MusicBeatState.switchState(new CreditsState());
        }
        #end
      
        super.update(elapsed);
    }
}