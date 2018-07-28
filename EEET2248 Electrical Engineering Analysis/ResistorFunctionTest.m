clc;
clear;
num = xlsread("ResistorFunctionTestSheet.xlsx");
k = 1;
correct = 0;
total = 0;

while(num(k,1) ~= 888)
    if (num(k,3) == 888)
        [r,t,rmin,rmax,rstring] = ResistorFunction(num(k,1),num(k,2),num(k,4),num(k,5));
        if (rstring == 'K')
            r = r*1000;
        elseif (rstring == 'M')
            r = r*1000000;
        end
        
        if ((r == num(k,6)) && (t == num(k,7)))
            correct = correct + 1;
        end
    end
    if (num(k,3) ~= 888)
        [r,t,rmin,rmax,rstring] = ResistorFunction(num(k,1),num(k,2),num(k,3),num(k,4),num(k,5));
        if (rstring == 'K')
            r = r*1000;
        elseif (rstring == 'M')
            r = r*1000000;
        end
        
        if ((r == num(k,6)) && (t == num(k,7)))
            correct = correct + 1;
        end
    end
    total = total + 1;
    k = k + 1;
end

fprintf('Resistor function correctly tested %g out of %g inputs\n',correct,total);