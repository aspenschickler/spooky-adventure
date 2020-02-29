function initSounds(char1Voice, char2Voice, bgMusic)

  if bgMusic ~= prev_music then
    game_bg_music = love.audio.newSource(bgMusic,"stream");
  end

  prev_music = bgMusic;

  soundSet = {
    character1_voice = love.audio.newSource(char1Voice, "static"),
    character2_voice = love.audio.newSource(char2Voice, "static"),
    talkingSound = love.audio.newSource("res/audio/voices/voiceA.mp3", "static"),
    narrator_voice = love.audio.newSource("res/audio/voices/voiceN.mp3", "static")
  }

end

function setSpeakerVoice()

  if dialogueBox.dialogueSide == "left" then
    soundSet.talkingSound = soundSet.character1_voice;
  elseif dialogueBox.dialogueSide == "right" then
    soundSet.talkingSound = soundSet.character2_voice;
  elseif dialogueBox.dialogueSide == "narrator" then
    soundSet.talkingSound = soundSet.narrator_voice;
  end

end
