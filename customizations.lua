function initCharacterNames()

  charA_name = "Jackson";
  charB_name = "John";
  charC_name = "Estefenia";
  charD_name = "Zach";

end

function initCharacterImages(sFlag)

  charA_imagepath = "res/images/characters/boy_skeleton.png";
  charB_imagepath = "res/images/characters/boy_mummy.png";
  charC_imagepath = "res/images/characters/girl_cat.png";
  if sFlag == 1 then
    charD_imagepath = "res/images/characters/sans.png";
  else
    charD_imagepath = "res/images/characters/pumpking.png";
  end
end
