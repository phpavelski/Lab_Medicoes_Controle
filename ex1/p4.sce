clc
clear

pi = %pi

// Parte 4
// As partes serão numeradas conforme a Parte 2 para fácil compreensão.

// 1. Gerar um vetor de tempos com 10 s.  de duração total com passos de 0,01s. segundos;
t4 = 0:0.01:10

// 2. Gerar um pulso unitário de duração 2 s. começando no instante t=1s.
u = cat(2,zeros(1,100),ones(1,200),zeros(1,705));

// 3. Aplicar a transformada rápida de Fourier ao sinal gerado em (2);
U = fft(u)

// 4. Exibir gráficos contendo o sinal gerado em (2) e seu espectro de potência
clf()
//scf(0)
//plot(t,abs(U))

// código abaixo veio da documentacao da funcao fft()
// u is real so the fft response is conjugate symmetric and we retain only the first N/2 points
N4 = size(t4,'*')
frequency_vector4 =20*(0:(N4/2))/N4; //associated frequency vector
n4 = size(frequency_vector4,'*')

//---------------------------------------------------------------------------
//Para frequência 4,01Hz

// 5. Utilizando o mesmo vetor de tempos, gerar uma função periódica (seno ou cosseno) de frequência 4,01 Hz

seno1 = sin(4.01*2*pi*t4)

// 6. Aplicar a transformada rápida de Fourier ao sinal gerado em (5)

U_seno1 = fft(seno1)

// 7. Exibir gráficos contendo o sinal gerado em (5) e seu espectro de potência

scf(1)
plot(t4,abs(U_seno1))
scf(2)
plot(frequency_vector4,abs(U_seno1(1:n4)))

// 8. Efetuar a multiplicação dos sinais gerados em (2) e em (5)

mult1 = u .* seno1

// 9. Aplicar a transformada rápida de Fourier ao sinal gerado em (8)

U_mult1 = fft(mult1)

// 7. Exibir gráficos contendo o sinal gerado em (7) e seu espectro de potência

scf(3)
plot(t4,abs(U_mult1))
scf(4)
plot(frequency_vector4,abs(U_mult1(1:n4)))

//-----------------------------------------------------------------------------
//Para frequência 4,16Hz
// 5. Utilizando o mesmo vetor de tempos, gerar uma função periódica (seno ou cosseno) de frequência 4,16 Hz

seno2 = sin(4.16*2*pi*t4)

// 6. Aplicar a transformada rápida de Fourier ao sinal gerado em (5)

U_seno2 = fft(seno2)

// 7. Exibir gráficos contendo o sinal gerado em (5) e seu espectro de potência

scf(5)
plot(t4,abs(U_seno2))
scf(6)
plot(frequency_vector4,abs(U_seno2(1:n4)))

// 8. Efetuar a multiplicação dos sinais gerados em (2) e em (5)

mult2 = u .* seno2

// 9. Aplicar a transformada rápida de Fourier ao sinal gerado em (8)

U_mult2 = fft(mult2)

// 7. Exibir gráficos contendo o sinal gerado em (7) e seu espectro de potência

scf(7)
plot(t4,abs(U_mult2))
scf(8)
plot(frequency_vector4,abs(U_mult2(1:n4)))

