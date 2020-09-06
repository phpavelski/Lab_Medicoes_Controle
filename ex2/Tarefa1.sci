//PME3402 - Laboratório de Medição e Controle Discreto / Atividade Aula 2
//Tarefa 1 

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

M = csvRead('C:\Users\Usuario\Documents\GitHub\Lab_Medicoes_2\ex2\Raw Data 2.csv')
[linha, coluna] = size(M)

scf(0)
subplot(221)
plot(M(2:linha,1),M(2:linha,2))
subplot(222)
plot(M(2:linha,1),M(2:linha,3))
subplot(223)
plot(M(2:linha,1),M(2:linha,4))
subplot(224)
plot(M(2:linha,1),M(2:linha,5))

