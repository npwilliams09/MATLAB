function cost = energyCalc(modSize,eff,solarExp,req)
    nrgArr = modSize*(solarExp/3.6)*eff;

    nrgArr = nrgArr - req;
    cost = zeros(1,12);
    avgMonth = 30.42; %avg days in a month
    gridCost = 0.28; %cost of power from grid
    gridDebit = 0.113;%amount paid for selling power to the grid

    for i = 1:size(nrgArr)
        x = nrgArr(i);
        if x < 0 %underproducing/buying from griid, +cost
            cost(i) = cost(i) - (gridCost * x * avgMonth); %adds cost of grid draw
        elseif x > 0 %overproducing/selling to grid, -cost
            cost(i) = cost(i) - (gridDebit * x * avgMonth); %substracts cost of selling
        end
    end

end