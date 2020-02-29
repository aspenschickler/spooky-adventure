require("impl/characters");
require("impl/dialogue");
require("impl/sounds");
require("impl/decisions");
function initGame()

  sansFlag = 0;

  initCharacterNames();

  if charD_name == "Sans" then
    sansFlag = 1;
  end

  initCharacterImages(sansFlag);

  initDecisions("res/dialogue/decision1.txt");
  --initLevel1();

end

function gameUpdate()

  setSpeakerVoice();
  if game_bg_music == prev_music then
    game_bg_music:resume();
  else
    game_bg_music:play();
  end

  if decisionFlag == 0 then

    if dialogueBox.animation_values.animation_flag then
      soundSet.talkingSound:play();
    elseif dialogueBox.animation_values.animation_flag == false then
      soundSet.talkingSound:pause();
    end

    doDialogueUpdate();
  elseif decisionFlag == 1 then

    decisionsUpdate();

  end

end

function gameDraw()

  if decisionFlag == 0 then

    -- Debug
    love.graphics.setColor(.3, 1, .3, 100);
    love.graphics.print(tostring(dialogueBox.animation_values.animation_flag), 0, 0);
    love.graphics.print(tostring(dialogueBox.animation_values.rowTwoFlag), 0, 20);
    love.graphics.print(tostring(dialogueBox.animation_values.dialogueSpeed), 0, 40);
    love.graphics.print(tostring(dialogueBox.animation_values.termination_time), 0, 60);
    love.graphics.print(tostring(talkingSound), 0, 80);

    characterDraw();
    doDialogueDraw();

  elseif decisionFlag == 1 then

    characterDraw();
    decisionsDraw();

  end

end

function gameKeyPressed(key)

  if decisionFlag == 0 then
    if key == "space" and dialogueBox.animation_values.animation_flag == false then
      -- Animation resetting
      dialogueBox.animation_values.visibility = 100;
      dialogueBox.animation_values.x = dialogueBox.x;
      dialogueBox.animation_values.y = dialogueBox.y;
      dialogueBox.animation_values.dialogueSpeed = 7;
      dialogueBox.animation_values.animation_flag = true;
      dialogueBox.animation_values.rowTwoFlag = true;

      dialogueBox.animation_values.animation_time_start = love.timer.getTime();

      -- Updates dialogue
      dialogueUpdate();
    elseif key == "space" and dialogueBox.animation_values.animation_flag == true then
      dialogueBox.animation_values.visibility = 0;
      dialogueBox.animation_values.rowTwoFlag = false;
      dialogueBox.animation_values.animation_flag = false;
    end
  elseif decisionFlag == 1 then
    if key == "up" and decisionBox.choice > 1 then
      decisionBox.choice = decisionBox.choice - 1;
      decisionBox.selector_h = decisionBox.selector_h - 30;
    end
    if key == "down" and decisionBox.choice < 3 then
      decisionBox.choice = decisionBox.choice + 1;
      decisionBox.selector_h = decisionBox.selector_h + 30;
    end
    if key == "return" then
      currentDecision = decisionBox.choice;
      game_bg_music:pause();
      newSceneFlag = 1;
    end
  end
end
