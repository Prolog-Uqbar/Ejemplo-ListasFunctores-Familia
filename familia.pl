%inversibilidad

% predicados/argumentos inversible

persona(Alguien):-hijo(Alguien,_,_).
persona(Alguien):-hijo(_,Alguien,_).


/* hijos(homero,[bart,lisa]).
hijos(marge,[bart,lisa]).
hijos(bart,[pedro]).
hijos(pedro,[ana,juana]).
hijos(abraham,[homero,herbert]).
hijos(mona,[homero]).
hijos(herbert,[cachito]). */

%hijos(sol,sdkfjhakdfhkasjh).


/* hijo(Hijo,Alguien):-
    hijos(Alguien,Hijos),
    member(Hijo,Hijos). */

hijo(lisa,homero,fecha(1986,332)).
%hijo(lisa,homero,5).
hijo(bart,marge,dia(3,9,1986)).
hijo(cain,adan,antiguedad).
%hijo(lisa,marge,1).

hijo(coreaNorte,urss,guerraFria).
hijo(vietnam,eeuu,guerra(1960,presidente,rambo)).

hijo(brote,arbol,[marzo,abril,junio]).

esMayorDeEdad(Persona):-
    hijo(Persona,_,Fecha),
    esDelSiglo20(Fecha).

esDelSiglo20(dia(_,_,Anio)):-between(1900,1999,Anio).
esDelSiglo20(fecha(Anio,_)):-between(1900,1999,Anio).
esDelSiglo20(guerraFria).
esDelSiglo20(guerra(Anio,_,rambo)):-Anio > 1900.
esDelSiglo20(Lista):-member(marzo,Lista).

hijo(X,Y):-hijo(X,Y,_).
%hijo(pedro,bart,6).
%hijo(ana,pedro,10).
%hijo(juana,pedro,56).

%hijo(homero,abraham,0).
%hijo(herbert,abraham,1).
%hijo(cachito,herbert,6).

%hijo(homero,mona,8).

hijos(Persona,Hijos):-
    hijo(_,Persona,_),
    findall( Hijo , hijo(Hijo,Persona,_), Hijos).


total(Persona,Total):-
    persona(Persona),
    findall( Valor , hijo(_,Persona,Valor), Valores),
    sumlist(Valores,Total).


nieto(Nieto,Abuelo):-
    hijo(Nieto ,Alguien ),
    hijo(Alguien ,Abuelo ).

sinHijos(Alguien):-
    persona(Alguien),
    not( hijo(_,Alguien)).


granAbuelo(Alguien):-
    hijo(_,Alguien),
    forall(hijo(Hijo,Alguien),hijo(_,Hijo)).

descendiente(Alguien,Persona):-
    hijo(Alguien,Persona).

descendiente(Alguien,Persona):-
    hijo(Alguien,Otro),descendiente(Otro,Persona).


prolifico(Persona):-
    hijos(Persona,Hijos),
    longitud(Hijos,Cantidad),
    Cantidad > 3.

masDeUnHijo(Persona):-
    hijos(Persona,[_,_|_]).

padreDeHijoUnico(Persona):-
    hijos(Persona,[_]).


longitud([],0).
longitud([_|Cola],CantidadElementos):-
    longitud(Cola,CantidadElementosCola),
    CantidadElementos is CantidadElementosCola + 1.


