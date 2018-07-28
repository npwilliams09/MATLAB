function [z,us,os,error1,error2] = UnitConvert(x,y,z)
    
    error1 = 0;
    error2 = 0;
    us = 'units';
    os = 'units';
   
    if(isnan(z)) %check if z is empty
        error1 = 1;
        return; %end function and return errors
    end
    
    if (z < 0 && y ~= 1) %check z is positive, unless temp is being input 
        error2 = 1;
        return; %end function and return errors
    end
    
    if strcmp(x,'m') 
        switch y
            case 1
                %celcius to f
                us = 'degrees Fahrenheit';
                z = (z*(9/5)) + 32;
                os = 'degrees Celcius';

            case 2
                %cm to inch
                us = 'inches';
                z = z/2.54;
                os = 'cm';

            case 3
                %metres to feet
                us = 'feet';
                z = z/0.3048;
                os = 'm';

            case 4
                %km to miles
                us = 'miles';
                z = z/1.609344;
                os = 'km';

            case 5
                %grams to ounces
                us = 'oz';
                z = z/28.3495;
                os = 'g';

            case 6
                %kg to lbs
                us = 'lbs';
                z = z/0.4536;
                os = 'kg';

            case 7
                %km/h to mph
                us = 'mi/h';
                z = z/1.609344;
                os = 'km/h';

            case 8
                %litres to gallons
                us = 'gallons';
                z = z/3.78544;
                os = 'litres';

            case 9
                %hectares to acres
                us = 'acres';
                z = z*2.4711;
                os = 'ha';                
        end
        
    elseif strcmp(x,'i')
        switch y
            case 1
                %farenheit to celcius
                us = 'degrees Celcius';
                z = (z - 32) * (5/9);
                os = 'degrees Fahrenheit';

            case 2
                %inches to cm
                us = 'cm';
                z = z*2.54;
                os = 'inches';

            case 3
                %feet to metres
                us = 'metres';
                z = z*0.3048;
                os = 'feet';

            case 4
                %miles to km
                us = 'km';
                z = z*1.609344;
                os = 'miles';

            case 5
                %ounces to grams
                us = 'grams';
                z = z*28.3495;
                os = 'oz';

            case 6
                %lbs to kg
                us = 'kg';
                z = z*0.4536;
                os = 'lbs';

            case 7
                %mph to kmh
                us = 'km/h';
                z = z*1.609344;
                os = 'mi/h';

            case 8
                %gallons to litres
                us = 'litres';
                z = z*3.78544;
                os = 'gallons';

            case 9
                %acres to hectares
                us = 'hectares';
                z = z/2.4711;
                os = 'acres';
        end
    end
    
    
end