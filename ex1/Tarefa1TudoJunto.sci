//PME3402 - Laboratório de Medição e Controle Discreto / Tarefa 1 

//Grupo 4 - Integrantes:
//Caique de Oliveira Kobayashi - 9793461
//Heitor Fontana de Godoy - 10335677
//Lucas Hattori Costa - 10335847
//Lucas Pinheiro Paiva Cavalcante - 10274270
//Pedro Henrique Pavelski - 10335621

clc
clear
xdel( winsid() )

pi = %pi

//-------------------------------COMEÇO PARTE 1---------------------------------
//Parte 1
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

//---------------------------------FIM PARTE 1----------------------------------

//-------------------------------COMEÇO PARTE 2---------------------------------
// Parte 2
// 1. Gerar um vetor de tempos com 10 s.  de duração total com passos de 0,05s. segundos;
t = 0:0.05:10

// 2. Gerar um pulso unitário de duração 2 s. começando no instante t=1s.
u = cat(2,zeros(1,20),ones(1,40),zeros(1,141));

// 3. Aplicar a transformada rápida de Fourier ao sinal gerado em (2);

U = fft(u)

// 4. Exibir gráficos contendo o sinal gerado em (2) e seu espectro de potência

scf(1)
subplot(121)
plot2d(t,u,2)
xlabel('Tempo (s)')
ylabel('Amplitude')
title(['Pulso unitário de duração 2 segundos'])
// código abaixo veio da documentacao da funcao fft()
// u is real so the fft response is conjugate symmetric and we retain only the first N/2 points
N = size(t,'*')
frequency_vector =20*(0:(N/2))/N; //associated frequency vector
n = size(frequency_vector,'*')
subplot(122)
plot2d(frequency_vector,abs(U(1:n)),2)
xlabel('Frequência (Hz)')
ylabel('Amplitude')
title(['Espectro de potência do sinal gerado'])


// 5. Utilizando o mesmo vetor de tempos, gerar uma função periódica (seno ou cosseno) de frequência 4 Hz

seno = sin(8*pi*t)

// 6. Aplicar a transformada rápida de Fourier ao sinal gerado em (5)

U_seno = fft(seno)

// 7. Exibir gráficos contendo o sinal gerado em (5) e seu espectro de potência

scf(2)
subplot(221)
plot2d(t,seno,2)
xlabel('Tempo (s)')
ylabel('Amplitude')
title(['Sinal gerado no item (5)'])

subplot(222)
plot2d(frequency_vector,abs(U_seno(1:n)),2)
xlabel('Frequência (Hz)')
ylabel('Amplitude')
title(['Espectro de potência do sinal gerado no item (5)'])

// 8. Efetuar a multiplicação dos sinais gerados em (2) e em (5)

mult = u .* seno

// 9. Aplicar a transformada rápida de Fourier ao sinal gerado em (8)

U_mult = fft(mult)

// 10. Exibir gráficos contendo o sinal gerado em (8) e seu espectro de potência

subplot(223)
plot2d(t,mult,2)
xlabel('Tempo (s)')
ylabel('Amplitude')
title(['Sinal gerado no item (8)'])

subplot(224)
plot2d(frequency_vector,abs(U_mult(1:n)),2)
xlabel('Frequência (Hz)')
ylabel('Amplitude')
title(['Espectro de potência do sinal gerado no item (8)'])

//---------------------------------FIM PARTE 2----------------------------------

//-------------------------------COMEÇO PARTE 3---------------------------------
//Parte 3
//Repetir o procedimento da Parte 2 a partir do item (5) gerando um sinal periódico com frequências 4,01 e 4,16 Hz. Explicar o comportamento dos espectros.

//ATENÇÃO: Esta parte será subdividida obedecendo as numerações da Parte 2, para mais fácil compreensão.

//Para frequência de 4,01 Hz:
// 5. Utilizando o mesmo vetor de tempos, gerar uma função periódica (seno ou cosseno) de frequência 4,01 Hz
seno1 = sin(8.02*pi*t)

// 6. Aplicar a transformada rápida de Fourier ao sinal gerado em (5)
U_seno1 = fft(seno1)

// 7. Exibir gráficos contendo o sinal gerado em (5) e seu espectro de potência
scf(3)
subplot(221)
plot2d(t,seno1,5)
xlabel('Tempo (s)')
ylabel('Amplitude')
title(['Sinal gerado no item (5) / Parte 3 (4,01 Hz)'])

