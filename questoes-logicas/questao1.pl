/*
Questões 1. Implemente um grafo simples não orientado representando conexões entre cidades.
    Utilize os nomes cidade1, cidade2 etc.
O sistema deve permitir consultas como:
• verificar se duas cidades são diretamente conectadas
?- conectado( cidade1 , cidade2 ).
• verificar a cidade que tem a maior vizinhança (X é a cidade conectada com mais cidades)
?- maior_vizinhanca( Cidades, X ).
• verificar se existe alguma ilha, isto é, uma cidade que não tem nenhuma vizinhança (X é uma ilha,
se existir).
?- verifica_ilha( Cidades, X).

*/

% nome das cidades para teste
cidade(cidade1).
cidade(cidade2).
cidade(cidade3).
cidade(cidade4).
cidade(cidade5).
cidade(cidade6). % Deixei a cidade6 sem conexões para testar a regra de ilha

conectado(cidade1, cidade2).
conectado(cidade1, cidade3).
conectado(cidade1, cidade4).
conectado(cidade4, cidade5).
conectado(cidade2, cidade4).

% Precisei criar um predicado auxiliar para considerar a conexão bidirecional, já que o grafo é não orientado
conectado_bidirecional(A, B) :- conectado(A, B).
conectado_bidirecional(A, B) :- conectado(B, A).

% Predicado para contar o número de vizinhos de uma cidade
conta_vizinhos(Cidade, Quantidade) :-
    % Primeiro ele vê se a cidade existe
    cidade(Cidade),
    % Em seguida, ele encontra todos os vizinhos da cidade usando findall e conectado_bidirecional
    findall(Vizinho, conectado_bidirecional(Cidade, Vizinho), ListaVizinhos),
    % Por fim, ele calcula o tamanho da lista de vizinhos para obter a quantidade
    length(ListaVizinhos, Quantidade).


maior_vizinhanca(CidadeMax, MaxVizinhos) :-
    findall(Qtd-C, conta_vizinhos(C, Qtd), ListaQtdCidades),
    sort(ListaQtdCidades, ListaOrdenada),
    reverse(ListaOrdenada, [MaxVizinhos-CidadeMax | _]).

verifica_ilha(Cidade) :-
    cidade(Cidade),
    \+ conectado_bidirecional(Cidade, _).