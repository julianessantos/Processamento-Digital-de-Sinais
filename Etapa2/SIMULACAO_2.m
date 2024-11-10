
% Definindo  os valores de x, n e k
n = 0:10; % vetor de índices
x = (0.9*exp(1j*pi/3)).^n; % sequência de entrada
k = -400:401; %vetor frequência

function X = dtft(x,n,k)
    M = 200;
    X = zeros(size(k)+0j);
    for i = 1:length(k)
        X(i) = sum(x *  exp(-1j * (pi/M) * n' * k(i)));
    end
end
% Chamada da função dtft
X = dtft(x, n, k);

% Plot do grafico de magnitude
plot(k, abs(X), '-r');
xlabel('Frequência (k)');
ylabel('|X (e^j^w)|');
title('Magnitude de X (e^j^w)');

%plot da fase
plot(k, angle(X),'-b')
xlabel('Frequência (k)')
ylabel('Ângulo de X (e^j^w) (rad)');
title('Fase de X (e^j^w)');

