clc
clear

pi = %pi

// Parte 2
// 1. Gerar um vetor de tempos com 10 s.  de duração total com passos de 0,05s. segundos;
t = 0:0.05:10

// 2. Gerar um pulso unitário de duração 2 s. começando no instante t=1s.
u = cat(2,zeros(1,20),ones(1,40),zeros(1,141));

// 3. Aplicar a transformada rápida de Fourier ao sinal gerado em (2);

U = fft(u)

// 4. Exibir gráficos contendo o sinal gerado em (2) e seu espectro de potência

clf()
scf(0)
plot(t,abs(U))
// código abaixo veio da documentacao da funcao fft()
// u is real so the fft response is conjugate symmetric and we retain only the first N/2 points
N = size(t,'*')
frequency_vector =20*(0:(N/2))/N; //associated frequency vector
n = size(frequency_vector,'*')
scf(1)
plot(frequency_vector,abs(U(1:n)))

// 5. Utilizando o mesmo vetor de tempos, gerar uma função periódica (seno ou cosseno) de frequência 4 Hz

seno = sin(8*pi*t)

// 6. Aplicar a transformada rápida de Fourier ao sinal gerado em (5)

U_seno = fft(seno)

// 7. Exibir gráficos contendo o sinal gerado em (5) e seu espectro de potência

scf(2)
plot(t,abs(U_seno))
scf(3)
plot(frequency_vector,abs(U_seno(1:n)))

// 8. Efetuar a multiplicação dos sinais gerados em (2) e em (5)

mult = u .* seno

// 9. Aplicar a transformada rápida de Fourier ao sinal gerado em (8)

U_mult = fft(mult)

// 7. Exibir gráficos contendo o sinal gerado em (7) e seu espectro de potência

scf(4)
plot(t,abs(U_mult))
scf(5)
plot(frequency_vector,abs(U_mult(1:n)))
