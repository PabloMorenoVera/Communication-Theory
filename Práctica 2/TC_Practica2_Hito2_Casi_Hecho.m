%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%                   TEORÍA DE LA COMUNICACIÓN
%
%   PRÁCTICA 2. Procesos Estocásticos y Sistemas de Telecomunicación
%
%               HITO 2. Señal de voz filtrada.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Cargamos la frase
load 'frase2.mat';

%Escuchamos la frase:
sound(x, Fs);

%% DEFINICIÓN Y DIBUJO DEL FILTRO

fcorte = 20; % Frecuencia de corte del filtro.
[b,a] = cheby1(8, 0.1, fcorte/(Fs/2));

% RESPUESTA AL IMPULSO Y FUNCIÓN DE TRANSFERENCIA
h = filter(b, a, [1 zeros(1, length(x)-1)]); %¿Qué hace esto?
H = abs(fftshift(fft(h)));
f_filtro = linspace(-Fs/2, Fs/2, length(H)); % Vector de frecuencias para la gráfica.

figure; % Dibujar h y H, con el eje de tiempos bien puesto.
subplot(211);
plot(h);
title('h');
subplot(212);
plot(H);
title('H');

%% FILTRAMOS LA SEÑAL
xfilt = filter(b,a,x);


%% DIBUJO LAS SEÑALES EN EL TIEMPO

figure;
subplot(311);
% Dibujo

subplot(312);
% Dibujo

subplot(313);
% Dibujo


%% CÁLCULO Y DIBUJO DE LAS DEP
estimador = spectrum.periodogram;
Hpsd = psd(estimador,x,'Fs',Fs, 'SpectrumType','twosided');
dep_x = fftshift(Hpsd.Data);
f = linspace(-Fs/2, Fs/2, length(dep_x));

estimador2 = spectrum.periodogram;
Hpsd_filt = psd(estimador2,xfilt,'Fs',Fs, 'SpectrumType','twosided');
dep_filt = fftshift(Hpsd_filt.Data);
f_filt = linspace(-Fs/2,Fs/2,length(dep_filt));

%? dep_h = ;

figure % Nueva figura con 3 subplots para las DEPs.
subplot(311); % DEP original
% Dibujar
ejes = axis;
%? axis([? ? ejes(3) ejes(4)]); % Mismo eje horizontal en las 3 gráficas.

subplot(312); % Módulo al cuadrado de la función de transferencia del filtro
% Dibujar
ejes = axis;
%? axis([? ? ejes(3) ejes(4)]); % Mismo eje horizontal en las 3 gráficas.

subplot(313); % DEP de la señal filtrada
% Dibujar
ejes = axis;
%? axis([? ? ejes(3) ejes(4)]); % Mismo eje horizontal en las 3 gráficas.




%% CÁLCULO Y DIBUJO DE LAS AUTOCORRELACIONES
%? Rx = ;
%? Rh = ;
%? Rxfilt = ;
tmax = length(x)*Ts;
%? tR = linspace(); % Eje de tiempos de la autocorrelación (aprox.).

figure;
%? subplot(311); plot();
ejes = axis;
%? axis([? ? ejes(3) ejes(4)]);

%? subplot(312); plot();
ejes = axis;
%? axis([? ? ejes(3) ejes(4)]);

%? subplot(313); plot();
ejes = axis;
%? axis([? ? ejes(3) ejes(4)]);



% Reporduzco la señal filtrada
    % Hago que la señal fitlrada tenga la misma potencia que la original
xf = xfilt ./ mean(abs(xfilt).^2) * mean(abs(x).^2);
% sound(xf,Fs)


