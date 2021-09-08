utterance(X) :- sentence(X, [ ]).
sentence(Start, End) :-
 nounphrase(Start, Rest), verbphrase(Rest, End).
nounphrase([Noun | End], End) :-
 noun(Noun).
nounphrase([Article, Noun | End], End) :-
 article(Article), noun(Noun).
verbphrase([Verb | End], End) :-
 verb(Verb).

verbphrase([Verb | Rest], End) :-
 verb(Verb), nounphrase(Rest, End).

article(a).
article(the).
noun(man).
noun(dog).
verb(likes).
verb(bites).


utterance(Prob, X) :- sentence(Prob, X, [ ]).
sentence(Prob, Start, End) :-
 nounphrase(P1, Start, Rest),
 verbphrase(P2, Rest, End),
 pr(r1, P), Prob is P*P1*P2.
nounphrase(Prob, [Noun | End], End) :-
 noun(P1, Noun), pr(r2, P), Prob is P*P1.
nounphrase(Prob, [Article, Noun | End], End) :-
 article(P1, Article), noun(P2,Noun), pr(r3, P),
 Prob is P*P1*P2.
verbphrase(Prob, [Verb | End], End) :-
 verb(P1, Verb), pr(r4, P), Prob is P*P1.
verbphrase(Prob, [Verb | Rest], End) :-
 verb(P1, Verb),
 nounphrase(P2, Rest, End), pr(r5, P),
 Prob is P*P1*P2.

pr(r1, 1.0).
pr(r2, 0.3).
pr(r3, 0.7).
pr(r4, 0.2).
pr(r5, 0.8).

article(0.25, a).
article(0.75, the).
noun(0.65, man).
noun(0.35, dog).
verb(0.9, likes).
verb(0.1, bites).



utterance2(X) :- sentence2(X, [ ]).
sentence2(Start, End) :-
 nounphrase2(Start, Rest, Number),
 verbphrase2(Rest, End, Number).
nounphrase2([Noun | End], End, Number) :-
 noun2(Noun, Number).
nounphrase2([Article, Noun | End], End, Number) :-
 noun2(Noun, Number), article2(Article, Number).
verbphrase2([Verb | End], End, Number) :-
 verb2(Verb, Number).
verbphrase2([Verb | Rest], End, Number) :-
 verb2(Verb, Number), nounphrase2(Rest, End, _).

 article2(a, singular).
 article2(these, plural).
 article2(the, singular).
 article2(the, plural).
 noun2(man, singular).
 noun2(men, plural).
 noun2(dog, singular).
 noun2(dogs, plural).
 verb2(likes, singular).
 verb2(like, plural).
 verb2(bites, singular).
 verb2(bite, plural).


