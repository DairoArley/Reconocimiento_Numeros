function [a] = cargarImagen(path, fileName)
    s = strcat(path,fileName);
    a=imread(s);    
    imshow(a);
end

