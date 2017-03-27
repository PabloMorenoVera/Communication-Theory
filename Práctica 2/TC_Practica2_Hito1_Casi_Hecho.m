%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%                   TEORÍA DE LA COMUNICACIÓN
%
%   PRÁCTICA 2. Procesos Estocásticos y Sistemas de Telecomunicación
%
%            HITO 1. FILTRADO DE UN P.E. MEDIANTE UN FILTRO LTI
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


clear all;

% Parámetros de la simulación
Nt = 10000;
Nr = 100;
Nfiltro = 100;

% Genero una matriz, cuyas filas serán realizaciones del proceso (una fila,
% una realización). Genero Nr realizaciones, cada ellas de longitud Nt.
% En este caso, la distribución
% de X es una uniforme entre -0.5 y 0.5.

X = rand(Nr, Nt) - 0.5;
X_filt = zeros(size(X));

filtro = zeros(Nr, 1);
filtro(1) = 1;

for n = 1:size(X,1),
    Realizacion = X(n, :); % realización n (i.i.d)
    b = ones(Nfiltro, 1); % Filtro
    R_filt = filter(b, 1, Realizacion); % realización filtrada.
    R_filt(1:length(b)) = R_filt(length(b) + 1:2*length(b)); % Para evitar el efecto bordes. Un poco trampa, pero funciona.
    X_filt(n,:) = R_filt;
end

X_filt = X_filt - mean(mean(X_filt)); 

% 1. Potencias del proceso X y del proceso X_filt
%------------------------------------------------------

for k = 1:Nr,
    p_x(k) = 1/Nt * sum(abs(X(k, :)).^2); 
    p_x_filt(k) = 1/Nt * sum(abs(X_filt(k, :)).^2);
end
Px = mean(p_x);             %% Px = 0.0834
Pxfilt = mean(p_x_filt);    %% Pxfilt = 8.3187
    
% 2. Autocorrelación del proceso X y del proceso X_filt
%-----------------------------------------------------------


% Calcular la rxx para cada realización
for k = 1:Nr,
    rxx(k,:) = xcorr(X(k,:),'biased'); % Autocorrelación de cada realización
    rxfilt(k,:) = xcorr(X_filt(k,:),'biased'); % Autocorrelación de cada realización
end

% Calculo la autocorrelación del proceso como la media de las
% autocorrelaciones de cada realización.

Rxx = mean(rxx); %Ojo, la media se realiza para cada instante, es decir, en vertical.
Rxfilt = mean(rxfilt); %Ojo, la media se realiza para cada instante, es decir, en vertical.
Rxb = xcorr(b);

% Dibujo
tau = -(Nt-1):Nt-1;
tau2 = -(Nfiltro-1):Nfiltro-1;
subplot(311);
stem(tau, Rxx);
title('Autocorrelación de Rxx');
subplot(312);
stem(tau, Rxfilt);
title('Autocorrelación de Rxfilt');
subplot(313);
stem(tau2, Rxb)
title('Respuesta al Impulso del canal')









