clc
clear

pi = %pi

// Parte 1
// 1. Gerar um vetor de tempos com passo dt=1/fa, fa=100Hz (frequência de amostragem), de duração 4 segundos;
fa = 100 //Hz
dt = 1/fa //s
t0 = 0 //s
tf = 4 //s
t = t0:dt:tf

// 2. Gerar um sinal periódico y1=cos(2πft+Φ), com f (frequência do sinal) e  Φ, fase do sinal, à sua escolha (ATENÇÃO: respeitar o critério de Nyquist);

f = 2 // Hz
phi = pi/6
y1 = cos(2*pi*f*t + phi)

// 3. Gerar um sinal periódico y2=cos(2πft+Φ+2πPfat), com P um número inteiro;

P = 500
y2 = cos(2*pi*f*t + phi + 2*pi*P*fa*t)

// 4. Exibir um gráfico contendo os sinais y1 e y2 em função do tempo.

clf()
scf(0)
plot(t,y1)
plot(t,y2,'r')
xlabel('Tempo (s)')
ylabel('Amplitude')
legend(['y1';'y2'])

// 5. Interpretar o gráfico e explicar o resultado.

// No gráfico, vê-se que ambos os sinais sobrepõem-se perfeitamente.
// Isso ocorre justamente porque o sinal adicionado tem frequência 
// proporcional à de amostragem, ou seja, em todos os pontos em que o programa
// calcula seu valor, a parcela corresponde a zero.
//
// De maneira mais algébrica, podemos comprovar esse fato, chamando,
// por simplicidade, w1 = 2*pi*f e w2 = 2*pi*P*fa, tendo:
// cos(w1*t + phi + w2*t) = cos(w1*t + phi)*cos(w2*t) - sin(w1*t + phi)*sin(w2*t)
// Como não há atraso nos sinais referentes à w2 e P*fa*t será sempre um número 
// inteiro, todos os resultados amostrados para cos(w2*t) são iguais a 1 e,
// analogamente, todos os resultados amostrados para sin(w2*t) são iguais a 0,
// dessa forma, temos que, de fato, cos(w1*t + phi + w2*t) = cos(w1*t + phi).
