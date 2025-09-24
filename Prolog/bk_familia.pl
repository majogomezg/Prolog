% =========================================================
% BK #1 - Familia (Prolog)
% Hechos y reglas en formato de cláusulas de Horn
% ---------------------------------------------------------
% NOTA: Ajusta/añade hechos de tu familia real si quieres.
%       Si tu docente pide marcar contenido generado con IA,
%       agrega aquí tu comentario según la guía del curso.
% =========================================================

% ---------- Hechos ----------
madre(bibi, majo).
madre(bibi, clari).
padre(hugo, bibi).
madre(ana,  bibi).

% ---------- Reglas básicas de tipado/rol ----------
% Todo padre/madre es persona:
persona(X) :- padre(X, _).
persona(X) :- madre(X, _).

% Todo padre es hombre; toda madre es mujer:
hombre(X)  :- padre(X, _).
mujer(X)   :- madre(X, _).

% Progenitor si es madre o padre:
progenitor(X, Y) :- madre(X, Y).
progenitor(X, Y) :- padre(X, Y).

% Si alguien es progenitor de Y, entonces Y es persona:
persona(Y) :- progenitor(_, Y).

% Toda persona tiene (al menos) una madre
% (en Prolog lo consultamos como predicado auxiliar)
tiene_madre(Y) :- madre(_, Y).

% Nadie es su propio padre/madre (integridad).
% En Prolog clásico no imponemos restricciones globales,
% pero podemos ofrecer cheques para validación:
inconsistente_padre(X) :- padre(X, X).
inconsistente_madre(X) :- madre(X, X).

% Hermanos: comparten algún progenitor y son distintos
hermano(X, Y) :-
    X \= Y,
    progenitor(Z, X),
    progenitor(Z, Y).

% Abuelo: hombre que es progenitor de alguien
% que, a su vez, es progenitor de Y
abuelo(X, Y) :-
    hombre(X),
    progenitor(X, Z),
    progenitor(Z, Y).