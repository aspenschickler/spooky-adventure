function initDecisions(decision_filepath)

  decisionBox = {
    x = love.graphics.getWidth() * 0.125,
    y = love.graphics.getHeight() * 0.75,
    width = love.graphics.getWidth() * 0.75,
    height = love.graphics.getHeight() * 0.20,
    currentFont = love.graphics.newFont("res/fonts/ashcanbb_reg.ttf", 28),
    currentText = love.graphics.newText(love.graphics.newFont("res/fonts/ashcanbb_reg.ttf", 28), "You're not supposed to see this."),

    choice = 1;

    choice_count = 4,

    currentSet = {},

    selector_h = love.graphics.getHeight() * 0.75 + 20,

    }

    decisionRender(decision_filepath);

    if finalFlag == 1 then
      decisionBox.currentSet[2] = string.gsub(decisionBox.currentSet[2], "%[B%]", charB_name);
      decisionBox.currentSet[2] = string.gsub(decisionBox.currentSet[2], "%[C%]", charC_name);
      decisionBox.currentSet[3] = string.gsub(decisionBox.currentSet[3], "%[B%]", charB_name);
      decisionBox.currentSet[3] = string.gsub(decisionBox.currentSet[3], "%[C%]", charC_name);
    end

    choice1Text = love.graphics.newText(decisionBox.currentFont, decisionBox.currentSet[1]);
    choice2Text = love.graphics.newText(decisionBox.currentFont, decisionBox.currentSet[2]);
    choice3Text = love.graphics.newText(decisionBox.currentFont, decisionBox.currentSet[3]);

end

function decisionsUpdate()

end

function decisionsDraw()

  love.graphics.setColor(1, 1, 1, 1);
  love.graphics.rectangle("fill", decisionBox.x, decisionBox.y, decisionBox.width, decisionBox.height);

  love.graphics.setColor(0, 0, 0, 1);
  love.graphics.draw(choice1Text, decisionBox.x + 20, decisionBox.y + 20);
  love.graphics.draw(choice2Text, decisionBox.x + 20, decisionBox.y + 50);
  love.graphics.draw(choice3Text, decisionBox.x + 20, decisionBox.y + 80);

  -- DRAW SELECTOR
  love.graphics.setColor(.5,.5,.5, .4);
  love.graphics.rectangle("fill", decisionBox.x + 10, decisionBox.selector_h, decisionBox.width - 20, 30)
end

function decisionRender(decision_path)

  for line in love.filesystem.lines(decision_path) do
    table.insert(decisionBox.currentSet, line);
  end

end
