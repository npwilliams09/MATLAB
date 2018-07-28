function [r,t,rmin,rmax,rstring] = ResistorFunction(a,b,c,d,e)
    if nargin == 4
        r = ((a*10)+b) * c;
        t = d;
    end
    
    if nargin == 5
            r = ((a*100)+(b*10)+c)*d;
            t = e;
    end
    
    rstring = '';
    
    if (r >= 1000)
        r = r/1000;
        rstring = 'K';
    end
    
    if (r >= 1000)
        r = r/1000;
        rstring = 'M';
    end
    
    range = (r/100) * t;
    rmin = r - range;
    rmax = r + range;
    
    %rmin = round(rmin);
    %rmax = round(rmax);
    
end


