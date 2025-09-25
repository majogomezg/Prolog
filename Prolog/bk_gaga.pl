% ===========================================
% BK #3 - Lady Gaga (simple, canciones antiguas)
% ===========================================

% ----- Hechos -----
artista(gaga).
artista(beyonce).

cancion(alejandro).
cancion(telephone).
cancion(poker_face).
cancion(just_dance).

album(the_fame).
album(the_fame_monster).

incluida_en(poker_face, the_fame).
incluida_en(just_dance, the_fame).
incluida_en(alejandro, the_fame_monster).
incluida_en(telephone, the_fame_monster).

interpreta(gaga, alejandro).
interpreta(gaga, telephone).
interpreta(gaga, poker_face).
interpreta(gaga, just_dance).
interpreta(beyonce, telephone).

colabora(gaga, beyonce, telephone).

% ----- Reglas-----

% R9: si colaboran en S, ambos la interpretan
interpreta(X, S) :- colabora(X, _, S).
interpreta(Y, S) :- colabora(_, Y, S).

% R10: si X interpreta S e S está en A, X participa en A
participa_en_album(X, A) :-
    interpreta(X, S),
    incluida_en(S, A).

% R11: chequeo de integridad: nadie colabora consigo mismo
inconsistente_colabora(X, S) :- colabora(X, X, S).
