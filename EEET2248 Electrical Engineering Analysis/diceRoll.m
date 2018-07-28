%% dice roll simulator
clc;
clear;

numTrials = 100000;

results = zeros(1,12);

for i = 1:1:numTrials 
    dice1 = randi(6);
    dice2 = randi(6);
    index = dice1 + dice2;
    results(index) = results(index) + 1;
end

percent = (results/numTrials) * 36;

figure(1)
bar(1:1:12,percent)
xlabel('Numbers')
ylabel('Outcome %')
title('Results of rolling 2 die')