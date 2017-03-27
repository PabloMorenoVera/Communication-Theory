clear all
close all

M = 2; Fd = 1; Fs = 10;
Pd = 100;
msg_d = randint(Pd,1,M); % genera una señal aleatoria de 100 muestras 
                         % de modulo 1 y valores de ruidos intermedios

msg_a = pammod(msg_d,M); % modulacion PAM(los 1 se quedan como 1, y los 0 pasan a ser -1)

delay = 3; %porque lo ha puesto asi el profe
rcv = rcosflt(msg_a,Fd,Fs,'fir/normal',0.5,delay); % Generación de la señal con los cosenos alzados 

N = Fs/Fd;
propdelay = delay .* N + 1;
rcv1 = rcv(propdelay:end-2*(propdelay-1),:); % Para eliminar las colas del coseno alzado

h1 =  eyediagram(rcv1,N,1/Fd); % Representamos rcv1 para que no nos pase que la señal pasa por 0,
                               % por la influencia de las colas finales e iniciales de los cosenos alzados
set(h1,'Name','Diagrama de Ojo');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Cambio del coeficiente de roll-off a 0

delay = 3; %porque lo ha puesto asi el profe
rcv = rcosflt(msg_a,Fd,Fs,'fir/normal',0,delay); % Generación de la señal con los cosenos alzados 

N = Fs/Fd;
propdelay = delay .* N + 1;
rcv1 = rcv(propdelay:end-2*(propdelay-1),:); % Para eliminar las colas del coseno alzado

h1 =  eyediagram(rcv1,N,1/Fd); % Representamos rcv1 para que no nos pase que la señal pasa por 0,
                               % por la influencia de las colas finales e iniciales de los cosenos alzados
set(h1,'Name','Diagrama de Ojo');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Cambio del coeficiente de roll-off a 1

delay = 3; %porque lo ha puesto asi el profe
rcv = rcosflt(msg_a,Fd,Fs,'fir/normal',1,delay); % Generación de la señal con los cosenos alzados 

N = Fs/Fd;
propdelay = delay .* N + 1;
rcv1 = rcv(propdelay:end-2*(propdelay-1),:); % Para eliminar las colas del coseno alzado

h1 =  eyediagram(rcv1,N,1/Fd); % Representamos rcv1 para que no nos pase que la señal pasa por 0,
                               % por la influencia de las colas finales e iniciales de los cosenos alzados
set(h1,'Name','Diagrama de Ojo');


%1.2-El coeficiente de roll-off cuanto mayor sea, mayor margen nos da frente a
%una mayor intrusion de ruido, por eso observamos que para el 3 caso el
%margen es mayor.

% Y el más sensible(el que mas distorsiona la recepcion de 1 o -1) en
% función de la sincronización de muestreo, será el del 0 por coef de
% roll-off, porque el coeficiente de roll-off tambien influye en lo que se
% nos abren las lineas del diagrama.
