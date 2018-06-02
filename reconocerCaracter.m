function [este] = reconocerCaracter(image)
tr = csvread('train.csv', 1, 0);                  % leer train.csv
sub = csvread('test.csv', 1, 0);                  % leer test.csv


n = size(tr, 1);                    % cantidad de muestras
targets  = tr(:,1);                 % se leen los objetivos
targets(targets == 0) = 10;         % se usa '10' para presentar '0'
targetsd = dummyvar(targets);       % convertir etiqueta a variable dummy 
inputs = tr(:,2:end);               % se leen las entradas

inputs = imbinarize(inputs);        % se binarizan las entradas
inputs = cambiarFormato(inputs);    % se pasa a formato double


inputs = inputs';                   % transponer input
targets = targets';                 % transponer target
targetsd = targetsd';               % transponer variable dummy

rng(1);                             % Para reproducir 
c = cvpartition(n,'Holdout',n/3);   % Particion de la base de datos

Xtrain = inputs(:, training(c));    % 2/3 de input para entrenar
Ytrain = targetsd(:, training(c));  % 2/3 de salida para entrenar
Xtest = inputs(:, test(c));         % 1/3 de input para testear
Ytest = targets(test(c));           % 1/3 de salida para testear
Ytestd = targetsd(:, test(c));      % 1/3 de la variable dummy para testear

Xtest = [Xtest, image];             % Ingresar la imagen nuestra a la base de datos
Ypred = myNNfunction(Xtest);        % predecir el nuemro
%Ypred(:, 1:5)                      % display the first 5 columns
[~, Ypred] = max(Ypred);            % encontrar el indice con mayor probabilidad
este = extraerNumero(Ypred);        % converir de dummy a numero

end





    