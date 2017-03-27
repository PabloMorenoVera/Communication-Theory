%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%                   TEOR�A DE LA COMUNICACI�N
%
%                PR�CTICA 1. Procesos Estoc�sticos
%
%       HITO 1. ESTACIONARIEDAD Y ERGODICIDAD DE LOS PROCESOS
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Estacionariedad y ergodicidad del proceso X:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Defino un proceso estoc�sticos consistente en realizar Nm medidas sobre
% un circuito el�ctrico, en el que encontramos una tensi�n continua de Vc
% voltios m�s un ruido de media cero y varianza Pn.
% Genero una matriz, cuyas filas ser�n realizaciones del proceso (una fila,
% una realizaci�n). Genero Nr realizaciones.
clear all;
close all;

Nm = 1000;
Nr = 1000;
Vc = 5;
Pn = 1;
X = Vc + sqrt(Pn)*randn(Nr,Nm);

% Calcular la media de las Nm variables aleatorias que componen el proceso
% (cada v.a. es el resultado de medir la tensi�n en un momento dado).
medias = zeros(1, Nm);
for k=1:Nm 
    medias(k) = mean(X(:, k));
end;


% Dibujo la media de las Nm variables aleatorias que componen mi proceso
% estoc�stico:
figure
subplot(211)
plot(medias);
axis();
grid on;
xlabel('n');
ylabel('Media de X[n]');
title('Evoluci�n de la media del proceso estoc�stico.');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Ergodicidad Proceso X:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Cambio las dimnsiones de la matriz para que el resultado sea
% m�s ilustrativo:
Nm = 1000;  
Nr = 1000;
Vc = 5;
Pn = 1;
X = Vc + sqrt(Pn)*randn(Nr,Nm); % Vuelvo a generar el proceso como m�s arriba 

% �C�mo son las medias para cada realizaci�n?
media_realizaciones = zeros(1, Nr);
for k=1:Nr
    media_realizaciones(k) = mean(X(k, :));
end

% Dibujo la media de Nr realizaciones de mi proceso estoc�stico:
subplot(212);
plot(1:Nr, media_realizaciones);
axis([1 Nr 4.85 5.15])
grid on;
xlabel('n');
ylabel('Media de X[n]');
title('Evoluci�n de la media de cada realizacion.');



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Estacionariedad Proceso Y:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Defino un proceso similar, pero ahora en el instante Nm/2, la tensi�n continua
% pasa de 5 V a 0 V.
clear all;
Nr = 1000;
Nm = 1000; % Conviene que Nm sea par para evitar problemas luego.
Vc = 5;
Y = zeros(Nr,Nm); % Inicializo Y con ceros.
Y(:,1:Nm/2) = Vc + sqrt(1)*randn(Nr,Nm/2);
Y(:,Nm/2+1:end) = 0 + sqrt(1)*randn(Nr,Nm/2);

% Repito los c�lculos anteriores:
medias = zeros(1, Nm);
for k=1:Nm 
    medias(k) = mean(Y(:, k));
end;

figure(2)
subplot(211)
plot(medias);
axis();
grid on;
xlabel('n');
ylabel('Media de X[n]');
title('Evoluci�n de la media del proceso estoc�stico.');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Ergodicidad Proceso Y:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Repito los c�lculos anteriores
media_realizaciones = zeros(1, Nr);
for k=1:Nr 
    media_realizaciones(k) = mean(Y(k, :));
end;

subplot(212)
plot(media_realizaciones);
axis([1 Nr]);
grid on;
xlabel('n');
ylabel('Media de X[n]');
title('Evoluci�n de la media de cada realizacion.');