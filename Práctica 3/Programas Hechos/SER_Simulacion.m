L = 100; % Número de símbolos en la simulación
M = 8; % Constelacion PAM de M simbolos
k = log2(M); % Número de bits por símbolo

Eb = 7; % Valor de Eb en unidades naturales (calculado de forma teórica en el Hito3.1.)
Eb_dB = 10*log10(Eb); % Valor de Eb en dB

Eb_No_dB = 0:1:17; % Valores de Eb/No en dB
for count = 1:length(Eb_No_dB)
    indices_simbolos_Tx = randint(L, 1, M); % Generamos L símbolos aleatorios (con valores de 1 a 8)
    simbolos_Tx = pammod(indices_simbolos_Tx, M); % Generamos los L símbolos aleatorios (valores [-7, -5, -3, -1, 1, 3, 5, 7])
    No_dB = Eb_dB - Eb_No_dB(count); % Valor de No en dB
    No = 10^(No_dB/10); % Valor de No en unidades naturales
    ruido = sqrt(No/2)* randn(L, 1); % Generamos L muestras de ruido gaussiano de varianza No/2
    simbolos_Rx = simbolos_Tx + ruido; % Sumamos el ruido aditivo
    
    decision = zeros(L, 1);
    for n=1:L                      % Generamos el decisor. Manera poco bonita, pero eficaz
        if simbolos_Rx(n) < -6 
            decision(n) = -7;
        elseif simbolos_Rx(n) < -4 
            decision(n) = -5;
        elseif simbolos_Rx(n) < -2 
            decision(n) = -3;
        elseif simbolos_Rx(n) < 0 
            decision(n) = -1;
        elseif simbolos_Rx(n) < 2 
            decision(n) = 1;
        elseif simbolos_Rx(n) < 4 
            decision(n) = 3;
        elseif simbolos_Rx(n) < 6 
            decision(n) = 5;
        elseif simbolos_Rx(n) > 6
            decision(n) = 7;
        end
    end
    
    SER_experimental(count) = sum((decision ~= simbolos_Tx))/L;              % Calculamos la SER experimental
    SER_teorica(count) = ((2*(M-1))/M)*qfunc(sqrt((6*k*Eb)/((M.^2-1)*No)));  % Calculamos la SER teórica
end

% Representamos los resultados.
figure;
clf;
semilogy(Eb_No_dB,SER_experimental,'b-', Eb_No_dB,SER_teorica, 'r-');
grid on;
legend('Experimental','Teorica');
xlabel('Eb/No (dB)');
ylabel('SER experimental');


%Cuantos más simbolos haya más se parecerá la SER experimental a la
%teórica.