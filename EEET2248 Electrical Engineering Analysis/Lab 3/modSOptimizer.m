function x = modSOptimizer(x,solarExp,eff,req)
    stop = 0;
    while (stop ~= 1)
        a = x - 0.25;
        ac = energyCalc(a,eff,solarExp,req);
        
        b = x + 0.25
        bc = energyCalc(b,eff,solarExp,req)
        
        if (ac < bc)
            y = a;
            disp('a');
        else
            y = b
            disp('b');
        end
        
        if energyCalc(y,eff,solarExp,req) < energyCalc(x,eff,solarExp,req)
            x = y;
        
            stop = 1;
        end
    end
end