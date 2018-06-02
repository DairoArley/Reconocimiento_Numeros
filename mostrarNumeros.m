function [] = mostrarNumeros(tr)
    figure                                          % plot images
    %colormap(gray)                                  % set to grayscale
    for i = 1:25                                    % preview first 25 samples 
        subplot(5,5,i)                              % plot them in 6 x 6 grid
        digit = reshape(tr(i, 2:end), [28,28])';    % row = 28 x 28 image
        imagesc(digit)                              % show the image
        title(num2str(tr(i, 1)))                    % show the label
    end
    
    imwrite( reshape(tr(1000, 2:end), [28,28])' ,'probando.bmp');

end