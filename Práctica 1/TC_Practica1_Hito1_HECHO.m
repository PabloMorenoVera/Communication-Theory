%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%                   TEORÍA DE LA COMUNICACIÓN
%
%                PRÁCTICA 1. Procesos Estocásticos
%
%       HITO 1. ESTACIONARIEDAD Y ERGODICIDAD DE LOS PROCESOS
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Estacionariedad y ergodicidad del proceso X:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Defino un proceso estocásticos consistente en realizar Nm medidas sobre
% un circuito eléctrico, en el que encontramos una tensión continua de Vc
% voltios más un ruido de media cero y varianza Pn.
% Genero una matriz, cuyas filas serán realizaciones del proceso (una fila,
% una realización). Genero Nr realizaciones.
clear all;
close all;

Nm = 1000;
Nr = 1000;
Vc = 5;
Pn = 1;
X = Vc + sqrt(Pn)*randn(Nr,Nm);

% Calcular la media de las Nm variables aleatorias que componen el proceso
% (cada v.a. es el resultado de medir la tensión en un momento dado).
medias = zeros(1, Nm);
for k=1:Nm 
    medias(k) = mean(X(:, k));
end;


% Dibujo la media de las Nm variables aleatorias que componen mi proceso
% estocástico:
figure
subplot(211)
plot(medias);
axis();
grid on;
xlabel('n');
ylabel('Media de X[n]');
title('Evolución de la media del proceso estocástico.');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Ergodicidad Proceso X:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Cambio las dimnsiones de la matriz para que el resultado sea
% más ilustrativo:
Nm = 1000;  
Nr = 1000;
Vc = 5;
Pn = 1;
X = Vc + sqrt(Pn)*randn(Nr,Nm); % Vuelvo a generar el proceso como más arriba 

% ¿Cómo son las medias para cada realización?
media_realizaciones = zeros(1, Nr);
for k=1:Nr
    media_realizaciones(k) = mean(X(k, :));
end

% Dibujo la media de Nr realizaciones de mi proceso estocástico:
subplot(212);
plot(1:Nr, media_realizaciones);
axis([1 Nr 4.85 5.15])
grid on;
xlabel('n');
ylabel('Media de X[n]');
title('Evolución de la media de cada realizacion.');



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Estacionariedad Proceso Y:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Defino un proceso similar, pero ahora en el instante Nm/2, la tensión continua
% pasa de 5 V a 0 V.
clear all;
Nr = 1000;
Nm = 1000; % Conviene que Nm sea par para evitar problemas luego.
Vc = 5;
Y = zeros(Nr,Nm); % Inicializo Y con ceros.
Y(:,1:Nm/2) = Vc + sqrt(1)*randn(Nr,Nm/2);
Y(:,Nm/2+1:end) = 0 + sqrt(1)*randn(Nr,Nm/2);

% Repito los cálculos anteriores:
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
title('Evolución de la media del proceso estocástico.');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Ergodicidad Proceso Y:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Repito los cálculos anteriores
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
title('Evolución de la media de cada realizacion.');