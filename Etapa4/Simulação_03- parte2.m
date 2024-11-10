
# Parâmetros do filtro
f1 = 5500;       # Frequência do ruído 1 (Hz)
f2 = 5800;       # Frequência do ruído 2 (Hz)
fs = 5300;       # Frequência de amostragem (Hz)
fa = 32000;      # Frequência de amostragem para normalização (Hz)
delta_omega = 0.05*pi;  # Largura da faixa de transição (rad)
N = 221;         # Comprimento do filtro FIR
M = 220;

# Cálculo das frequências normalizadas
Omega_s = 2*pi*fs;     # Frequência de amostragem em rad/s
omega_s = Omega_s/fa;      # Frequência de corte superior normalizada
omega_p = omega_s - delta_omega;  # Frequência de corte inferior normalizada (faixa de passagem)

# Cálculo da resposta ao impulso ideal do filtro passa-baixa
n = 0:M; # Índices de amostras
wc = 0.9625;   # Frequência de corte do filtro passa-baixa
h_d = sin(wc*(n-(M/2)))./(pi*(n-M/2));  # Resposta ao impulso ideal
h_d(M/2+1) = wc/pi;

# Aplicação da janela blackman

blackman = 0.42 - 0.5*cos((2*pi*n)/M)+0.08*cos((4*pi*n)/M);
# Cálculo da resposta ao impulso do filtro FIR

h_n = h_d.*blackman;

% Chamada da função dtft
[X, W] = dtft_A(h_n,n);

% Plot do grafico de magnitude
figure(1);
plot(W, abs(X), '-r');
xlabel('Frequência (k)');
ylabel('|X (e^j^w)|');
title('Magnitude de X (e^j^w)');

%plot da fase
figure(2);
plot(W, angle(X),'-b');
xlabel('Frequência (k)');
ylabel('Ângulo de X (e^j^w) (rad)');
title('Fase de X (e^j^w)');
