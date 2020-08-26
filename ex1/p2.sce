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
