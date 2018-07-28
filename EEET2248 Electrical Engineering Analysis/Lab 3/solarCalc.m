function modSize = solarCalc(exposure,eff,energy)
   modSize = energy/(eff*(exposure/3.6));
   modSize = ceil(modSize * 4) / 4;
end