function [G] = cambiarFormato(H)
%%  Metodo cambia el formato de unit8 a double %%
    [i,j] = size(H);       
    for jj = 1:j
        for ii = 1:i
            na=H(ii,jj);
            no=double(na);
            G(ii,jj) = no;
        end
    end
end