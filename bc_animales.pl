% Hechos
es(leon).
es(tigre).
es(elefante).
es(jirafa).
es(cebra).
es(pinguino).
es(avestruz).
es(cocodrilo).
es(serpiente).
es(rana).
es(delfin).
es(ballena).
es(tiburon).
es(aguila).
es(buho).
es(oso_polar).
es(camello).

% Características de los animales

tiene_pelo(leon).
es_carnivoro(leon).
vive_en_manada(leon).
es_social(leon).
tiene_gran_tamano(leon).

tiene_pelo(tigre).
es_carnivoro(tigre).
tiene_rayas(tigre).
poblacion_reducida(tigre).

tiene_pelo(elefante).
tiene_trompa(elefante).
es_herbivoro(elefante).
tiene_gran_tamano(elefante).
es_social(elefante).

tiene_pelo(jirafa).
tiene_cuello_largo(jirafa).
es_herbivoro(jirafa).
tiene_gran_tamano(jirafa).

tiene_pelo(cebra).
tiene_rayas(cebra).
es_herbivoro(cebra).
es_social(cebra).

tiene_plumas(pinguino).
no_vuela(pinguino).
nada_bien(pinguino).
tiene_grasa_corporal(pinguino).
es_ave(pinguino).

tiene_plumas(avestruz).
no_vuela(avestruz).
corre_rapido(avestruz).
es_ave(avestruz).

tiene_escamas(cocodrilo).
es_carnivoro(cocodrilo).
vive_en_agua_y_tierra(cocodrilo).
es_reptil(cocodrilo).

tiene_escamas(serpiente).
no_tiene_patas(serpiente).
es_carnivoro(serpiente).
es_reptil(serpiente).
es_venenoso(serpiente).

tiene_piel_humeda(rana).
salta_bien(rana).
vive_en_agua_y_tierra(rana).
es_anfibio(rana).

tiene_piel_suave(delfin).
es_inteligente(delfin).
vive_en_agua(delfin).
es_mamifero(delfin).
es_social(delfin).

tiene_piel_suave(ballena).
es_mamifero_marino(ballena).
es_el_animal_mas_grande(ballena).
tiene_grasa_corporal(ballena).
vive_en_agua(ballena).

tiene_escamas(tiburon).
es_carnivoro(tiburon).
tiene_aleta_dorsal(tiburon).
vive_en_agua(tiburon).

tiene_plumas(aguila).
vuela_alto(aguila).
tiene_vista_aguda(aguila).
es_ave(aguila).
es_carnivoro(aguila).
habitat_amenazado(aguila).

tiene_plumas(buho).
es_nocturno(buho).
gira_cabeza_270_grados(buho).
es_ave(buho).
es_carnivoro(buho).

tiene_pelo(oso_polar).
es_carnivoro(oso_polar).
tiene_pelaje_grueso(oso_polar).
tiene_grasa_corporal(oso_polar).
adaptado_a_clima_extremo(oso_polar, frio).
es_mamifero(oso_polar).
tiene_gran_tamano(oso_polar).

tiene_pelo(camello).
es_herbivoro(camello).
puede_sobrevivir_sin_agua(camello).
adaptado_a_clima_extremo(camello, calido).
es_mamifero(camello).
tiene_gran_tamano(camello).

% Regla 1: Determina si un animal es terrestre
es_terrestre(X) :- es(X), not(vive_en_agua(X)), not(vive_en_agua_y_tierra(X)).
% Esta regla identificará animales que viven exclusivamente en tierra

% Regla 2: Identifica depredadores
es_depredador(X) :- es(X), es_carnivoro(X).
% Esta regla clasifica como depredador a cualquier animal carnívoro

% Regla 3: Determina si un animal es nocturno
es_nocturno(X) :- es(X), es_nocturno(X).
% Esta regla identifica animales específicamente clasificados como nocturnos

% Regla 4: Determina el hábitat principal
habitat_principal(X, Habitat) :-
    es(X),
    (vive_en_agua(X), Habitat = acuatico;
     vive_en_agua_y_tierra(X), Habitat = anfibio;
     es_terrestre(X), Habitat = terrestre).
% Esta regla clasifica el hábitat principal de un animal

% Regla 5 (actualizada): Identifica animales con protección natural
tiene_proteccion_natural(X, Proteccion) :-
    es(X),
    (tiene_escamas(X), Proteccion = escamas;
     tiene_pelaje_grueso(X), Proteccion = pelaje_grueso;
     tiene_gran_tamano(X), Proteccion = tamano_grande;
     tiene_aleta_dorsal(X), Proteccion = aleta_dorsal;
     es_venenoso(X), Proteccion = veneno).
% Esta regla identifica animales con algún tipo de protección natural en su cuerpo

% Regla 6: Encuentra animales por su método de movilidad
metodo_movilidad(X, Metodo) :-
    es(X),
    (vuela_alto(X), Metodo = volar;
     nada_bien(X), Metodo = nadar;
     corre_rapido(X), Metodo = correr;
     salta_bien(X), Metodo = saltar).
% Esta regla clasifica a los animales según su método principal de movilidad

% Regla 7: Determina si un animal es peligroso para los humanos
es_peligroso_para_humanos(X) :-
    es(X),
    (es_carnivoro(X); es_venenoso(X); tiene_gran_tamano(X)).
% Esta regla identifica animales que podrían ser peligrosos para los humanos

% Regla 8: Determina si un animal es bueno para domesticar
es_domesticable(X) :-
    es(X),
    (es_social(X), not(es_peligroso_para_humanos(X))).
% Esta regla sugiere qué animales podrían ser buenos para domesticar

% Regla 9: Encuentra animales con adaptaciones para climas extremos
adaptado_a_clima_extremo(X, Clima) :-
    es(X),
    (tiene_pelaje_grueso(X), Clima = frio;
     tiene_grasa_corporal(X), Clima = frio;
     puede_sobrevivir_sin_agua(X), Clima = calido).
% Esta regla identifica animales adaptados a climas fríos o cálidos

% Regla 10: Encuentra animales por su método de reproducción
metodo_reproduccion(X, Metodo) :-
    es(X),
    (es_mamifero(X), Metodo = viviparo;
     es_ave(X), Metodo = oviparo;
     es_reptil(X), Metodo = oviparo;
     es_anfibio(X), Metodo = oviparo).
% Esta regla clasifica a los animales por su método de reproducción

% Regla 11: Identifica animales en peligro de extinción
en_peligro_extincion(X) :-
    es(X),
    (poblacion_reducida(X); habitat_amenazado(X)).
% Esta regla encuentra animales que podrían estar en peligro de extinción






