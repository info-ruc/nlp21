friend(john, julia).
friend(john, jack).
friend(julia, sam).
friend(julia, molly).


color(red).
color(green).
color(blue).

colorify(Hn,Cq,Hb,Jx,Gd,Gx,Gz) :-    color(Hn), color(Cq), color(Hb), color(Jx),     color(Gd),color(Gx),color(Gz),    \+ Hn=Cq, \+ Hn=Hb, \+ Hn=Jx,     \+ Hn=Gd, \+ Hn=Gx, \+ Hn=Gz,    \+ Cq=Hb, \+ Cq=Gz, \+ Hb=Jx,     \+ Jx=Gd, \+ Gd=Gx, \+ Gx=Gz,    \+ Gz=Cq.



factorial(0,1).
factorial(N,F) :-
    N>0,
    N1 is N-1,
    factorial(N1,F1),
    F is N * F1.


move(1,X,Y,_) :-
    write('Move top disk from '),
    write(X), write(' to '), write(Y),
    nl.

move(N,X,Y,Z) :-
    N>1,
    M is N-1,
    move(M,X,Z,Y),
    move(1,X,Y,_),
    move(M,Z,Y,X).



takeout(X,[X|R],R).
takeout(X,[F|R],[F|S]) :- takeout(X,R,S).

perm([X|Y],Z) :- perm(Y,W), takeout(X,Z,W).
perm([],[]).


parse(L) :- start(S),
            trans(S,L).

trans(X,[A|B]) :-
      delta(X,A,Y),   /*  X ---A---> Y */
      write(X),
      write('  '),
      write([A|B]),
      nl,
      trans(Y,B).
trans(X,[]) :-
      final(X),
      write(X),
      write('  '),
      write([]), nl.

delta(0,h,1).
%delta(0,b,0).
delta(1,a,2).
%delta(1,b,2).
delta(2,h,1).
delta(2,!,2).

delta(10,'you',11).
delta(11,'are',12).
delta(12,'smart',13).
delta(12,'wonderful',13).
delta(12,'perfect',13).
delta(13,!,13).

start(0).
start(10).

final(2).
final(13).


