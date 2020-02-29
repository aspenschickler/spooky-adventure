function initLevelHauntedHouse2()

  decisionFlag = 0;

  initCharacters("res/images/backgrounds/haunted_inside.jpg", charA_imagepath, charD_imagepath);
  initDialogue("res/dialogue/dialogue1.1.txt");
  if sansFlag == 1 then
    initSounds("res/audio/voices/voiceA.mp3", "res/audio/voices/talking1.wav", "res/audio/music/megalovania.mp3");
  else
    initSounds("res/audio/voices/voiceA.mp3", "res/audio/voices/voiceD.mp3", "res/audio/music/bg_villain.mp3");
  end
end
