//PME3402 - Laboratório de Medição e Controle Discreto / Atividade Aula 2
//Tarefa 2 

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

M = csvRead('C:\Users\Usuario\Documents\GitHub\Lab_Medicoes_2\ex2\Sons\Caique_o_fechado.wav')

scf(0)
disp(M)
