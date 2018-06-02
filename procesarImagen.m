function [k] = procesarImagen(b)    
    
    c = rgb2gray(b);                % pasar a escala de grises
    e = imresize(c, [28,28]);       % redimensionar  a 28x28 pixeles    
    f = imbinarize(e);              % se binariza la imagen
    
    %% Adecuar el formato a la base de datos mnist %%
    d = cambiarFormato(f);          % los elementos se convierten de 8unit a double
    z = cambiarCeroAndUno(d);       % se adecua la imagen
    k = reshape(z,[28*28,1]);       % la matriz se convierte en vector
    
end