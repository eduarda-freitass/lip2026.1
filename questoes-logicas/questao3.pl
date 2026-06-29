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

progenitor(joao, maria).
progenitor(joao, pedro).
progenitor(ana, maria).
progenitor(ana, pedro).

progenitor(maria, julia).
progenitor(maria, tiago).
progenitor(carlos, julia).
progenitor(carlos, tiago).

progenitor(pedro, lucas).
progenitor(pedro, beatriz).
progenitor(laura, lucas).
progenitor(laura, beatriz).

masculino(joao).
masculino(pedro).
masculino(carlos).
masculino(tiago).
masculino(lucas).

feminino(ana).
feminino(maria).
feminino(laura).
feminino(julia).
feminino(beatriz).

irmao(X, Y) :- 
    progenitor(P, X), 
    progenitor(P, Y), 
    X \= Y.

tio(X, Y) :- 
    progenitor(P, Y), 
    irmao(X, P).

avou(X, Y) :- 
    progenitor(X, P), 
    progenitor(P, Y).

primo(X, Y) :- 
    progenitor(PX, X), 
    progenitor(PY, Y), 
    irmao(PX, PY).

descendente(X, Y) :- 
    progenitor(Y, X).

descendente(X, Y) :- 
    progenitor(Z, X), 
    descendente(Z, Y).

ancestral(X, Y) :- 
    progenitor(X, Y).

ancestral(X, Y) :- 
    progenitor(X, Z), 
    ancestral(Z, Y).