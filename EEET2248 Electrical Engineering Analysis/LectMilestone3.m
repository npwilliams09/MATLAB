%Lectorial 2 milestone
%Unit Conversion with input

clear;
clc;

%%
%script
us = 'units'; %unit string initialisation
os = 'units'; %original unit string initialisation


inputCtr1 = 0;
inputCtr2 = 0;

fprintf('Welcome to the Unit Converter\n');
fprintf('For Metric enter "m"\n');
fprintf('For Impreial enter "i"\n');



while (inputCtr1 < 1)    
    x = input('Enter INITIAL unit system:','s');
    
    if strcmp(x,'m')
        
        fprintf('\nFor Celcius enter "c"\n');
        fprintf('For Centimetres enter "cm"\n');
        fprintf('For Metres enter "m"\n');
        fprintf('For Kilometres enter "km"\n');
        fprintf('For Grams enter "g"\n');
        fprintf('For Kilograms enter "kg"\n');
        fprintf('For Kilometres per hour enter "kmh"\n');
        fprintf('For Litres enter "l"\n');
        fprintf('For Hectares enter "ha"\n\n');
        
        while (inputCtr2 < 1)
            y = input('Enter INITIAL unit type:','s');
            z = input('\nEnter unit quantity:');
            o = z;

            [z,us,os,unitError,qtyError] = UnitConvert(x,y,z);

            if(unitError == 1) %invalid unit type input
                fprintf('\nInvalid Unit Type Input: "%s"\n', y);
                fprintf('Please Try again \n\n');
                continue
            elseif(qtyError == 1)
                fprintf('\nInvalid Unit Quantity Input: "%s"\n', o);
                fprintf('Please ensure input unit is a positive integer (unless inputting temperature)\n');
                fprintf('Please Try again \n\n');
            else 
                inputCtr2 = 1;%increment
            end
        end

        inputCtr1 = 1;%increment loop counter
        
    end

    if strcmp(x,'i')

        fprintf('\nFor Farenheit enter "f"\n');
        fprintf('For Inches enter "i"\n');
        fprintf('For Feet enter "ft"\n');
        fprintf('For Miles enter "m"\n');
        fprintf('For Ounces enter "oz"\n');
        fprintf('For Pounds enter "lbs"\n');
        fprintf('For Miles per hour enter "mph"\n');
        fprintf('For Gallons enter "g"\n');
        fprintf('For Acres enter "a"\n\n');
        
        while (inputCtr2 < 1)
            y = input('Enter INITIAL unit type:','s');
            z = input('\nEnter unit quantity:');
            o = z;

            [z,us,os,unitError,qtyError] = UnitConvert(x,y,z);
            
            if(unitError == 1) %invalid unit type input
                fprintf('\nInvalid Unit Type Input: "%s"\n', y);
                fprintf('Please Try again \n\n');
                continue
            elseif(qtyError == 1)
                fprintf('\nInvalid Unit Quantity Input: "%s"\n', o);
                fprintf('Please ensure input unit quantity is positive (unless inputting temperature)\n');
                fprintf('Please Try again \n\n');
            else 
                inputCtr2 = 1;%increment
            end
            
            inputCtr1 = 1;%increment loop counter
        end

    end

    if ((strcmp(x,'m') ~= 1) && (strcmp(x,'i') ~= 1))
        fprintf('\nInvalid Input: "%s"\n', x);
        fprintf('Please Try Again \n\n');

    else
        fprintf('\n%g %s is equal to %g %s \n',o,os,z,us);
    end
end



   