subplot(222)
plot2d(frequency_vector,abs(U_seno1(1:n)),5)
xlabel('Frequência (Hz)')
ylabel('Amplitude')
title(['Espectro de potência do sinal gerado no item (5) / Parte 3 (4,01 Hz)'])

// 8. Efetuar a multiplicação dos sinais gerados em (2) e em (5)
mult1 = u .* seno1

// 9. Aplicar a transformada rápida de Fourier ao sinal gerado em (8)
U_mult1 = fft(mult1)

// 10. Exibir gráficos contendo o sinal gerado em (8) e seu espectro de potência

subplot(223)
plot2d(t,mult1,5)
xlabel('Tempo (s)')
ylabel('Amplitude')
title(['Sinal gerado no item (8) / Parte 3 (4,01 Hz)'])

subplot(224)
plot2d(frequency_vector,abs(U_mult1(1:n)),5)
xlabel('Frequência (Hz)')
ylabel('Amplitude')
title(['Espectro de potência do sinal gerado no item (8) / Parte 3 (4,01 Hz)'])

//Para frequência de 4,16 Hz:
// 5. Utilizando o mesmo vetor de tempos, gerar uma função periódica (seno ou cosseno) de frequência 4,16 Hz
seno2 = sin(8.32*pi*t)

// 6. Aplicar a transformada rápida de Fourier ao sinal gerado em (5)
U_seno2 = fft(seno2)

// 7. Exibir gráficos contendo o sinal gerado em (5) e seu espectro de potência
scf(4)
subplot(221)
plot2d(t,seno2,3)
xlabel('Tempo (s)')
ylabel('Amplitude')
title(['Sinal gerado no item (5) / Parte 3 (4,16 Hz)'])

subplot(222)
plot2d(frequency_vector,abs(U_seno2(1:n)),3)
xlabel('Frequência (Hz)')
ylabel('Amplitude')
title(['Espectro de potência do sinal gerado no item (5) / Parte 3 (4,16 Hz)'])

// 8. Efetuar a multiplicação dos sinais gerados em (2) e em (5)
mult2 = u .* seno2

// 9. Aplicar a transformada rápida de Fourier ao sinal gerado em (8)
U_mult2 = fft(mult2)

// 10. Exibir gráficos contendo o sinal gerado em (8) e seu espectro de potência
subplot(223)
plot2d(t,mult2,3)
xlabel('Tempo (s)')
ylabel('Amplitude')
title(['Sinal gerado no item (8) / Parte 3 (4,16 Hz)'])

subplot(224)
plot2d(frequency_vector,abs(U_mult2(1:n)),3)
xlabel('Frequência (Hz)')
ylabel('Amplitude')
title(['Espectro de potência do sinal gerado no item (8) / Parte 3 (4,16 Hz)'])

// Comparação e explicação do comportamento dos espectros:
scf(5)
plot2d(t,seno1,2)
plot2d(t,seno2,3)
xlabel('Tempo (s)')
ylabel('Amplitude')
legend(['4,01Hz';'4,16Hz'])
title(['Comparação entre os sinais gerados no item (5) / Parte 3'])

scf(6)
plot2d(t,mult1,2)
plot2d(t,mult2,3)
xlabel('Tempo (s)')
ylabel('Amplitude')
legend(['4,01Hz';'4,16Hz'])
title(['Comparação entre os sinais gerados no item (8) / Parte 3'])

scf(7)
plot2d(frequency_vector,abs(U_seno1(1:n)),3)
plot2d(frequency_vector,abs(U_seno2(1:n)),4)
legend(['4,01Hz';'4,16Hz'])
xlabel('Frequência (Hz)')
ylabel('Amplitude')
title(['Espectro de potência do sinal gerado no item (5) / Parte 3'])

scf(8)
plot2d(frequency_vector,abs(U_mult1(1:n)),3)
plot2d(frequency_vector,abs(U_mult2(1:n)),4)
legend(['4,01Hz';'4,16Hz'])
xlabel('Frequência (Hz)')
ylabel('Amplitude')
title(['Espectro de potência do sinal gerado no item (8) / Parte 3'])

