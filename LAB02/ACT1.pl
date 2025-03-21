:- discontiguous padre/2, madre/2, hermano/2, hermana/2, abuelo/2, abuela/2, tio/2, tia/2.

padre(jorge, luis).
padre(luis, juan).
padre(luis, rosa).
padre(juan, diego).
padre(juan, sofia).

madre(maria, luis).
madre(carmen, juan).
madre(carmen, rosa).
madre(rosa, diego).
madre(rosa, sofia).

hermano(juan, rosa).
hermana(rosa, juan).

abuelo(jorge, juan).
abuelo(jorge, rosa).
abuelo(luis, diego).
abuelo(luis, sofia).

abuela(maria, juan).
abuela(maria, rosa).
abuela(carmen, diego).
abuela(carmen, sofia).

tio(juan, diego).
tia(rosa, sofia).

es_padre(X, Y) :- padre(X, Y).
es_madre(X, Y) :- madre(X, Y).
es_hermano(X, Y) :- hermano(X, Y) ; hermana(X, Y).
es_abuelo(X, Y) :- abuelo(X, Y).
es_abuela(X, Y) :- abuela(X, Y).
es_tio(X, Y) :- tio(X, Y) ; tia(X, Y).
