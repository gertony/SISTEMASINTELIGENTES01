carrera(ingenieria_sistemas, [matematicas, tecnologia, analitico]).
carrera(ingenieria_industrial, [matematicas, negocios, organizado]).
carrera(medicina, [biologia, salud, empatico]).
carrera(psicologia, [comunicacion, salud, reflexivo]).
carrera(derecho, [argumentacion, justicia, extrovertido]).
carrera(administracion, [liderazgo, negocios, organizado]).
carrera(economia, [analisis, finanzas, critico]).
carrera(arquitectura, [dibujo, diseño, creativo]).
carrera(diseno_grafico, [dibujo, arte, innovador]).
carrera(ingenieria_civil, [fisica, construccion, minucioso]).
carrera(contabilidad, [matematicas, finanzas, detallista]).
carrera(marketing, [liderazgo, publicidad, extrovertido]).
carrera(turismo, [comunicacion, viajes, sociable]).
carrera(relaciones_internacionales, [idiomas, politica, diplomatico]).

% Preguntar  y almacenar respuestas en una lista dinamica
preguntar_lista([], []).
preguntar_lista([Pregunta-Dato | Resto], Respuestas) :-
    write(Pregunta), write(' (si/no): '),
    read(Respuesta),
    nl,
    (Respuesta == si -> Respuestas = [Dato | RespuestasRestantes] ; Respuestas = RespuestasRestantes),
    preguntar_lista(Resto, RespuestasRestantes).

% Buscar carreras segun las coincidencias
buscar_carreras(Respuestas, Carreras) :-
    findall(Carrera, (carrera(Carrera, Requisitos), subset(Requisitos, Respuestas)), Carreras).

seleccionar_carrera :-
    write('Bienvenido al sistema de orientación vocacional.'), nl,
    write('Responde las siguientes preguntas:'), nl,
    
    Preguntas = [
        '¿Te gustan las matemáticas?'-matematicas,
        '¿Te gusta la biología?'-biologia,
        '¿Tienes habilidades de comunicación?'-comunicacion,
        '¿Eres bueno en dibujo técnico o artístico?'-dibujo,
        '¿Te interesa la tecnología?'-tecnologia,
        '¿Te interesa la salud?'-salud,
        '¿Tienes habilidades de liderazgo?'-liderazgo,
        '¿Eres analítico y detallista?'-analitico,
        '¿Te consideras creativo?'-creativo
    ],
    
    preguntar_lista(Preguntas, Respuestas),

    
    buscar_carreras(Respuestas, Carreras),

    % Mostrar resultados
    (Carreras \= [] ->
        (write('Según tus respuestas te recomendamos estudiar:'), nl, mostrar_lista(Carreras))
    ;
        write('No encontramos una carrera que se ajuste a ti, responde más preguntas con "si".'), nl).

%  mostrar una lista
mostrar_lista([]).
mostrar_lista([H | T]) :-
    write('- '), write(H), nl,
    mostrar_lista(T).
