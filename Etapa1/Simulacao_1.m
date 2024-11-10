% Lendo o arquivo de áudio da Igreja
[audio_igreja, taxa_de_amostragem] = audioread('Etapa1/Church Schellingwoude.wav');
vetor_audio_igreja = audio_igreja(:,1);

% Gravando áudio por 10s
audio_gravado = audiorecorder(16000,16,1, -1);

disp("Gravacao Iniciada")
recordblocking(audio_gravado, 10);
disp("Gravacao finalizada")

data_audio = getaudiodata(audio_gravado, "double");
audiowrite("audio_gravado.wav", data_audio, 16000);


% Convertendo o áudio gravado em um vetor
[audio_gravado, taxa_de_amostragem] = audioread("audio_gravado.wav");

% Fazendo a convolução entre o áudio da igreja e o áudio gravado
convolucao = conv(data_audio, vetor_audio_igreja);

% Convertendo a convolução em um arquivo de áudio
audiowrite("convolucao.wav", convolucao, 16000);

