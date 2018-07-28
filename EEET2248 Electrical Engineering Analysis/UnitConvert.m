function [z,us,os,error1,error2] = UnitConvert(x,y,z)
    error1 = 0;
    error2 = 0;
    us = 'units';
    os = 'units';
   
    if(isempty(z)) %check if z is empty
        error2 = 1;
        return; %end function and return errors
    end
    
    if (z < 0 && ((strcmp(y,'f') == 0) && (strcmp(y,'c') == 0))) %check z is positive, unless temp is being input 
        error2 = 1;
        return; %end function and return errors
    end
    
    if strcmp(x,'m') 
        switch y
            case 'c'
                %celcius to f
                us = 'degrees Farenheit';
                z = (z*(9/5)) + 32;
                os = 'degrees Celcius';

            case 'cm'
                %cm to inch
                us = 'inches';
                z = z/2.54;
                os = 'cm';

            case 'm'
                %metres to feet
                us = 'feet';
                z = z/0.3048;
                os = 'm';

            case 'km'
                %km to miles
                us = 'miles';
                z = z/1.609344;
                os = 'km';

            case 'g'
                %grams to ounces
                us = 'oz';
                z = z/28.3495;
                os = 'g';

            case 'kg'
                %kg to lbs
                us = 'lbs';
                z = z/0.4536;
                os = 'kg';

            case 'kmh'
                %km/h to mph
                us = 'mi/h';
                z = z/1.609344;
                os = 'km/h';

            case 'l'
                %litres to gallons
                us = 'gallons';
                z = z/3.78544;
                os = 'litres';

            case 'ha'
                %hectares to acres
                us = 'acres';
                z = z*2.4711;
                os = 'ha';

            otherwise
                error1 = 1;
                
        end
        
    elseif strcmp(x,'i')
        switch y
            case 'f'
                %farenheit to celcius
                us = 'degrees Celcius';
                z = (z - 32) * (5/9);
                os = 'degrees Farenheit';

            case 'i'
                %inches to cm
                us = 'cm';
                z = z*2.54;
                os = 'inches';

            case 'ft'
                %feet to metres
                us = 'metres';
                z = z*0.3048;
                os = 'feet';

            case 'm'
                %miles to km
                us = 'km';
                z = z*1.609344;
                os = 'miles';

            case 'oz'
                %ounces to grams
                us = 'grams';
                z = z*28.3495;
                os = 'oz';

            case 'lbs'
                %lbs to kg
                us = 'kg';
                z = z*0.4536;
                os = 'lbs';

            case 'mph'
                %mph to kmh
                us = 'km/h';
                z = z*1.609344;
                os = 'mi/h';

            case 'g'
                %gallons to litres
                us = 'litres';
                z = z*3.78544;
                os = 'gallons';

            case 'a'
                %acres to hectares
                us = 'hectares';
                z = z/2.4711;
                os = 'acres';

            otherwise
                error1 = 1;
        end
    end
    
    
end