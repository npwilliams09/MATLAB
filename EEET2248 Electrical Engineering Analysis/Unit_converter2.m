%Lectorial 2
%Unit Conversion

clear;
clc;
%%
%farenheit to celcius conversions
%variables
test1 = 100;
test2 = 0;
test3 = 32;
test4 = -40;
test5 = 55;

%script

test1 = (test1 - 32) * (5/9)
test2 = (test2 - 32) * (5/9)
test3 = (test3 - 32) * (5/9)
test4 = (test4 - 32) * (5/9)
test5 = (test5 - 32) * (5/9)
%%
%metric to imperial

%celcius to farenheit
CtoFtest = 25;
CtoFtest = (CtoFtest*(9/5)) + 32

%cm to inches
CMtoINtest = 20;
CMtoINtest = CMtoINtest/2.54

%grams to ounces
GtoOZtest = 214;
GtoOZtest = GtoOZtest/28.3495

%km/h to mph
KPHtoMPHtest = 100;
KPHtoMPHtest = KPHtoMPHtest/1.609344

%litres to gallons
LtoGtest = 8;
LtoGtest = LtoGtest/3.78544

%hectares to acres
HtoAtest = 30;
HtoAtest = HtoAtest*2.4711

%metres to ft
MtoFTtest = 1.94;
MtoFTtest = MtoFTtest/0.3048

%km to miles
KMtoMtest = 8;
KMtoMtest = KMtoMtest/1.609344

%kg to pounds
KGtoLBStest = 86;
KGtoLBStest = KGtoLBStest/0.4536

%%
%imperial to metric

%inch to cm
CMtoINtest = CMtoINtest * 2.54

%feet to metres
MtoFTtest = MtoFTtest *0.3048

%miles to km
KMtoMtest = KMtoMtest *1.609344

%ounces to grams
GtoOZtest = GtoOZtest * 28.3495

%pounds to kg
KGtoLBStest = KGtoLBStest*0.4536

%mph to kph
KPHtoMPHtest = KPHtoMPHtest * 1.609344

%Gallons to Litres
LtoGtest = LtoGtest*3.78544

%acres to hectares
HtoAtest = HtoAtest/2.4711

%%
%example using functions
%{ 
%script
disp('Test Data');
a = FtoC(test1)
b = FtoC(test2)
c = FtoC(test3)
d = FtoC(test4)
e = FtoC(test5)

%functions
    %Farenheit to celcius
    function c = FtoC(f)
        c = (f - 32) * (5/9);
    end
    
    %cm to inches
    function c = CMtoIN(cm)
        c = cm/2.54;
    end
    
    %grams to ounces
    function c = GtoOZ(g)
        c = g/28.3495;
    end
    
    %km/h to mph
    function c = KPHtoMPH(km)
        c = km/1.609344;
    end
    
    %litres to gallons
    function c = LtoG(L)
        c = L/3.78544;
    end
    
    %hectare to acre
    function c = HAtoA(ha)
        c = ha*2.4711;
    end
    %}