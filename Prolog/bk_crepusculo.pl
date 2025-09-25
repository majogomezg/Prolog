% =========================================================
% BK #2 - Crepúsculo
% =========================================================

% Hechos
vampiro(edward).
humano(bella).
ama(edward, bella).

% Reglas
inmortal(X) :- vampiro(X).
mortal(X) :- humano(X).

corre_peligro(Y) :- vampiro(X), humano(Y), ama(X,Y).

% Disyuntiva: todo vampiro bebe sangre o brilla
bebe_sangre(X) :- vampiro(X), \+ brilla(X).
brilla(X) :- vampiro(X), \+ bebe_sangre(X).

% Conversión: si alguien se convierte en vampiro
inmortal(X) :- se_convierte(X, vampiro).
:- dynamic mortal/1. % permite retractar si fuera necesario

% Un inmortal no envejece
no_envejece(X) :- inmortal(X).
