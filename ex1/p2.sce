clc
clear

pi = %pi

// Parte 2
// 1. Gerar um vetor de tempos com 10 s.  de duração total com passos de 0,05s. segundos;
t = 0:0.05:10

// 2. Gerar um pulso unitário de duração 2 s.  começando no instante t=1s.
u = 0*t
for i=21:61
    u(i) = 1
end

// 3. Aplicar a transformada rápida de Fourier ao sinal gerado em (2);

U = fft(u)

// 4. Exibir gráficos contendo o sinal gerado em (2) e seu espectro de potência
clf()
scf(0)
plot(t,abs(U))
// código abaixo veio da documentacao da funcao fft()
// u is real so the fft response is conjugate symmetric and we retain only the first N/2 points
N=size(t,'*')
f=20*(0:(N/2))/N; //associated frequency vector
n=size(f,'*')
scf(1)
plot(f,abs(U(1:n)))
