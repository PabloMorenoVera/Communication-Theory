%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%                   TEOR�A DE LA COMUNICACI�N
%
%                PR�CTICA 1. Procesos Estoc�sticos
%
%           HITO 2. PROCESOS ESTOC�STICOS CON SE�ALES REALES
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Cargamos la frase
load newyork.mat

% Escuchamos la frase
%sound(x, Fs);

% A partir de Fs generamos el vector de tiempos
Ts = 1/Fs;
N = length(x);
t = 0:Ts:(N-1)*Ts;

% Dibumos la se�al en el tiempo (con el eje de tiempos en segundos)
figure;
subplot(311);
plot(t, x)
xlabel('Tiempo en ms')
ylabel('X(t)')
title('Se�al en el tiempo')

%Autocorrelacion
acorr = xcorr(x);
subplot(312);
L = length(acorr);
tau = (-L/2:L/2 - 1);
plot(tau, acorr);
title('Autocorrelaci�n de X(t)')


% Calculamos la DEE del proceso estoc�stico
h = spectrum.welch;
Hpsd = psd(h,x,'Fs',Fs);
f = Hpsd.Frequencies;
dee = Hpsd.Data;

% Dibuamos la DEE con el vector de frecuencias en Hz.
subplot(313);
plot(f, dee)
ylabel('Watios [W]');
xlabel('Frecuencia [Hz]');
title('DEE')