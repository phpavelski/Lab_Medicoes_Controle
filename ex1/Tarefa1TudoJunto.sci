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
plot2d(t,y1,2)
plot2d(t,y2,5)
xlabel('Tempo (s)')
ylabel('Amplitude')
legend(['y1';'y2'])
title(['Sinais y1 e y2 no tempo'])

// 5. Interpretar o gráfico e explicar o resultado.

// No gráfico, vê-se que ambos os sinais sobrepõem-se perfeitamente. Isso ocorre
// justamente porque o que se adiciona no segundo sinal tem frequência 
// proporcional à de amostragem, ou seja, em todos os pontos em que o programa
// calcula seu valor, a parcela corresponde a zero.
//
// De maneira mais algébrica, podemos comprovar esse fato, chamando, por simplicidade,
// w1 = 2*pi*f e w2 = 2*pi*P*fa, tendo:
// cos(w1*t + phi + w2*t) = cos(w1*t + phi)*cos(w2*t) - sin(w1*t + phi)*sin(w2*t)
// Como não há atraso nos sinais referentes à w2 e a sua frequência é,
// conforme mencionado, proporcional à de amostragem, todos os resultados amostrados
// para cos(w2*t) são iguais a 1 e, analogamente, todos os resultados amostrados
// para sin(w2*t) são iguais a 0, dessa forma, temos que, de fato, 
// cos(w1*t + phi + w2*t) = cos(w1*t + phi)



// Parte 2
// 1. Gerar um vetor de tempos com 10 s.  de duração total com passos de 0,05s. segundos;
t = 0:0.05:10

// 2. Gerar um pulso unitário de duração 2 s. começando no instante t=1s.
u = cat(2,zeros(1,20),ones(1,40),zeros(1,141));

// 3. Aplicar a transformada rápida de Fourier ao sinal gerado em (2);

U = fft(u)

// 4. Exibir gráficos contendo o sinal gerado em (2) e seu espectro de potência

scf(1)
plot2d(t,u,2)
title(['Pulso unitário de duração 2 segundos'])
// código abaixo veio da documentacao da funcao fft()
// u is real so the fft response is conjugate symmetric and we retain only the first N/2 points
N = size(t,'*')
frequency_vector =20*(0:(N/2))/N; //associated frequency vector
n = size(frequency_vector,'*')
scf(2)
plot2d(frequency_vector,abs(U(1:n)),2)
title(['Espectro de potência do sinal gerado'])

// 5. Utilizando o mesmo vetor de tempos, gerar uma função periódica (seno ou cosseno) de frequência 4 Hz

seno = sin(8*pi*t)

// 6. Aplicar a transformada rápida de Fourier ao sinal gerado em (5)

U_seno = fft(seno)

// 7. Exibir gráficos contendo o sinal gerado em (5) e seu espectro de potência

scf(3)
plot2d(t,seno,2)
title(['Sinal gerado no item (5)'])
scf(4)
plot2d(frequency_vector,abs(U_seno(1:n)),2)
title(['Espectro de potência do sinal gerado no item (5)'])

// 8. Efetuar a multiplicação dos sinais gerados em (2) e em (5)

mult = u .* seno

// 9. Aplicar a transformada rápida de Fourier ao sinal gerado em (8)

U_mult = fft(mult)

// 10. Exibir gráficos contendo o sinal gerado em (8) e seu espectro de potência

scf(5)
plot2d(t,mult,2)
title(['Sinal gerado no item (8)'])
scf(6)
plot2d(frequency_vector,abs(U_mult(1:n)),2)
title(['Espectro de potência do sinal gerado no item (8)'])



//Parte 3
//Repetir o procedimento da Parte 2 a partir do item (5) gerando um sinal periódico com frequências 4,01 e 4,16 Hz. Explicar o comportamento dos espectros.

//4,01Hz
seno1 = sin(8.02*pi*t)

U_seno1 = fft(seno1)

scf(3)
plot2d(t,abs(U_seno1),5)
scf(4)
plot2d(frequency_vector,abs(U_seno1(1:n)),5)

mult1 = u .* seno1

U_mult1 = fft(mult1)

scf(5)
plot2d(t,abs(U_mult1),5)
scf(6)
plot2d(frequency_vector,abs(U_mult1(1:n)),5)

//4,16Hz
seno2 = sin(8.32*pi*t)

U_seno2 = fft(seno2)

scf(3)
plot2d(t,abs(U_seno2),3)
legend(['4Hz';'4,01Hz';'4,16Hz'])
scf(4)
plot2d(frequency_vector,abs(U_seno2(1:n)),3)
legend(['4Hz';'4,01Hz';'4,16Hz'])

mult2 = u .* seno2

U_mult2 = fft(mult2)

scf(5)
plot2d(t,abs(U_mult2),3)
legend(['4Hz';'4,01Hz';'4,16Hz'])
scf(6)
plot2d(frequency_vector,abs(U_mult2(1:n)),3)
legend(['4Hz';'4,01Hz';'4,16Hz'])



//Parte 4
//Repetir o procedimento da Parte 3,  porém modificando o passo do vetor de tempos para 0,01s. Comparar com o resultado do item (III) e explicar o que ocorre.

//Vetor de tempo e frequency vector
t4 = 0:0.01:10
u4 = cat(2,zeros(1,100),ones(1,200),zeros(1,701));
U4 = fft(u4)
N4 = size(t4,'*')
frequency_vector4 =20*(0:(N4/2))/N4; //associated frequency vector
n4 = size(frequency_vector4,'*')

//4,01Hz
seno1pt4 = sin(8.02*pi*t4)

U_seno1pt4 = fft(seno1pt4)

scf(7)
plot2d(t4,abs(U_seno1pt4),5)
scf(8)
plot2d(frequency_vector4,abs(U_seno1pt4(1:n4)),5)

mult1pt4 = u4 .* seno1pt4

U_mult1pt4 = fft(mult1pt4)

scf(9)
plot2d(t4,abs(U_mult1pt4),5)
scf(10)
plot2d(frequency_vector4,abs(U_mult1pt4(1:n4)),5)

//4,16Hz
seno2pt4 = sin(8.32*pi*t4)

U_seno2pt4 = fft(seno2pt4)

scf(7)
plot2d(t4,abs(U_seno2pt4),3)
legend(['4,01Hz';'4,16Hz'])
title(['TÍTULO'])
scf(8)
plot2d(frequency_vector4,abs(U_seno2pt4(1:n4)),3)
legend(['4,01Hz';'4,16Hz'])
title(['TÍTULO'])

mult2pt4 = u4 .* seno2pt4

U_mult2pt4 = fft(mult2pt4)

scf(9)
plot2d(t4,abs(U_mult2pt4),3)
legend(['4,01Hz';'4,16Hz'])
title(['TÍTULO'])
scf(10)
plot2d(frequency_vector4,abs(U_mult2pt4(1:n4)),3)
legend(['4,01Hz';'4,16Hz'])
title(['TÍTULO'])
