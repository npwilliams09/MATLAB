%% Birthday Prob
clc;
clear;
%% variables
numPeople = 100;
numSims = 1000;
%% script
matchArray = zeros(1,numPeople);
for i = 1:1:numPeople
    for j = 1:1:numSims       
        birthdays = randi(365,1,i);
        if (length(birthdays) ~= length(unique(birthdays)))
            matchArray(1,i) = matchArray(1,i) + 1;
            
        end
    end
end

probability = (matchArray/numSims);

x = 1:1:numPeople;

%% Curve
figure(1)
plot(x,probability, '*')
xlabel('Number of People')
ylabel('Probability of Match')
title('Birthday Paradox')
hold on

f_lim = find(probability == 1);
x = [1:1:f_lim(1)-1];
f = probability(1 : f_lim(1)-1);

f_scaled = log(abs(f-1));

coeffs = polyfit((x.^2), f_scaled, 1);

t = 1 - exp(coeffs(2))*exp(coeffs(1)*x.^2);

plot (x, t, 'r')

b = probability>=.50;
g50 = (length(probability))-length(probability(b))+1;
c = probability>=.99;
g99 = (length(probability))-length(probability(c))+1;

txt50 = [sprintf('\n \\leftarrow A match probability of 50%%\n      is reach at a group of %1.0f',g50)];
text(g50,probability(g50), txt50)
plot(g50,probability(g50), 'mo')

txt99 = [sprintf('\n\n\\uparrow A match probability of 99%%\nis reached at a group size of %1.0f' , g99)];
plot(g99,probability(g99), 'mo')
text(g99,probability(g99), txt99)


hold off



