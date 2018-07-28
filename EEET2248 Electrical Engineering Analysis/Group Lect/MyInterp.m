%%function to interp image
function image = MyInterp(img,orig,method)
    dimension = size(img);
    orig_dimension = size(orig);


    x = 1:1:dimension(1);
    xi = 1:((dimension(1)-1)/(orig_dimension(1)-1)):dimension(1);



    img = interp1(x,img,xi,method);
    img = rot90(img);

    img = interp1(x,img,xi,method);
    img = rot90(img, 3);
    
    image = img;
end
        
    