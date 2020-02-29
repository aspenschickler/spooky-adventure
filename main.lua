-- LOADING FILES

require("customizations")

require("game");
require("loadscreen");

require("levels/level1");
require("levels/level2");
require("levels/level3");
require("levels/decision1");
require("levels/level4");
require("levels/level5");
require("levels/levelhauntedhouse1");
require("levels/levelhauntedhouse2");
require("levels/levelhauntedhouse3");
require("levels/levelhauntedhouse4");
require("levels/leveltownsquare1");
require("levels/decision2");
require("levels/leveltownsquaretalk");
require("levels/leveltownsquareclues");
require("levels/decisiontalk");
require("levels/decisionclue");

require("levels/leveltownsquaretalk_path1");
require("levels/leveltownsquaretalk_path2");
require("levels/leveltownsquaretalk_path3");
require("levels/leveltownsquaretalk2");

require("levels/leveltownsquareclue_path1");
require("levels/leveltownsquareclue_path2");
require("levels/leveltownsquareclue_path3");
require("levels/leveltownsquareclue2");

require("levels/decision4");

require("levels/levelforest1");
require("levels/levelforest2");
require("levels/levelcave1");
require("levels/levelcave2");
require("levels/decision_werewolf");
require("levels/levelwerewolf_path1");
require("levels/levelwerewolf_path2");
require("levels/levelwerewolf_path3");
require("levels/levelwerewolf2");

require("levels/levelgraveyard1");
require("levels/levelgraveyard2");
require("levels/levelgraveyard3");
require("levels/levelgraveyard4");
require("levels/decision_zombie");
require("levels/levelzombie_path1");
require("levels/levelzombie_path2");
require("levels/levelzombie2");

require("levels/levelcastlegate1");
require("levels/levelcastlegate2");
require("levels/levelcastlegate3");
require("levels/decision_ready");
require("levels/levelready_path1");
require("levels/levelready_path2");
require("levels/levelfinal1");
require("levels/decision_final");

require("levels/levelfinal_path1_part1");
require("levels/levelfinal_path1_part2");
require("levels/levelfinal_path1_part3");

require("levels/levelfinal_path2_part1");
require("levels/levelfinal_path2_part2");
require("levels/levelfinal_path2_part3");

require("levels/levelfinal_path3_part1");
require("levels/levelfinal_path3_part2");
require("levels/levelfinal_path3_part3");

require("endscreen");

-- LOADING BASICS
function love.load()

initGame();
initLoadScreen();

game_bg_music = love.audio.newSource("res/audio/music/bg1.mp3","stream");

initLevel1();

prev_music = "";

gamestate = 0;
newSceneFlag = 0;
currentLevel = 0;
decisionFlag = 0;
currentDecision = 0;
finalFlag = 0;

talkcluepath = " ";
forestgraveyardpath = " ";
finalpath = " ";

end