// Podemos observar que o primeiro gráfico gerado, a partir do sinal periódico (seno), apresenta
// o comportamento oscilatório esperado, com frequência desejada. Entretando, para ambos os casos,
// ocorre uma pequena variação entre as amplitudes das oscilações, o que reflete um valor
// de intervalo de tempo muito grande para a frequência em questão (essa análise será
// melhor tratada na Parte 4).
// Nos gráficos de composição do sinal periódico com o sinal unitário, percebemos,
// como esperado, que o sinal apresenta o comportamento periódico (idêntico ao original)
// somente no intervalo de tempo em que o sinal u tem valor unitário. Para os demais valores,
// o sinal composto é nulo.
// No domínio das frequências, podemos observar que o espectro de potências indica com clareza o
// valor do sinal periódico no caso em que não há composição (para ambas as frequências). Já
// para o sinal composto, ocorre a presença de ruídos, que dificultam um pouco mais a leitura.
// Comparando os gráficos entre as duas frequências, percebemos que ocorre, como esperado,
// um pequeno avanço nos gráficos de espectros de potência, indicando um aumento da frequência.

//---------------------------------FIM PARTE 3----------------------------------

//-------------------------------COMEÇO PARTE 4---------------------------------
//Parte 4
//Repetir o procedimento da Parte 3,  porém modificando o passo do vetor de tempos para 0,01s. Comparar com o resultado do item (III) e explicar o que ocorre.

//Vetor de tempo e frequency vector alterados
t4 = 0:0.01:10
u4 = cat(2,zeros(1,100),ones(1,200),zeros(1,701));
U4 = fft(u4)
N4 = size(t4,'*')
frequency_vector4 =100*(0:(N4/2))/N4; //associated frequency vector
n4 = size(frequency_vector4,'*')

//ATENÇÃO: As demais etapas seguirão novamente as numerações da Parte 2, para mais fácil compreensão.

//Para frequência de 4,01 Hz:

// 5. Utilizando o mesmo vetor de tempos, gerar uma função periódica (seno ou cosseno) de frequência 4,01 Hz
seno1pt4 = sin(8.02*pi*t4)

// 6. Aplicar a transformada rápida de Fourier ao sinal gerado em (5)
U_seno1pt4 = fft(seno1pt4)

// 7. Exibir gráficos contendo o sinal gerado em (5) e seu espectro de potência
scf(9)
subplot(221)
plot2d(t4,seno1pt4,5)
xlabel('Tempo (s)')
ylabel('Amplitude')
title(['Sinal gerado no item (5) / Parte 4 (4,01 Hz)'])

subplot(222)
plot2d(frequency_vector4,abs(U_seno1pt4(1:n4)),5)
xlabel('Frequência (Hz)')
ylabel('Amplitude')
a = gca()
a.data_bounds=[0,0;10,500]
title(['Espectro de potência do sinal gerado no item (5) / Parte 4 (4,01 Hz)'])

// 8. Efetuar a multiplicação dos sinais gerados em (2) e em (5)
mult1pt4 = u4 .* seno1pt4

// 9. Aplicar a transformada rápida de Fourier ao sinal gerado em (8)
U_mult1pt4 = fft(mult1pt4)

// 10. Exibir gráficos contendo o sinal gerado em (8) e seu espectro de potência
subplot(223)
plot2d(t4,mult1pt4,5)
xlabel('Tempo (s)')
ylabel('Amplitude')
title(['Sinal gerado no item (8) / Parte 4 (4,01 Hz)'])

subplot(224)
plot2d(frequency_vector4,abs(U_mult1pt4(1:n4)),5)
xlabel('Frequência (Hz)')
ylabel('Amplitude')
a = gca()
a.data_bounds=[0,0;10,100]
title(['Espectro de potência do sinal gerado no item (8) / Parte 4 (4,01 Hz)'])

//Para frequêcia de 4,16 Hz:

// 5. Utilizando o mesmo vetor de tempos, gerar uma função periódica (seno ou cosseno) de frequência 4,16 Hz
seno2pt4 = sin(8.32*pi*t4)

// 6. Aplicar a transformada rápida de Fourier ao sinal gerado em (5)
U_seno2pt4 = fft(seno2pt4)

// 7. Exibir gráficos contendo o sinal gerado em (5) e seu espectro de potência
scf(10)

subplot(221)
plot2d(t4,seno2pt4,3)
xlabel('Tempo (s)')
ylabel('Amplitude')
title(['Sinal gerado no item (5) / Parte 4 (4,16 Hz)'])

subplot(222)
plot2d(frequency_vector4,abs(U_seno2pt4(1:n4)),3)
xlabel('Frequência (Hz)')
ylabel('Amplitude')
a = gca()
a.data_bounds=[0,0;10,500]
title(['Espectro de potência do sinal gerado no item (5) / Parte 4 (4,16 Hz)'])

