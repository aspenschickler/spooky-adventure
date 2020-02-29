function initCharacters(backgroundPath, char1Path, char2Path)

  background = love.graphics.newImage(backgroundPath);

  characterSet = {
    character1 = love.graphics.newImage(char1Path),
    character1_alpha = .7,
    character1_x = love.graphics.getWidth() * 0.02,
    character1_y = love.graphics.getHeight() * 0.35,
    character2 = love.graphics.newImage(char2Path),
    character2_alpha = .7,
    character2_x = love.graphics.getWidth() * 0.75,
    character2_y = love.graphics.getHeight() * 0.35,
  }

end

function characterDraw()

  love.graphics.setColor(1, 1, 1, 1);
  love.graphics.draw(background, 0, 0);

  love.graphics.setColor(1, 1, 1, characterSet.character1_alpha);
  love.graphics.draw(characterSet.character1, characterSet.character1_x, characterSet.character1_y, 0, 0.5, 0.5);

  love.graphics.setColor(1, 1, 1, characterSet.character2_alpha);
  love.graphics.draw(characterSet.character2, characterSet.character2_x, characterSet.character2_y, 0, 0.5, 0.5);
end