-- UPDATE
function love.update(dt)
--require("lib/lovebird").update();

  if newSceneFlag == 1 then
    currentLevel = currentLevel + 1;

  if currentLevel == 1 then
    initLevel2();
  elseif currentLevel == 2 then
    initLevel3();
  elseif currentLevel == 3 then
    initDecision1();
  elseif currentLevel == 4 then
    if currentDecision == 1 then
      currentDecision = 0;
      initLevel4();
    elseif currentDecision == 2 then
      currentDecision = 0;
      initLevel5();
    end
  elseif currentLevel == 5 then
    initLevelHauntedHouse1();
  elseif currentLevel == 6 then
    initLevelHauntedHouse2();
  elseif currentLevel == 7 then
    initLevelHauntedHouse3();
  elseif currentLevel == 8 then
    initLevelHauntedHouse4();
  elseif currentLevel == 9 then
    initLevelTownsquare1();
  elseif currentLevel == 10 then
    initDecision2();
  elseif currentLevel == 11 then
    if currentDecision == 1 then
      currentDecision = 0;
      talkcluepath = "talk";
      initLevelTownsquareTalk();
    elseif currentDecision == 2 then
      currentDecision = 0;
      talkcluepath = "clue";
      initLevelTownsquareClues();
    end
  elseif currentLevel == 12 then
    if talkcluepath == "talk" then
      initDecisionTalk();
    elseif talkcluepath == "clue" then
      initDecisionClue();
    end
  elseif currentLevel == 13 then
    if talkcluepath == "talk" then
      if currentDecision == 1 then
        currentDecision = 0;
        initLevelTownsquareTalkPath1();
      elseif currentDecision == 2 then
        currentDecision = 0;
        initLevelTownsquareTalkPath2();
      elseif currentDecision == 3 then
        currentDecision = 0;
        initLevelTownsquareTalkPath3();
      end
    elseif talkcluepath == "clue" then
      if currentDecision == 1 then
        currentDecision = 0;
        initLevelTownsquareCluePath1();
      elseif currentDecision == 2 then
        currentDecision = 0;
        initLevelTownsquareCluePath2();
      elseif currentDecision == 3 then
        currentDecision = 0;
        initLevelTownsquareCluePath3();
      end
    end
  elseif currentLevel == 14 then
    if talkcluepath == "talk" then
      initLevelTownsquareTalk2();
    elseif talkcluepath == "clue" then
      initLevelTownsquareClue2();
    end
  elseif currentLevel == 15 then
    initDecision4();
  elseif currentLevel == 16 then
    if currentDecision == 1 then
      forestgraveyardpath = "forest";
      currentDecision = 0;
      initLevelForest1();
    elseif currentDecision == 2 then
      forestgraveyardpath = "graveyard";
      currentDecision = 0;
      initLevelGraveyard1();
    end
  elseif currentLevel == 17 then
    if forestgraveyardpath == "forest" then
      initLevelForest2();
    elseif forestgraveyardpath == "graveyard" then
      initLevelGraveyard2();
    end
  elseif currentLevel == 18 then
    if forestgraveyardpath == "forest" then
      initLevelCave1();
    elseif forestgraveyardpath == "graveyard" then
      initLevelGraveyard3();
    end
  elseif currentLevel == 19 then
    if forestgraveyardpath == "forest" then
      initLevelCave2();
    elseif forestgraveyardpath == "graveyard" then
      initLevelGraveyard4();
    end
  elseif currentLevel == 20 then
    if forestgraveyardpath == "forest" then
      initDecisionWerewolf();
    elseif forestgraveyardpath == "graveyard" then
      initDecisionZombie();
    end
  elseif currentLevel == 21 then
    if forestgraveyardpath == "forest" then
      if currentDecision == 1 then
        currentDecision = 0;
        initLevelWerewolfPath1();
      elseif currentDecision == 2 then
        currentDecision = 0;
        initLevelWerewolfPath2();
      elseif currentDecision == 3 then
        currentDecision = 0;
        initLevelWerewolfPath3();
      end
    elseif forestgraveyardpath == "graveyard" then
      if currentDecision == 1 then
        currentDecision = 0;
        initLevelZombiePath1();
      elseif currentDecision == 2 then
        currentDecision = 0;
        initLevelZombiePath2();
      end
    end
  elseif currentLevel == 22 then
    if forestgraveyardpath == "forest" then
      initLevelWerewolf2();
    elseif forestgraveyardpath == "graveyard" then
      initLevelZombie2();
    end
  elseif currentLevel == 23 then
    initLevelCastleGate1();
  elseif currentLevel == 24 then
    initLevelCastleGate2();
  elseif currentLevel == 25 then
    initLevelCastleGate3();
  elseif currentLevel == 26 then
    initDecisionReady();
  elseif currentLevel == 27 then
    if currentDecision == 1 then
      currentDecision = 0;
      initLevelReadyPath1();
    elseif currentDecision == 2 then
      currentDecision = 0;
      initLevelReadyPath2();
    end
  elseif currentLevel == 28 then
    initLevelFinal1();
  elseif currentLevel == 29 then
    initDecisionFinal();
  elseif currentLevel == 30 then
    if currentDecision == 1 then
      currentDecision = 0;
      finalpath = "A";
      initLevelFinal1Path1Part1();
    elseif currentDecision == 2 then
      currentDecision = 0;
      finalpath = "B";
      initLevelFinal1Path2Part1();
    elseif currentDecision == 3 then
      currentDecision = 0;
      finalpath = "C";
      initLevelFinal1Path3Part1();
    end
  elseif currentLevel == 31 then
    if finalpath == "A" then
      initLevelFinal1Path1Part2();
    elseif finalpath == "B" then
      initLevelFinal1Path2Part2();
    elseif finalpath == "C" then
      initLevelFinal1Path3Part2();
    end
  elseif currentLevel == 32 then
    if finalpath == "A" then
      initLevelFinal1Path1Part3();
    elseif finalpath == "B" then
      initLevelFinal1Path2Part3();
    elseif finalpath == "C" then
      initLevelFinal1Path3Part3();
    end
  elseif currentLevel == 33 then
    initEndScreen();
  end

    newSceneFlag = 0;
  end



  if gamestate == 0 then
    doLoadScreenUpdate();
  elseif gamestate == 1 then
    gameUpdate();
  elseif gamestate == 2 then
    doEndScreenUpdate();
  end

end

-- DRAW
function love.draw()

  if gamestate == 0 then
    doLoadScreenDraw()
  elseif gamestate == 1 then
    gameDraw();
  elseif gamestate == 2 then
    doEndScreenDraw();
  end
end

function love.keypressed(key)

  if gamestate == 0 then
    menuKeyPressed(key);
  elseif gamestate == 1 then
    gameKeyPressed(key);
  end

end
