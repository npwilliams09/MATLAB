%Lab 3
%Solar Radiation
clc;
clear;

%%
%script

%import spreadsheets
darwin = xlsread("solar_data_darwin.xlsx");
melbourne = xlsread("solar_data_melbourne.xlsx");

%format darwin data
darwinDate = datenum(darwin(:,1),darwin(:,2),darwin(:,3));
darwinSolarExp = darwin(:,4);
xlimit1a = round(size(darwinDate)*(3/4));
xlimit1b = size(darwinDate);
limits1 = [darwinDate(xlimit1a(1)) darwinDate(xlimit1b(1))];

%format melb data
melbDate = datenum(melbourne(:,1),melbourne(:,2),melbourne(:,3));
melbSolarExp = melbourne(:,4);
xlimit2a = round(size(melbDate)*(3/4));
xlimit2b = size(melbDate);
limits2 = [melbDate(xlimit2a(1)) melbDate(xlimit2b(1))];


%plot darwin
figure(1)
plot(darwinDate, darwinSolarExp, '.')
hold on
plot(darwinDate, 5*cos(darwinDate/55 + 10) + 23,'LineWidth',1.5)
datetick('x','yyyy')
ylabel('Solar Exposure (MJ/m*m)')
xlabel('Year')
xlim(limits1)
title('Darwin')
ylim([0 40])



%plot melb
figure(2)
plot(melbDate, melbSolarExp, '.')
hold on
plot(melbDate, 15*cos(melbDate/55 + 10) + 20,'LineWidth',1.5)
datetick('x', 'yyyy')
ylabel('Solar Exposure (MJ/m*m)')
xlabel('Year')
xlim(limits2)
ylim([0 40])
title('Melbourne')

%monthly averages
DarStatArray = grpstats(darwin,darwin(:,2),'mean');
MelStatArray = grpstats(melbourne,melbourne(:,2),'mean');

%plot darwin monthly avg
figure(3)
bar(DarStatArray(:,2),DarStatArray(:,4),'r')
xlabel('Month')
ylabel('Avg Solar Exposure (MJ/m*m)')
title('Darwin Average Monthly Solar Exposure')

%plot melb monthly avg
figure(4)
bar(MelStatArray(:,2),MelStatArray(:,4),'r')
xlabel('Month')
ylabel('Avg Solar Exposure (MJ/m*m)')
title('Melbourne Average Monthly Solar Exposure')

%set efficiency
eff = 0.6; %median of range
energyReq = 6; %kwh required for the house

%mean exp for year
meanDarSolarExp = mean(DarStatArray(:,4));
meanMelSolarExp = mean(MelStatArray(:,4));

%calc mod sizes
MelModS = solarCalc(meanMelSolarExp,eff,energyReq);
DarModS = solarCalc(meanDarSolarExp,eff,energyReq);

%calc cost
DarCost = energyCalc(DarModS,eff,DarStatArray(:,4),energyReq);
MelCost = energyCalc(MelModS,eff,MelStatArray(:,4),energyReq);

%plot costs each month
figure(5) %dar cost
bar(1:1:12,DarCost,'g')
xlabel('Month')
ylabel('Cost ($AUD)')
title('Darwin Home Average Cost per Month')

figure(6) %mel cost
bar(1:1:12,MelCost,'g')
xlabel('Month')
ylabel('Cost ($AUD)')
title('Melbourne Home Average Cost per Month')

fprintf('The Darwin home would need a module size of %g kW\n',DarModS);
fprintf('The Melbourne home would need a module size of %g kW\n',MelModS);