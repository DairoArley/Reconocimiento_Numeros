function [image] = cambiarCeroAndUno(ima) 
%% Adecuar a la base de datos para que la imagen se compatible con esta %%
[fil, col] = size(ima); 
    for j=1:col
        for i=1:fil
            var = ima(i,j);
            if var == 1
                image(i,j)=0;
            else
                image(i,j)=1;
            end
        end
    end
end