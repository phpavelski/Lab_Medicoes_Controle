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

f = 2 //Hz
phi = pi/6
y1 = cos(2*pi*f*t + phi)

// 3. Gerar um sinal periódico y2=cos(2πft+Φ+2πPfat), com P um número inteiro;

P = 500
y2 = cos(2*pi*f*t + phi + 2*pi*P*fa*t)

// 4. Exibir um gráfico contendo os sinais y1 e y2 em função do tempo.

clf()
scf(0)
plot(t,y1,y2)
