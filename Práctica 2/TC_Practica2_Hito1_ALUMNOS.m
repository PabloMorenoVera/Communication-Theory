%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%                   TEOR�A DE LA COMUNICACI�N
%
%   PR�CTICA 2. Procesos Estoc�sticos y Sistemas de Telecomunicaci�n
%
%            HITO 1. FILTRADO DE UN P.E. MEDIANTE UN FILTRO LTI
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


clear all;

% Par�metros de la simulaci�n
Nt = 10000;
Nr = 100;
Nfiltro = 100;

% Genero una matriz, cuyas filas ser�n realizaciones del proceso (una fila,
% una realizaci�n). Genero Nr realizaciones, cada ellas de longitud Nt.
% En este caso, la distribuci�n
% de X es una uniforme entre -0.5 y 0.5.

X = rand(Nr, Nt) - 0.5;
X_filt = zeros(size(X));

for n = 1:size(X,1),
    Realizacion = X(n,:); % realizaci�n n (i.i.d)
    b = ones(Nfiltro,1); % Filtro
    R_filt = filter(b,1,Realizacion); % realizaci�n filtrada.
    R_filt(1:length(b)) = R_filt(length(b)+1:2*length(b)); % Para evitar el efecto bordes. Un poco trampa, pero funciona.
    X_filt(n,:) = R_filt;
end

X_filt = X_filt - mean(mean(X_filt)); 

% 1. Potencias del proceso X y del proceso X_filt
%------------------------------------------------------

for k = 1:Nr,
    %?p_x(k) = 
    %?p_x_filt(k) = 
end
%?Px = 
%?Pxfilt = 
    
% 2. Autocorrelaci�n del proceso X y del proceso X_filt
%-----------------------------------------------------------


% Calcular la rxx para cada realizaci�n
for k = 1:Nr,
    rxx(k,:) = xcorr(X(k,:),'biased'); % Autocorrelaci�n de cada realizaci�n
    rxfilt(k,:) = xcorr(X_filt(k,:),'biased'); % Autocorrelaci�n de cada realizaci�n
end

% Calculo la autocorrelaci�n del proceso como la media de las
% autocorrelaciones de cada realizaci�n.

%? Rxx = ; %Ojo, la media se realiza para cada instante, es decir, en vertical.
%? Rxfilt = ; %Ojo, la media se realiza para cada instante, es decir, en vertical.

% Dibujo