// 8. Efetuar a multiplicação dos sinais gerados em (2) e em (5)
mult2pt4 = u4 .* seno2pt4

// 9. Aplicar a transformada rápida de Fourier ao sinal gerado em (8)
U_mult2pt4 = fft(mult2pt4)

// 10. Exibir gráficos contendo o sinal gerado em (8) e seu espectro de potência
subplot(223)
plot2d(t4,mult2pt4,3)
xlabel('Tempo (s)')
ylabel('Amplitude')
title(['Sinal gerado no item (8) / Parte 4 (4,16 Hz)'])

subplot(224)
plot2d(frequency_vector4,abs(U_mult2pt4(1:n4)),3)
xlabel('Frequência (Hz)')
ylabel('Amplitude')
a = gca()
a.data_bounds=[0,0;10,100]
title(['Espectro de potência do sinal gerado no item (8) / Parte 4 (4,16 Hz)'])

// Comparação com Parte 3 e explicação do comportamento dos espectros:
scf(11)
plot2d(t,seno1,1)
plot2d(t,seno2,2)
plot2d(t4,seno1pt4,3)
plot2d(t4,seno2pt4,4)
xlabel('Tempo (s)')
ylabel('Amplitude')
legend(['4,01Hz - Parte 3';'4,16Hz - Parte 3';'4,01Hz - Parte 4';'4,16Hz - Parte 4'])
title(['Comparação entre os sinais gerados no item (5) / Parte 3 e 4'])

scf(12)
plot2d(t,mult1,1)
plot2d(t,mult2,2)
plot2d(t4,mult1pt4,3)
plot2d(t4,mult2pt4,4)
xlabel('Tempo (s)')
ylabel('Amplitude')
legend(['4,01Hz - Parte 3';'4,16Hz - Parte 3';'4,01Hz - Parte 4';'4,16Hz - Parte 4'])
title(['Comparação entre os sinais gerados no item (8) / Parte 3 e 4'])

scf(13)
plot2d(frequency_vector,abs(U_seno1(1:n)),1)
plot2d(frequency_vector,abs(U_seno2(1:n)),2)
plot2d(frequency_vector4,abs(U_seno1pt4(1:n4)),3)
plot2d(frequency_vector4,abs(U_seno2pt4(1:n4)),4)
xlabel('Frequência (Hz)')
ylabel('Amplitude')
a = gca()
a.data_bounds=[0,0;10,500]
legend(['4,01Hz - Parte 3';'4,16Hz - Parte 3';'4,01Hz - Parte 4';'4,16Hz - Parte 4'])
title(['Espectro de potência do sinal gerado no item (5) / Parte 3 e 4'])

scf(14)
plot2d(frequency_vector,abs(U_mult1(1:n)),1)
plot2d(frequency_vector,abs(U_mult2(1:n)),2)
plot2d(frequency_vector4,abs(U_mult1pt4(1:n4)),3)
plot2d(frequency_vector4,abs(U_mult2pt4(1:n4)),4)
xlabel('Frequência (Hz)')
ylabel('Amplitude')
a = gca()
a.data_bounds=[0,0;10,100]
legend(['4,01Hz - Parte 3';'4,16Hz - Parte 3';'4,01Hz - Parte 4';'4,16Hz - Parte 4'])
title(['Espectro de potência do sinal gerado no item (8) / Parte 3 e 4'])

// A partir das figuras exibidas para o novo valor de passo, observa-se explicitamente
// a diferença já de início com o sinal senoidal "puro", que nas figuras anteriores,
// principalmente para o caso da maior frequência analisada (4,16 Hz) exibiu uma
// forma "ondulada" e não homogênea como esperado. A partir disso, infere-se a
// importância da consideração da taxa de amostragem do sinal, nesse caso simbolizada
// pelo passo, para a sua interpretação de fato, já que, em contrapartida ao valor anterior, o atual
// é muito mais adequado e representa de maneira mais fiel o sinal que se pretende transmitir.
//
// Isso também fica óbvio ao analisar-se os espectros de potência, que agora estão
// "centrados" na frequência desejada de maneira mais precisa, isto é, a amplitude
// do pico é muito maior. Dessa forma, temos que valores de passo grandes são
// inadequados para a efetiva averiguação e análise de um sinal de frequências grandes,
// comprometendo a sua qualidade e a sua precisão.
//---------------------------------FIM PARTE 4----------------------------------
