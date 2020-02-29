function initDialogue(newPath)

  dialogueBox = {
    x = love.graphics.getWidth() * 0.125,
    y = love.graphics.getHeight() * 0.75,
    width = love.graphics.getWidth() * 0.75,
    height = love.graphics.getHeight() * 0.20,
    currentFont = love.graphics.newFont("res/fonts/ashcanbb_reg.ttf", 28),

    currentSet = {},
    dialogueCounter = 1,
    dialogueSide = "narrator",

    animation_values = {x = 0, y = 0, animation_flag = false,
                        dialogueSpeed = 7, visibility = 100, rowTwoFlag = true,
                        animation_time_start = love.timer.getTime(), termination_time},

  }

  dialogueBox.currentText = love.graphics.newText(dialogueBox.currentFont, "You're not supposed to see this.");

  dialogueRender(newPath);
  dialogueUpdate();

  -- Animation initialization
  dialogueBox.animation_values.visibility = 100;
  dialogueBox.animation_values.x = dialogueBox.x;
  dialogueBox.animation_values.y = dialogueBox.y;
  dialogueBox.animation_values.dialogueSpeed = 7;
  dialogueBox.animation_values.animation_flag = true;
  dialogueBox.animation_values.rowTwoFlag = true;

end

function doDialogueDraw()

  dialogueBoxDraw();
  dialogueBoxAnimate();

end

function doDialogueUpdate()

  -- If flag is true, dialogue animation values are affected
  if dialogueBox.animation_values.animation_flag then

    if love.timer.getTime() - dialogueBox.animation_values.animation_time_start < dialogueBox.animation_values.termination_time then
      if dialogueBox.animation_values.x < dialogueBox.x + dialogueBox.width - 10 then
        dialogueBox.animation_values.x = dialogueBox.animation_values.x + dialogueBox.animation_values.dialogueSpeed;
        if dialogueBox.animation_values.y == dialogueBox.y + 55 then
          dialogueBox.animation_values.rowTwoFlag = false;
        end

      elseif dialogueBox.animation_values.x >= dialogueBox.x + dialogueBox.width - 10 and dialogueBox.animation_values.y == dialogueBox.y then
        dialogueBox.animation_values.x = dialogueBox.x;
        dialogueBox.animation_values.y = dialogueBox.y + 55;

      elseif dialogueBox.animation_values.x >= dialogueBox.x + dialogueBox.width - 10 and dialogueBox.animation_values.y == dialogueBox.y + 55 then
        dialogueBox.animation_values.animation_flag = false;

      end

    elseif love.timer.getTime() - dialogueBox.animation_values.animation_time_start >= dialogueBox.animation_values.termination_time then
      dialogueBox.animation_values.animation_flag = false;
    end

  end

end

function getSide()

end

function getSpeaker()

end

function dialogueRender(textFilepath)

  for line in love.filesystem.lines(textFilepath) do
    table.insert(dialogueBox.currentSet, line);
  end

end

function dialogueUpdate()

  -- dialogueBox.currentText:setFont(dialogueBox.currentFont);
  if dialogueBox.currentSet[dialogueBox.dialogueCounter] ~= nil then
    tempString = dialogueBox.currentSet[dialogueBox.dialogueCounter];

  elseif dialogueBox.currentSet[dialogueBox.dialogueCounter] == nil then
    game_bg_music:pause();
    newSceneFlag = 1;
  end

  tempSide = string.sub(tempString, 1, -string.len(tempString));
  -- "tempText" contains both the speaker and the dialogue
  tempText = string.sub(tempString, 2);

  love.graphics.print(charA_name);

  tempText = string.gsub(tempText, "%[A%]", charA_name);
  tempText = string.gsub(tempText, "%[B%]", charB_name);
  tempText = string.gsub(tempText, "%[C%]", charC_name);
  tempText = string.gsub(tempText, "%[D%]", charD_name);

  if dialogueBox.dialogueCounter == 1 then
    dialogueBox.animation_values.termination_time = string.len(tempText) * 0.140;
  else
    dialogueBox.animation_values.termination_time = string.len(tempText) * 0.041;
  end

  -- determines the side where the talking is taking place (only designed for two characters so far)
  if tempSide == "L" then
    dialogueBox.dialogueSide = "left";
    characterSet.character1_alpha = 1;
    characterSet.character2_alpha = 0.7;
  elseif tempSide == "R" then
    dialogueBox.dialogueSide = "right";
    characterSet.character1_alpha = 0.7;
    characterSet.character2_alpha = 1;
  elseif tempSide == "N" then
    dialogueBox.dialogueSide = "narrator";
    characterSet.character1_alpha = 0.7;
    characterSet.character2_alpha = 0.7;
  end

  dialogueBox.currentText:setf(tempText, dialogueBox.width - 20, "left");
  dialogueBox.dialogueCounter = dialogueBox.dialogueCounter + 1;

end

function dialogueBoxDraw()

  love.graphics.setColor(1, 1, 1, 100);
  love.graphics.rectangle("fill", dialogueBox.x, dialogueBox.y, dialogueBox.width, dialogueBox.height);

  if dialogueBox.dialogueSide == "left" then
    love.graphics.setColor(1, 1, 1, 100);
    love.graphics.polygon("fill", dialogueBox.x, dialogueBox.y - 30, dialogueBox.x, dialogueBox.y, dialogueBox.x + 30, dialogueBox.y);
  elseif dialogueBox.dialogueSide == "right" then
    love.graphics.setColor(1, 1, 1, 100);
    love.graphics.polygon("fill", dialogueBox.x + dialogueBox.width, dialogueBox.y - 30, dialogueBox.x + dialogueBox.width, dialogueBox.y, dialogueBox.x + dialogueBox.width - 30, dialogueBox.y);
  elseif dialogueBox.dialogueSide == "narrator" then
    love.graphics.setColor(1, 1, 1, 100);
  end
  -- Set font color before drawing text.
  love.graphics.setColor(0, 0, 0, 100);
  love.graphics.draw(dialogueBox.currentText, dialogueBox.x + 20, dialogueBox.y + 20);

end

function dialogueBoxAnimate()
  love.graphics.setColor(1, 1, 1, dialogueBox.animation_values.visibility);
  --                            Vertice 1                                                       Vertice 2                                                            Vertice 3                                                               Vertice 4
  love.graphics.polygon("fill", dialogueBox.animation_values.x, dialogueBox.animation_values.y, dialogueBox.animation_values.x, dialogueBox.animation_values.y + 55, dialogueBox.x + dialogueBox.width, dialogueBox.animation_values.y + 55, dialogueBox.x + dialogueBox.width, dialogueBox.animation_values.y);

  if dialogueBox.animation_values.rowTwoFlag then
    love.graphics.polygon("fill", dialogueBox.x, dialogueBox.y + 55, dialogueBox.x, dialogueBox.y + 110, dialogueBox.x + dialogueBox.width, dialogueBox.y + 110, dialogueBox.x + dialogueBox.width, dialogueBox.y + 55);
  end

end
