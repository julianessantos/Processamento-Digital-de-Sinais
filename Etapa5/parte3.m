%Discentes: Julia Alanne Silvino dos Santos, Juliane da Silva Santos, Anelma Silva da costa

# Parâmetros do filtro
f1 = 5500;       # Frequência do ruído 1 (Hz)
f2 = 5800;       # Frequência do ruído 2 (Hz)
fs = 5300;       # Frequência de amostragem (Hz)
fa = 32000;      # Frequência de amostragem para normalização (Hz)
delta_omega = 0.05*pi;  # Largura da faixa de transição (rad)
N = 221;         # Comprimento do filtro FIR
M = 220;

# Cálculo da resposta ao impulso ideal do filtro passa-baixa
n = 0:M; # Índices de amostras
wc = 0.9625;   # Frequência de corte do filtro passa-baixa
h_d = sin(wc*(n-(M/2)))./(pi*(n-M/2));  # Resposta ao impulso ideal
h_d(M/2+1) = wc/pi;

# Aplicação da janela blackman

blackman = 0.42 - 0.5*cos((2*pi*n)/M)+0.08*cos((4*pi*n)/M);
# Cálculo da resposta ao impulso do filtro FIR

h_n = h_d.*blackman;

% Gravando áudio por 10s
audio_gravado = audiorecorder(16000,16,1, -1);
disp("Gravacao Iniciada")
recordblocking(audio_gravado, 10);
disp("Gravacao finalizada")

data_audio= getaudiodata(audio_gravado, "double");
audiowrite("audio_gravado.wav", data_audio, 16000);
[audio_gravado, taxa_de_amostragem] = audioread("audio_gravado.wav");

T = 1/11400;
n_ruido = 0:T:(length(audio_gravado)-1)*T;
ruido= cos(2*pi*f1*n_ruido)+cos(2*pi*f2*n_ruido);
sinal_com_ruido= audio_gravado + transpose(ruido);
audiowrite("audio_ruido.wav", ruido, 16000);
audiowrite("audio_sinal_com_ruido.wav", sinal_com_ruido, 16000);

sinal_filtrado= filter(h_n, 1, sinal_com_ruido);
audiowrite("audio_sinal_filtrado.wav", sinal_filtrado, 16000);

figure(1),
N=length(sinal_filtrado);
t=T*(1:N);
ssf=(-N/2:N/2-1)/(T*N);                   % vetor de frequência
fx=fft(sinal_filtrado(1:N));                % calcula a DFT/FFT
fxs=fftshift(fx);                          % desloca para o centro do espectro
subplot(2,1,1), plot(t,sinal_filtrado);                  % apresenta o gráfico da forma de onda
xlabel('segundos'); ylabel('amplitude');     % rotula os eixos
title('Sinal filtrado (tempo)');
subplot(2,1,2), plot(ssf,abs(fxs));         % apresenta o gráfico do espectro de magnitudes
xlabel('frequência'); ylabel('magnitude');   % rotula os eixos
title('Sinal filtrado (frequência)');




figure(2),
N=length(audio_gravado);
t=T*(1:N);
ssf=(-N/2:N/2-1)/(T*N);
fx=fft(audio_gravado(1:N));
fxs=fftshift(fx);
subplot(2,1,1), plot(t,audio_gravado)  ;
xlabel('segundos'); ylabel('amplitude');
title('Sinal do audio gravado (tempo)');
subplot(2,1,2), plot(ssf,abs(fxs)) ;
xlabel('frequência'); ylabel('magnitude');
title('Sinal do audio gravado (frequência)');


figure(3),
N=length(sinal_com_ruido);
t=T*(1:N);
ssf=(-N/2:N/2-1)/(T*N);
fx=fft(ruido(1:N));
fxs=fftshift(fx);
subplot(2,1,1), plot(t,sinal_com_ruido) ;
title('Sinal do audio com Ruido (tempo)');
xlabel('segundos'); ylabel('amplitude');
subplot(2,1,2), plot(ssf,abs(fxs)) ;
xlabel('frequência'); ylabel('magnitude');
title('Sinal do audio com Ruido (frequência)');


