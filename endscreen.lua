function initEndScreen()
  endmsg = love.graphics.newImage("res/images/menu/endmsg.png");
  end_bg_music = love.audio.newSource("res/audio/music/bg1.mp3","stream");
  gamestate = 2;
end

function doEndScreenUpdate()

  end_bg_music:play();

end

function doEndScreenDraw()

  -- love.graphics.setBackgroundColor(169, 169, 169, 1);
  love.graphics.setColor(1, 1, 1, 1);
  love.graphics.draw(menu_title1, 310, 200, 0, 1.5, 2);
  love.graphics.draw(menu_title2, 290, 400, 0, 1.5, 2);
  love.graphics.draw(endmsg, (0.5 * love.graphics.getWidth()) - 200, 600, 0, 1.2, 1.2);


end
