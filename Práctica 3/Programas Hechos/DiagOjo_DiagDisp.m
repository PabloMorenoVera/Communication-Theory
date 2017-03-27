clear all
close all

N = 16; Fd = 1; Fs = N * Fd; Delay = 3; Pd = 100; offset=0; M = 2;

msg_d = randint(Pd,1,M);
msg_tx = pammod(msg_d,M);
[y, t] = rcosflt(msg_tx, Fd, Fs);

yy = y(1+Delay*N:end-2*Delay*(N+2)); % hasta aqui, hace lo mismo que en el apartado anterior
                                     % de generar las muestras quitar las colas y demas

%A mayor SNR, menor ISI                                     
SNR = 5;
sig_rx = awgn(msg_tx,SNR,'measured',1234,'dB'); %¿Por que mete aqui una parte imaginaria?
[fsig_rx, t2] = rcosflt(sig_rx, Fd, Fs); 
tfsig_rx = fsig_rx(1+Delay*N:end-Delay*(N+1),:);
figure
plot(t, y,'b-', t2, real(fsig_rx),'r-');
title('Señal Modulada:');
legend('Señal Modulada','Con Ruido, SNR = 15dB');

h(1) = eyediagram(yy, N,1);
h(2) = eyediagram(tfsig_rx, N,1,0,'r-');

h(3) = scatterplot(yy, N, 0, 'b.');
h(4) = scatterplot(tfsig_rx, N, 0, 'r.');

real_tfsig_rx = real(tfsig_rx);
h(5) = scatterplot(real_tfsig_rx, N, 0, 'r.');

% La parte en cuadratura(imaginaria), nos dará totalmente igual, porque a
% nosotros lo que nos importa es la parte real que es donde metemos la
% informacion, la parte imaginaria es introducida por el ruido.

% La parte imaginaria NO SE USA

% Cuanto menor SNR más dificil sera decidir entre unos simbolos y otros
% porque el ojo se cerrara, y el diagrama de dispersión no tendrá una zona
% clara de decision. Mayor SNR mejor a la hora de decidir entre los simbolos
% nuestra señal.




















