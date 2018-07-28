function y = Painter(x,z)
    if strcmp(z,'digits')
        switch x
            case '0'
                y = 'black';%
            case '1'
                y = [0.5 0 0]; %brown
            case '2'
                y = 'red';%
            case '3'
                y = [1 0.5 0]; %orange
            case '4'
                y = 'yellow';%
            case '5'
                y = 'green';%
            case '6'
                y = 'blue';%
            case '7'
                y = 'magenta';%
            case '8'
                y = [0.7 0.7 0.7]; %grey
            case '9'
                y = 'white';%
        end
        
    elseif strcmp(z,'multiplier')
        switch x
            case '1'
                y = 'black';%
            case '10'
                y = [0.5 0 0]; %brown
            case '100'
                y = 'red';%
            case '1000'
                y = [1 0.5 0]; %orange
            case '10000'
                y = 'yellow';%
            case '100000'
                y = 'green';%
            case '1000000'
                y = 'blue';%
            case '0.1'
                y = [0.9 0.75 0.35];%gold
            case '0.01'
                y = [0.8 0.8 0.85]; %silver
        end
        
    elseif strcmp(z,'tolerance')
       switch x
            case '1'
                y = '[0.5 0 0]';%brown
            case '2'
                y = 'red';
            case '5'
                y = [0.9 0.75 0.35];%gold
            case '10'
                y = [0.8 0.8 0.85]; %silver
            
        end
    end
