/*
Implemente um programa em Prolog sobre a seguinte família fictícia:
A família Oliveira possui os seguintes registros:
• Roberto e Carla são pais de Lucas e Marina
• Lucas é pai de Pedro
• Marina é mãe de Sofia
• Pedro e Sofia tiveram um filho chamado Daniel

a) Utilizando o predicado progenitor(X , Y) represente todas as relações de progenitor da família.

b) Implemente predicados para representar as seguintes relações:
• masculino(X) → verdadeiro se X for masculino, falso caso contrário
• feminino(X) → verdadeiro se X for feminino, falso caso contrário
• irmao(X,Y) → X é irmão de Y
• irma(X,Y) → X é irmã de Y
• pai(X,Y) → X é pai de Y
• mae(X,Y) → X é mãe de Y
• avou(X,Y) → X é avô de Y
• avo(X,Y) → X é avó de Y
• tio(X,Y) → X é tio de Y
• tia(X,Y) → X é tia de Y
• primo(X,Y) → X é primo de Y
• prima(X,Y) → X é prima de Y
• descendente(X,Y) → X descende de Y

*/

progenitor(roberto, lucas).
progenitor(roberto, marina).
progenitor(carla, lucas).
progenitor(carla, marina).

progenitor(lucas, pedro).

progenitor(marina, sofia).

progenitor(pedro, daniel).
progenitor(sofia, daniel).

masculino(roberto).
masculino(lucas).
masculino(pedro).
masculino(daniel).

feminino(carla).
feminino(marina).
feminino(sofia).

pai(Pai, Filho) :- progenitor(Pai, Filho), masculino(Pai).
mae(Mae, Filho) :- progenitor(Mae, Filho), feminino(Mae).

irmao(Irmao, Pessoa) :- progenitor(X, Irmao), progenitor(X, Pessoa), Irmao \= Pessoa, masculino(Irmao).
irma(Irma, Pessoa) :- progenitor(X, Irma), progenitor(X, Pessoa), Irma \= Pessoa, feminino(Irma).

tio(Tio, Sobrinho) :- irmao(Tio, PaiOuMae), progenitor(PaiOuMae, Sobrinho).
tia(Tia, Sobrinho) :- irma(Tia, PaiOuMae), progenitor(PaiOuMae, Sobrinho).

avo(Avo, Neto) :- progenitor(Avo, FilhoOuFilha), progenitor(FilhoOuFilha, Neto).

primo(Primo, Pessoa) :- progenitor(X, Primo), progenitor(Y, Pessoa), (irmao(X, Y) ; irma(X, Y)), masculino(Primo).
prima(Prima, Pessoa) :- progenitor(X, Prima), progenitor(Y, Pessoa), (irmao(X, Y) ; irma(X, Y)), feminino(Prima).

descendente(Descendente, Ancestral) :- progenitor(Ancestral, Descendente).
descendente(Descendente, Ancestral) :- progenitor(X, Descendente), descendente(X, Ancestral).


ancestral(X, Y) :- progenitor(X, Y).

ancestral(X, Y) :- progenitor(X, Z), ancestral(Z, Y).