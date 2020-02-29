function initLoadScreen()
  menu_flag = false;
  menu_bg_music = love.audio.newSource("res/audio/music/bg1.mp3","stream");
  menu_title1 = love.graphics.newImage("res/images/menu/menu_title1.png");
  menu_title2 = love.graphics.newImage("res/images/menu/menu_title2.png");
  continuemsg = love.graphics.newImage("res/images/menu/continuemsg.png");

end

function doLoadScreenUpdate()

  menu_bg_music:play();

end

function doLoadScreenDraw()

  -- love.graphics.setBackgroundColor(169, 169, 169, 1);
  love.graphics.draw(menu_title1, 310, 200, 0, 1.5, 2);
  love.graphics.draw(menu_title2, 290, 400, 0, 1.5, 2);
  love.graphics.draw(continuemsg, (0.5 * love.graphics.getWidth()) - 250, 600, 0, 0.4, 0.4);


end

function menuKeyPressed(key)

  if key == "return" then
    menu_bg_music:stop();
    dialogueBox.animation_values.animation_time_start = love.timer.getTime();
    gamestate = 1;
  end

end
