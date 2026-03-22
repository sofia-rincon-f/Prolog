% ============================================================
% SISTEMA DE ENVIOS - PEREIRA, COLOMBIA
% Tarifas basadas en:
%   - Resolucion 5318 de 2024 (MinTransporte) - Costos operacionales
%   - Circular 024 de 2023 (SuperTransporte)  - Mensajeria expresa
%   - Tarifas de referencia: Servientrega, Coordinadora, Deprisa, Envia 2024
% Moneda: Pesos Colombianos (COP)
% ============================================================

:- use_module(library(lists)).

% ============================================================
% BLOQUE 1: HECHOS DE LA BASE DE DATOS
% ============================================================

% vehiculo(ID, Tipo, Capacidad_kg, Consumo_L_100km, Disponible)
vehiculo(v1, camion,  5000, 15, si).
vehiculo(v2, moto,     100,  4, si).
vehiculo(v3, furgon,  1500, 10, no).
vehiculo(v4, camion,  4500, 14, si).
vehiculo(v5, moto,      80,  3, si).

% conductor(ID, Nombre, Licencia, Experiencia_anios, Disponible)
% Licencias Decreto 1079/2015 MinTransporte:
%   A2 = motos | B1 = hasta 3.5 t | C1 = camion > 3.5 t
conductor(c1, 'Ana Lopez',       b1, 5, si).
conductor(c2, 'Luis Garcia',     a2, 2, si).
conductor(c3, 'Maria Cardona',   c1, 8, si).
conductor(c4, 'Pedro Ramirez',   b1, 1, no).
conductor(c5, 'Jorge Castillo',  c1, 6, si).
conductor(c6, 'Claudia Ospina',  b1, 4, si).
conductor(c7, 'Ricardo Marin',   a2, 3, si).

% conductor_para_tipo(TipoVehiculo, LicenciaRequerida)
conductor_para_tipo(moto,   a2).
conductor_para_tipo(furgon, b1).
conductor_para_tipo(camion, c1).

% envio(ID, Peso_kg, Distancia_km, Prioridad)
envio(e1,  300,  50, alta).
envio(e2,   90, 200, normal).
envio(e3, 1200,  80, alta).

% costo_base(TipoVehiculo, COP_por_km)
costo_base(moto,    1200).
costo_base(furgon,  2800).
costo_base(camion,  4200).

% factor_prioridad(Nivel, Factor)
factor_prioridad(alta,   1.50).
factor_prioridad(normal, 1.00).
factor_prioridad(baja,   0.85).

% forma_pago(ID, Nombre, Factor_recargo)
forma_pago(contraentrega,   'Contraentrega (pago al recibir)',         1.03).
forma_pago(pse,             'PSE - Pago en Linea (transferencia)',     1.00).
forma_pago(tarjeta_debito,  'Tarjeta Debito',                          1.00).
forma_pago(tarjeta_credito, 'Tarjeta Credito',                         1.02).
forma_pago(nequi,           'Nequi / Daviplata (billetera digital)',    1.00).

% ruta(Destino, Origen, Gasolina_L, Tiempo_h, Kilometraje_km)
ruta(armenia,           pereira,   6,   1.0,   60).
ruta(manizales,         pereira,   7,   1.2,   90).
ruta(ibague,            pereira,  15,   2.5,  150).
ruta(cali,              pereira,  25,   4.0,  210).
ruta(popayan,           pereira,  42,   7.0,  380).
ruta(pasto,             pereira,  73,  12.0,  640).
ruta(quibdo,            pereira,  38,   6.5,  340).
ruta(bogota,            pereira,  37,   7.0,  320).
ruta(tunja,             pereira,  47,   8.0,  430).
ruta(neiva,             pereira,  43,   7.5,  390).
ruta(florencia,         pereira,  60,  10.0,  540).
ruta(mocoa,             pereira,  83,  14.0,  750).
ruta(villavicencio,     pereira,  55,   9.5,  510).
ruta(medellin,          pereira,  23,   4.0,  220).
ruta(bucaramanga,       pereira,  60,  10.0,  560).
ruta(cucuta,            pereira,  81,  13.5,  740).
ruta(arauca,            pereira, 103,  17.0,  950).
ruta(yopal,             pereira,  73,  12.0,  670).
ruta(barranquilla,      pereira,  88,  15.0,  820).
ruta(cartagena,         pereira,  88,  15.0,  820).
ruta(monteria,          pereira,  70,  12.0,  640).
ruta(sincelejo,         pereira,  82,  14.0,  750).
ruta(valledupar,        pereira, 100,  17.0,  930).
ruta(santa_marta,       pereira,  98,  16.5,  900).
ruta(riohacha,          pereira, 108,  18.0,  990).
ruta(san_jose_guaviare, pereira,  80,  13.5,  730).

% capital_solo_avion(Destino, Departamento)
capital_solo_avion(leticia,        amazonas).
capital_solo_avion(mitu,           vaupes).
capital_solo_avion(puerto_inirida, guainia).
capital_solo_avion(san_andres,     san_andres_providencia).

% ============================================================
% CLIENTES
% cliente(Cedula, NombreCompleto, Ciudad_destino)
% ============================================================
cliente(1088310452, 'Carlos Perez',     bogota).
cliente(1094920371, 'Laura Gomez',      cali).
cliente(71234567,   'Sergio Torres',    medellin).
cliente(24856321,   'Diana Rios',       manizales).
cliente(10847563,   'Julian Mora',      armenia).
cliente(91502847,   'Andrea Castro',    bucaramanga).
cliente(72304815,   'Miguel Vargas',    barranquilla).
cliente(73048291,   'Valentina Ospina', cartagena).
cliente(10293847,   'Jorge Salcedo',    neiva).
cliente(12873645,   'Natalia Herrera',  pasto).
cliente(1094837261, 'Camilo Gutierrez', cali).
cliente(60394827,   'Isabella Ruiz',    cucuta).
cliente(17382940,   'Andres Martinez',  ibague).
cliente(86039274,   'Luisa Fernandez',  villavicencio).
cliente(70293847,   'Sebastian Mora',   medellin).

% ============================================================
% PAQUETES
% paquete(Ref4dig, Descripcion, Peso_kg, Longitud_cm, Cedula, Prioridad)
% ============================================================
paquete(1001, laptops_empresariales,    30, 45, 1088310452,  alta).
paquete(1002, tablets_educativas,       75, 30, 1094920371,  normal).
paquete(1003, servidores_rack,          75, 90, 71234567,    alta).
paquete(1004, drones_industriales,      50, 60, 24856321,    normal).
paquete(1005, smartphones_corporativos, 70, 18, 10847563,    baja).
paquete(1006, routers_empresariales,    40, 35, 91502847,    normal).
paquete(1007, camaras_seguridad,        55, 50, 91502847,    alta).
paquete(1021, fibra_optica_rollo,       30, 80, 91502847,    normal).
paquete(1022, gabinetes_rack_19,        70, 95, 91502847,    alta).
paquete(1008, parlantes_bluetooth,      25, 40, 72304815,    baja).
paquete(1009, monitores_4k,             90, 80, 73048291,    alta).
paquete(1010, discos_duros_externos,    15, 20, 73048291,    normal).
paquete(1011, impresoras_laser,         80, 65, 10293847,    normal).
paquete(1012, teclados_mecanicos,       20, 45, 10293847,    baja).
paquete(1013, cables_red_fibra,         35, 55, 12873645,    normal).
paquete(1014, ups_industriales,         95, 60, 1094837261,  alta).
paquete(1015, proyectores_hd,           45, 70, 1094837261,  normal).
paquete(1023, pantallas_interactivas,   60, 85, 1094837261,  alta).
paquete(1024, estaciones_recarga_usb,   20, 30, 1094837261,  baja).
paquete(1016, switch_de_red,            30, 40, 60394827,    alta).
paquete(1017, access_points,            20, 30, 17382940,    normal).
paquete(1018, baterias_portatiles,      25, 25, 17382940,    baja).
paquete(1025, repetidores_wifi,         15, 25, 17382940,    normal).
paquete(1026, antenas_direccionales,    35, 60, 17382940,    alta).
paquete(1019, brazos_roboticos,         60, 85, 86039274,    alta).
paquete(1020, sensores_iot,             15, 15, 70293847,    normal).

% ============================================================
% ESTADO DE PEDIDOS
% estado_pedido(Ref, Estado, Checkpoint_actual)
% ============================================================
estado_pedido(1001, en_camino,      'En transito - Checkpoint Honda (Cundinamarca)').
estado_pedido(1002, en_preparacion, 'Bodega principal - Pereira').
estado_pedido(1003, recibido,       'Sede de recepcion - Pereira').
estado_pedido(1004, en_camino,      'En transito - Checkpoint Anserma (Caldas)').
estado_pedido(1005, entregado,      'Entregado en destino - Armenia').
estado_pedido(1006, en_camino,      'En transito - Checkpoint Barbosa (Antioquia)').
estado_pedido(1007, en_preparacion, 'Bodega principal - Pereira').
estado_pedido(1008, recibido,       'Sede de recepcion - Pereira').
estado_pedido(1009, en_camino,      'En transito - Checkpoint Bello (Antioquia)').
estado_pedido(1010, en_preparacion, 'Bodega principal - Pereira').
estado_pedido(1011, entregado,      'Entregado en destino - Neiva').
estado_pedido(1012, en_camino,      'En transito - Checkpoint Cartago (Valle)').
estado_pedido(1013, recibido,       'Sede de recepcion - Pereira').
estado_pedido(1014, en_preparacion, 'Bodega principal - Pereira').
estado_pedido(1015, en_camino,      'En transito - Checkpoint La Pintada (Antioquia)').
estado_pedido(1016, recibido,       'Sede de recepcion - Pereira').
estado_pedido(1017, en_preparacion, 'Bodega principal - Pereira').
estado_pedido(1018, en_camino,      'En transito - Checkpoint Ibague (Tolima)').
estado_pedido(1019, en_camino,      'En transito - Checkpoint Villeta (Cundinamarca)').
estado_pedido(1020, recibido,       'Sede de recepcion - Pereira').
estado_pedido(1021, recibido,       'Sede de recepcion - Pereira').
estado_pedido(1022, en_preparacion, 'Bodega principal - Pereira').
estado_pedido(1023, en_camino,      'En transito - Checkpoint La Pintada (Antioquia)').
estado_pedido(1024, recibido,       'Sede de recepcion - Pereira').
estado_pedido(1025, en_preparacion, 'Bodega principal - Pereira').
estado_pedido(1026, en_camino,      'En transito - Checkpoint Cajamarca (Tolima)').

% ============================================================
% RASTREO AVANZADO
% checkpoint_rastreo(Ref, LugarActual, KmRecorridos, VehiculoAsignado)
% Registra cuantos km lleva recorridos cada paquete en camino.
% Permite calcular km restantes y tiempo estimado de llegada.
% ============================================================
checkpoint_rastreo(1001, 'Honda, Cundinamarca',       180, v1).
checkpoint_rastreo(1004, 'Anserma, Caldas',            35, v2).
checkpoint_rastreo(1006, 'Barbosa, Antioquia',        130, v4).
checkpoint_rastreo(1009, 'Bello, Antioquia',          200, v1).
checkpoint_rastreo(1012, 'Cartago, Valle del Cauca',   40, v2).
checkpoint_rastreo(1015, 'La Pintada, Antioquia',     170, v4).
checkpoint_rastreo(1018, 'Ibague, Tolima',             70, v2).
checkpoint_rastreo(1019, 'Villeta, Cundinamarca',     140, v1).
checkpoint_rastreo(1023, 'La Pintada, Antioquia',     170, v4).
checkpoint_rastreo(1026, 'Cajamarca, Tolima',          80, v2).

% ============================================================
% INCONVENIENTES
% inconveniente_paquete(Ref, TipoProblema, Descripcion)
% Registra alertas activas sobre paquetes o vehiculos.
% Tipos: demora, dano_paquete, accidente_vehiculo,
%        retencion_via, clima_adverso, averia_vehiculo
% ============================================================
inconveniente_paquete(1006, demora,
    'Demora por paro vial en la via Medellin-Bucaramanga. Retraso estimado: 3 horas.').
inconveniente_paquete(1009, averia_vehiculo,
    'El vehiculo v1 reporto una averia mecanica en Bello (Antioquia). En espera de vehiculo de reemplazo.').
inconveniente_paquete(1018, clima_adverso,
    'Cierre temporal de la via por derrumbe en el sector Cajamarca-Calarca (Tolima). Retraso estimado: 5 horas.').
inconveniente_paquete(1019, retencion_via,
    'Control de autoridades en la via Bogota-Honda. El paquete fue retenido para inspeccion de rutina. Se reanuda en 1 hora.').

% ============================================================
% VELOCIDAD PROMEDIO POR TIPO DE VEHICULO (km/h en carretera)
% Fuente: datos reales de transito Mininterior Colombia 2024
% ============================================================
velocidad_promedio(camion, 65).
velocidad_promedio(furgon, 70).
velocidad_promedio(moto,   75).

% ============================================================
% BLOQUE 2: REGLAS DE CALCULO
% ============================================================

costo_con_prioridad(EnvioID, VehiculoID, CostoFinal) :-
    envio(EnvioID, _, Distancia, Prioridad),
    vehiculo(VehiculoID, Tipo, _, _, si),
    costo_base(Tipo, CostoKm),
    factor_prioridad(Prioridad, Factor),
    CostoFinal is CostoKm * Distancia * Factor.

indice_eficiencia(VehiculoID, Indice) :-
    vehiculo(VehiculoID, _, Capacidad, Consumo, _),
    Consumo > 0,
    Indice is Capacidad / Consumo.

conductor_apto(ConductorID, EnvioID) :-
    conductor(ConductorID, _, Licencia, Experiencia, si),
    (Licencia = b1 ; Licencia = c1),
    Experiencia >= 3,
    envio(EnvioID, _, _, _).

vehiculo_mas_eficiente(VehiculoID) :-
    vehiculo(VehiculoID, _, _, _, si),
    indice_eficiencia(VehiculoID, Indice),
    \+ (
        vehiculo(OtroID, _, _, _, si),
        OtroID \= VehiculoID,
        indice_eficiencia(OtroID, OtroIndice),
        OtroIndice > Indice
    ).

plan_envio_completo(EnvioID, VehiculoID, ConductorID, CostoFinal) :-
    envio(EnvioID, Peso, _, _),
    vehiculo(VehiculoID, _, Capacidad, _, si),
    Capacidad >= Peso,
    conductor_apto(ConductorID, EnvioID),
    costo_con_prioridad(EnvioID, VehiculoID, CostoFinal).

plan_paquete_cliente(Ref, Cedula, VehiculoID, Km, Tiempo, CostoFinal) :-
    paquete(Ref, _, PesoKg, _, Cedula, Prioridad),
    cliente(Cedula, _, Ciudad),
    ruta(Ciudad, pereira, _, Tiempo, Km),
    vehiculo(VehiculoID, Tipo, Capacidad, _, si),
    Capacidad >= PesoKg,
    costo_base(Tipo, CostoKm),
    factor_prioridad(Prioridad, Factor),
    CostoFinal is CostoKm * Km * Factor.

ruta_mas_economica(Destino, Km, LitrosMin) :-
    findall(G-D, ruta(D, pereira, G, _, _), Lista),
    Lista \= [],
    min_gasolina(Lista, LitrosMin-Destino),
    ruta(Destino, pereira, LitrosMin, _, Km).

min_gasolina([G-D], G-D).
min_gasolina([G1-D1|Resto], Min) :-
    min_gasolina(Resto, G2-_D2),
    ( G1 =< G2 -> Min = G1-D1 ; min_gasolina(Resto, Min) ).

paquete_mas_barato_cliente(Cedula, Descripcion, CostoMin) :-
    findall(
        C-Desc,
        (   paquete(Ref, Desc, _, _, Cedula, _),
            plan_paquete_cliente(Ref, Cedula, _, _, _, C)
        ),
        Lista
    ),
    Lista \= [],
    min_costo_paquete(Lista, CostoMin-Descripcion).

min_costo_paquete([C-D], C-D).
min_costo_paquete([C1-D1|Resto], Min) :-
    min_costo_paquete(Resto, C2-D2),
    ( C1 =< C2 -> Min = C1-D1 ; Min = C2-D2 ).

vehiculo_optimo(Ref, Cedula, TipoVehiculo, VehiculoID, CostoFinal, Razon) :-
    paquete(Ref, _, PesoKg, _, Cedula, Prioridad),
    cliente(Cedula, _, Ciudad),
    ruta(Ciudad, pereira, _, _, Km),
    findall(
        Costo-VID-Tipo,
        (   vehiculo(VID, Tipo, Cap, _, si),
            Cap >= PesoKg,
            costo_base(Tipo, CostoKm),
            factor_prioridad(Prioridad, Factor),
            Costo is CostoKm * Km * Factor
        ),
        Lista
    ),
    Lista \= [],
    msort(Lista, [CostoFinal-VehiculoID-TipoVehiculo|_]),
    razon_vehiculo(TipoVehiculo, Razon).

razon_vehiculo(moto,   'Paquete ligero: la moto es la opcion mas economica y agil.').
razon_vehiculo(furgon, 'Peso intermedio: el furgon equilibra costo y capacidad.').
razon_vehiculo(camion, 'Paquete pesado: el camion es el unico con capacidad suficiente.').

mejor_opcion_envio(Ref, Cedula, TiempoH, CostoMin) :-
    findall(C-T, plan_paquete_cliente(Ref, Cedula, _, _, T, C), Lista),
    Lista \= [],
    min_costo(Lista, CostoMin-TiempoH).

min_costo([C-T], C-T).
min_costo([C1-T1|Resto], Min) :-
    min_costo(Resto, C2-T2),
    ( C1 =< C2 -> Min = C1-T1 ; Min = C2-T2 ).

conductor_asignado(TipoVehiculo, NombreConductor) :-
    conductor_para_tipo(TipoVehiculo, LicenciaReq),
    conductor(_CID, NombreConductor, LicenciaReq, _Exp, si),
    !.
conductor_asignado(_, 'Sin conductor disponible').

longitud_valida(LongCm) :-
    LongCm > 0,
    LongCm =< 150.

generar_numero_factura(Ref, NumFactura) :-
    atomic_list_concat(['PE', Ref, '2024'], '-', NumFactura).

generar_orden_rechazo(Ref, NumOrden) :-
    atomic_list_concat(['RCH', Ref, '2024'], '-', NumOrden).

% ============================================================
% REGLAS DE RASTREO AVANZADO
% ============================================================

% Calcula km restantes y tiempo estimado segun checkpoint actual
calcular_progreso(Ref, KmTotal, KmRecorridos, KmRestantes, TiempoRestH) :-
    checkpoint_rastreo(Ref, _, KmRecorridos, VID),
    vehiculo(VID, Tipo, _, _, _),
    velocidad_promedio(Tipo, VelKmH),
    KmRestantes is KmTotal - KmRecorridos,
    TiempoRestH is KmRestantes / VelKmH.

% Porcentaje de avance del recorrido
porcentaje_avance(KmRecorridos, KmTotal, Pct) :-
    KmTotal > 0,
    Pct is round((KmRecorridos * 100) / KmTotal).

% ============================================================
% BLOQUE 3: UTILIDADES DE PRESENTACION
% ============================================================

etiqueta_prioridad(alta,   'Envio urgente   (+50% sobre tarifa base - entrega prioritaria)').
etiqueta_prioridad(normal, 'Envio estandar  (tarifa base - entrega en tiempo normal)').
etiqueta_prioridad(baja,   'Envio economico (-15% sobre tarifa base - entrega flexible)').

etiqueta_estado(recibido,       '[ RECIBIDO ]       Su pedido fue registrado y esta en espera.').
etiqueta_estado(en_preparacion, '[ EN PREPARACION ] Su pedido esta siendo empacado y verificado.').
etiqueta_estado(en_camino,      '[ EN CAMINO ]      Su pedido ya salio y va en ruta hacia usted.').
etiqueta_estado(entregado,      '[ ENTREGADO ]      Su pedido fue entregado exitosamente.').

etiqueta_inconveniente(demora,           '!! DEMORA EN RUTA         !!').
etiqueta_inconveniente(dano_paquete,     '!! DANO EN PAQUETE        !!').
etiqueta_inconveniente(accidente_vehiculo,'!! ACCIDENTE DE VEHICULO  !!').
etiqueta_inconveniente(retencion_via,    '!! RETENCION EN VIA       !!').
etiqueta_inconveniente(clima_adverso,    '!! CLIMA ADVERSO EN RUTA  !!').
etiqueta_inconveniente(averia_vehiculo,  '!! AVERIA DEL VEHICULO    !!').

opcion_a_prioridad(1, alta).
opcion_a_prioridad(2, normal).
opcion_a_prioridad(3, baja).
opcion_a_prioridad(_, normal).

mostrar_cop(Valor) :-
    ValorInt is round(Valor),
    format('COP $~d', [ValorInt]).

mostrar_barra_progreso(Pct) :-
    Bloques is round(Pct / 5),
    write('['),
    mostrar_bloques(Bloques, 20),
    write('] '),
    format('~w%~n', [Pct]).

mostrar_bloques(0, 0) :- !.
mostrar_bloques(0, Restantes) :-
    Restantes > 0,
    write('.'),
    R1 is Restantes - 1,
    mostrar_bloques(0, R1).
mostrar_bloques(Llenos, Restantes) :-
    Llenos > 0,
    write('#'),
    L1 is Llenos - 1,
    R1 is Restantes - 1,
    mostrar_bloques(L1, R1).

mostrar_paquete_completo(Ref, Desc, PesoKg, LongCm, Cedula, Prior) :-
    etiqueta_prioridad(Prior, Etiqueta),
    format('~n--- Referencia: ~w ---~n', [Ref]),
    format('Producto  : ~w~n',           [Desc]),
    format('Peso      : ~w kg~n',        [PesoKg]),
    format('Longitud  : ~w cm~n',        [LongCm]),
    format('Servicio  : ~w~n',           [Etiqueta]),
    (   mejor_opcion_envio(Ref, Cedula, TiempoH, CostoMin)
    ->  format('Tiempo est.: ~w horas~n', [TiempoH]),
        write('Costo     : '), mostrar_cop(CostoMin), nl
    ;   write('Sin opciones de envio disponibles.'), nl
    ),
    (   estado_pedido(Ref, Estado, Checkpoint)
    ->  etiqueta_estado(Estado, MensajeEstado),
        format('Estado    : ~w~n',   [MensajeEstado]),
        format('Ubicacion : ~w~n',   [Checkpoint])
    ;   write('Estado    : Sin informacion de seguimiento.'), nl
    ),
    write('................................................'), nl.

cotizar_segun_destino(D) :-
    (   capital_solo_avion(D, _)
    ->  nl,
        write('Lo sentimos: ese destino no tiene cobertura terrestre.'), nl,
        write('Solo es accesible por via aerea desde Pereira.'), nl
    ;   ruta(D, pereira, _, _, _)
    ->  nl,
        write('Tenemos cobertura disponible para ese destino.'), nl, nl,
        write('--- Datos del paquete ---'), nl,
        write('Ingrese el peso del paquete en kg    : '), read(Peso),
        write('Ingrese la longitud del paquete en cm: '), read(LongCm),
        nl,
        (   \+ longitud_valida(LongCm)
        ->  write('AVISO: La longitud ingresada supera los 150 cm.'), nl,
            write('Segun la NTC-3837 y politica Coordinadora/Servientrega,'), nl,
            write('paquetes mayores a 150 cm requieren cotizacion especial.'), nl,
            write('Contacte a un asesor para gestionar este envio.'), nl
        ;   write('Tipo de servicio:'), nl,
            write('  (1) Envio urgente    [+50% sobre tarifa base]'), nl,
            write('  (2) Envio estandar   [tarifa base sin recargo]'), nl,
            write('  (3) Envio economico  [-15% sobre tarifa base]'), nl,
            write('Opcion: '), read(OpServ),
            opcion_a_prioridad(OpServ, Prior),
            (   ruta(D, pereira, _, TiempoH, Km),
                vehiculo(VID, Tipo, Capacidad, _, si),
                Capacidad >= Peso,
                costo_base(Tipo, CostoKm),
                factor_prioridad(Prior, Factor),
                Costo is CostoKm * Km * Factor
            ->  etiqueta_prioridad(Prior, Etiqueta),
                conductor_asignado(Tipo, NombreConductor),
                nl,
                write('=== RESULTADO DE COTIZACION ==='), nl,
                format('Origen         : Pereira~n'),
                format('Destino        : ~w~n',       [D]),
                format('Distancia      : ~w km~n',    [Km]),
                format('Longitud paq.  : ~w cm~n',    [LongCm]),
                format('Peso paq.      : ~w kg~n',    [Peso]),
                format('Vehiculo asig. : ~w (~w)~n',  [Tipo, VID]),
                format('Conductor      : ~w~n',       [NombreConductor]),
                format('Tiempo est.    : ~w horas~n', [TiempoH]),
                format('Tipo servicio  : ~w~n',       [Etiqueta]),
                write('Costo estimado : '), mostrar_cop(Costo), nl, nl,
                write('Tarifas segun Res. 5318/2024 MinTransporte'), nl,
                write('y politica comercial vigente 2024.'), nl,
                write('================================================'), nl,
                nl,
                write('Desea aceptar esta cotizacion?'), nl,
                write('  (1) Aceptar - Confirmar el envio'), nl,
                write('  (2) Rechazar - Cancelar la cotizacion'), nl,
                write('Opcion: '), read(Decision),
                procesar_decision_cotizacion(Decision, D, Peso, LongCm, Tipo, VID,
                                             NombreConductor, TiempoH, Km, Etiqueta, Costo)
            ;   write('No hay vehiculos disponibles para ese peso.'), nl
            )
        )
    ;   nl,
        write('Ciudad no encontrada en nuestra cobertura.'), nl,
        write('Verifique el nombre e intentelo de nuevo.'), nl
    ).

procesar_decision_cotizacion(1, D, Peso, LongCm, Tipo, VID,
                              NombreConductor, TiempoH, Km, Etiqueta, Costo) :-
    !,
    Semilla is Km * 10 + Peso,
    atomic_list_concat(['PRE', Semilla, '2024'], '-', PreFactura),
    nl,
    write('================================================'), nl,
    write('        COTIZACION ACEPTADA - PRE-FACTURA       '), nl,
    write('================================================'), nl,
    format('No. Pre-Factura  : ~w~n',      [PreFactura]),
    format('Destino          : ~w~n',      [D]),
    format('Peso             : ~w kg~n',   [Peso]),
    format('Longitud         : ~w cm~n',   [LongCm]),
    format('Vehiculo asig.   : ~w (~w)~n', [Tipo, VID]),
    format('Conductor        : ~w~n',      [NombreConductor]),
    format('Distancia        : ~w km~n',   [Km]),
    format('Tiempo est.      : ~w h~n',    [TiempoH]),
    format('Tipo servicio    : ~w~n',      [Etiqueta]),
    write('Costo base       : '), mostrar_cop(Costo), nl,
    write('------------------------------------------------'), nl,
    write('Estado           : CONFIRMADO - Pendiente pago'), nl,
    write('Dirijase a la opcion 4 para elegir forma de pago.'), nl,
    write('================================================'), nl.

procesar_decision_cotizacion(2, D, Peso, _LongCm, _Tipo, _VID,
                              _NombreConductor, _TiempoH, Km, _Etiqueta, _Costo) :-
    !,
    Semilla is Km * 10 + Peso,
    atomic_list_concat(['RCH', Semilla, '2024'], '-', NumOrden),
    nl,
    write('================================================'), nl,
    write('           COTIZACION RECHAZADA                 '), nl,
    write('================================================'), nl,
    format('Orden de rechazo : ~w~n',    [NumOrden]),
    format('Destino          : ~w~n',    [D]),
    format('Peso             : ~w kg~n', [Peso]),
    write('Estado           : CANCELADA'), nl,
    write('La cotizacion ha sido cancelada.'), nl,
    write('================================================'), nl.

procesar_decision_cotizacion(_, D, Peso, LongCm, Tipo, VID,
                              NombreConductor, TiempoH, Km, Etiqueta, Costo) :-
    write('Opcion no valida. Elija (1) Aceptar o (2) Rechazar: '),
    read(Decision2),
    procesar_decision_cotizacion(Decision2, D, Peso, LongCm, Tipo, VID,
                                 NombreConductor, TiempoH, Km, Etiqueta, Costo).

buscar_vehiculo_optimo(Entrada) :-
    number(Entrada),
    !,
    (   paquete(Entrada, Desc, PesoKg, LongCm, Cedula, _),
        cliente(Cedula, NombreCliente, _),
        vehiculo_optimo(Entrada, Cedula, TipoV, VID, Costo, Razon)
    ->  write('================================================'), nl,
        write('       VEHICULO RECOMENDADO PARA SU PEDIDO      '), nl,
        write('================================================'), nl,
        format('Cliente          : ~w~n',     [NombreCliente]),
        format('Cedula           : ~w~n',     [Cedula]),
        format('Referencia       : ~w~n',     [Entrada]),
        format('Producto         : ~w~n',     [Desc]),
        format('Peso del paquete : ~w kg~n',  [PesoKg]),
        format('Longitud         : ~w cm~n',  [LongCm]),
        format('Vehiculo optimo  : ~w (~w)~n',[TipoV, VID]),
        write('Costo estimado   : '), mostrar_cop(Costo), nl,
        format('Por que          : ~w~n',     [Razon]),
        write('================================================'), nl
    ;   write('No encontramos ese numero de referencia.'), nl
    ).
buscar_vehiculo_optimo(Entrada) :-
    atom(Entrada),
    !,
    (   cliente(Cedula, Entrada, Ciudad)
    ->  findall(Ref-Desc-Peso-Long,
                paquete(Ref, Desc, Peso, Long, Cedula, _),
                Paquetes),
        (   Paquetes = []
        ->  write('No tiene paquetes registrados en su cuenta.'), nl
        ;   format('Cliente : ~w | Cedula: ~w | Destino: ~w~n',
                   [Entrada, Cedula, Ciudad]),
            write('================================================'), nl,
            mostrar_vehiculos_lista(Paquetes, Cedula)
        )
    ;   write('No encontramos un cliente registrado con ese nombre.'), nl
    ).
buscar_vehiculo_optimo(_) :-
    write('Entrada no reconocida. Ingrese un nombre o referencia numerica.'), nl.

mostrar_vehiculos_lista([], _).
mostrar_vehiculos_lista([Ref-Desc-Peso-Long|Resto], Cedula) :-
    (   vehiculo_optimo(Ref, Cedula, TipoV, VID, Costo, Razon)
    ->  format('~nReferencia       : ~w~n',   [Ref]),
        format('Producto         : ~w~n',     [Desc]),
        format('Peso del paquete : ~w kg~n',  [Peso]),
        format('Longitud         : ~w cm~n',  [Long]),
        format('Vehiculo optimo  : ~w (~w)~n',[TipoV, VID]),
        write('Costo estimado   : '), mostrar_cop(Costo), nl,
        format('Por que          : ~w~n',     [Razon]),
        write('................................................'), nl
    ;   format('~nReferencia ~w: Sin vehiculo disponible.~n', [Ref])
    ),
    mostrar_vehiculos_lista(Resto, Cedula).

proceso_facturacion_por_cedula(Cedula) :-
    (   cliente(Cedula, NombreCliente, Ciudad)
    ->  findall(Ref-Desc, paquete(Ref, Desc, _, _, Cedula, _), Paquetes),
        (   Paquetes = []
        ->  write('No encontramos paquetes registrados para esta cedula.'), nl
        ;   nl,
            write('================================================'), nl,
            write('         PAQUETES DISPONIBLES PARA PAGAR        '), nl,
            write('================================================'), nl,
            format('Cliente  : ~w~n', [NombreCliente]),
            format('Cedula   : ~w~n', [Cedula]),
            format('Destino  : ~w~n', [Ciudad]),
            write('------------------------------------------------'), nl,
            mostrar_lista_paquetes_numerada(Paquetes, 1),
            write('------------------------------------------------'), nl,
            write('Ingrese el numero de referencia a pagar: '),
            read(Ref),
            (   paquete(Ref, _, _, _, Cedula, _)
            ->  generar_factura_con_pago(Ref, NombreCliente, Ciudad, Cedula)
            ;   write('Esa referencia no corresponde a su cedula.'), nl
            )
        )
    ;   nl,
        write('No encontramos un cliente con esa cedula.'), nl
    ).

mostrar_lista_paquetes_numerada([], _).
mostrar_lista_paquetes_numerada([Ref-Desc|Resto], N) :-
    (   estado_pedido(Ref, Estado, _) -> true ; Estado = sin_registro ),
    format('  [~w] Ref ~w - ~w  | Estado: ~w~n', [N, Ref, Desc, Estado]),
    N1 is N + 1,
    mostrar_lista_paquetes_numerada(Resto, N1).

generar_factura_con_pago(Ref, NombreCliente, Ciudad, Cedula) :-
    mejor_opcion_envio(Ref, Cedula, TiempoH, CostoBase),
    paquete(Ref, Desc, PesoKg, LongCm, Cedula, Prior),
    etiqueta_prioridad(Prior, EtiquetaServ),
    nl,
    write('================================================'), nl,
    write('            RESUMEN DEL PEDIDO                  '), nl,
    write('================================================'), nl,
    format('Cliente          : ~w~n',   [NombreCliente]),
    format('Cedula           : ~w~n',   [Cedula]),
    format('Destino          : ~w~n',   [Ciudad]),
    format('Referencia       : ~w~n',   [Ref]),
    format('Producto         : ~w~n',   [Desc]),
    format('Peso             : ~w kg~n',[PesoKg]),
    format('Longitud         : ~w cm~n',[LongCm]),
    format('Tipo de servicio : ~w~n',   [EtiquetaServ]),
    format('Tiempo estimado  : ~w h~n', [TiempoH]),
    write('Costo base       : '), mostrar_cop(CostoBase), nl,
    write('================================================'), nl,
    nl,
    write('Seleccione su forma de pago:'), nl,
    write('------------------------------------------------'), nl,
    write('  CONTRAENTREGA'), nl,
    write('  (1) Pago al recibir el paquete  [+3% recargo]'), nl,
    write('------------------------------------------------'), nl,
    write('  PAGO POR WEB'), nl,
    write('  (2) PSE - Transferencia bancaria [sin recargo]'), nl,
    write('  (3) Tarjeta Debito               [sin recargo]'), nl,
    write('  (4) Tarjeta Credito              [+2% recargo]'), nl,
    write('  (5) Nequi / Daviplata            [sin recargo]'), nl,
    write('------------------------------------------------'), nl,
    write('Opcion: '),
    read(OpPago),
    opcion_a_forma_pago(OpPago, IDFormaPago),
    forma_pago(IDFormaPago, NombrePago, FactorPago),
    CostoFinal is CostoBase * FactorPago,
    Recargo    is CostoBase * (FactorPago - 1.00),
    generar_numero_factura(Ref, NumFactura),
    nl,
    write('================================================'), nl,
    write('              FACTURA DE ENVIO                  '), nl,
    write('================================================'), nl,
    format('No. Factura      : ~w~n',  [NumFactura]),
    format('Cliente          : ~w~n',  [NombreCliente]),
    format('Cedula           : ~w~n',  [Cedula]),
    format('Destino          : ~w~n',  [Ciudad]),
    format('Referencia       : ~w~n',  [Ref]),
    format('Producto         : ~w~n',  [Desc]),
    format('Tiempo estimado  : ~w h~n',[TiempoH]),
    write('------------------------------------------------'), nl,
    format('Forma de pago    : ~w~n',  [NombrePago]),
    write('Costo base       : '), mostrar_cop(CostoBase), nl,
    (   Recargo > 0
    ->  write('Recargo aplicado : '), mostrar_cop(Recargo), nl
    ;   write('Recargo aplicado : ninguno'), nl
    ),
    write('------------------------------------------------'), nl,
    write('TOTAL A PAGAR    : '), mostrar_cop(CostoFinal), nl,
    write('================================================'), nl,
    nl,
    mostrar_instrucciones_pago(IDFormaPago).

mostrar_instrucciones_pago(contraentrega) :-
    write('INSTRUCCIONES - CONTRAENTREGA'), nl,
    write('  * Tenga el valor exacto listo al recibir.'), nl,
    write('  * El mensajero cuenta con datafono.'), nl,
    write('  * Si no paga, el paquete sera devuelto.'), nl.
mostrar_instrucciones_pago(pse) :-
    write('INSTRUCCIONES - PSE'), nl,
    write('  * Ingrese a www.enviospereira.co/pse'), nl,
    write('  * Use su No. de Factura para identificar el pago.'), nl,
    write('  * El envio se despacha al confirmar el debito.'), nl.
mostrar_instrucciones_pago(tarjeta_debito) :-
    write('INSTRUCCIONES - TARJETA DEBITO'), nl,
    write('  * Ingrese a www.enviospereira.co/pago'), nl,
    write('  * Seleccione "Tarjeta Debito" en el portal.'), nl,
    write('  * Use su No. de Factura como referencia.'), nl.
mostrar_instrucciones_pago(tarjeta_credito) :-
    write('INSTRUCCIONES - TARJETA CREDITO'), nl,
    write('  * Ingrese a www.enviospereira.co/pago'), nl,
    write('  * Seleccione "Tarjeta Credito" en el portal.'), nl,
    write('  * Se aplica un recargo del 2% por procesamiento.'), nl.
mostrar_instrucciones_pago(nequi) :-
    write('INSTRUCCIONES - NEQUI / DAVIPLATA'), nl,
    write('  * Envie el pago al numero: 310-555-0199'), nl,
    write('  * Escriba el No. de Factura en el concepto.'), nl,
    write('  * Envie el comprobante a envios@pereira.co'), nl.

opcion_a_forma_pago(1, contraentrega).
opcion_a_forma_pago(2, pse).
opcion_a_forma_pago(3, tarjeta_debito).
opcion_a_forma_pago(4, tarjeta_credito).
opcion_a_forma_pago(5, nequi).
opcion_a_forma_pago(_, pse).

% ============================================================
% RASTREO EN TIEMPO REAL - OPCION 5
% rastrear_paquete/1
% Con el codigo del paquete muestra:
%   - Ubicacion exacta actual (checkpoint)
%   - Km recorridos y km restantes
%   - Barra de progreso visual
%   - Tiempo estimado de llegada
%   - Alertas de inconvenientes activos
% ============================================================
rastrear_paquete(Ref) :-
    (   paquete(Ref, Desc, _, _, Cedula, _),
        cliente(Cedula, NombreCliente, Ciudad),
        estado_pedido(Ref, Estado, CheckpointActual)
    ->  nl,
        write('================================================'), nl,
        write('        RASTREO EN TIEMPO REAL - PAQUETE        '), nl,
        write('================================================'), nl,
        format('Referencia       : ~w~n', [Ref]),
        format('Producto         : ~w~n', [Desc]),
        format('Cliente          : ~w~n', [NombreCliente]),
        format('Destino final    : ~w~n', [Ciudad]),
        write('------------------------------------------------'), nl,
        mostrar_rastreo_segun_estado(Ref, Estado, CheckpointActual, Ciudad)
    ;   write('No encontramos informacion para esa referencia.'), nl
    ).

% Caso: paquete ya entregado
mostrar_rastreo_segun_estado(Ref, entregado, Checkpoint, _Ciudad) :-
    !,
    write('ESTADO          : [ ENTREGADO ]'), nl,
    format('Ubicacion       : ~w~n', [Checkpoint]),
    write('Km recorridos   : 100% del trayecto completado'), nl,
    write('Tiempo restante : El paquete ya fue entregado.'), nl,
    write('================================================'), nl,
    mostrar_alerta_inconveniente(Ref).

% Caso: paquete en preparacion o recibido (aun en Pereira)
mostrar_rastreo_segun_estado(Ref, Estado, Checkpoint, Ciudad) :-
    (Estado = en_preparacion ; Estado = recibido),
    !,
    etiqueta_estado(Estado, MsgEstado),
    ruta(Ciudad, pereira, _, TiempoTotal, KmTotal),
    format('ESTADO          : ~w~n',     [MsgEstado]),
    format('Ubicacion actual: ~w~n',     [Checkpoint]),
    format('Km recorridos   : 0 de ~w km~n', [KmTotal]),
    write('Progreso        : '),
    mostrar_barra_progreso(0),
    format('Tiempo restante : ~w horas (estimado total)~n', [TiempoTotal]),
    write('Nota            : El paquete aun no ha salido de Pereira.'), nl,
    write('================================================'), nl,
    mostrar_alerta_inconveniente(Ref).

% Caso: paquete en camino con datos de checkpoint
mostrar_rastreo_segun_estado(Ref, en_camino, CheckpointActual, Ciudad) :-
    ruta(Ciudad, pereira, _, _, KmTotal),
    (   calcular_progreso(Ref, KmTotal, KmRecorridos, KmRestantes, TiempoRestH),
        checkpoint_rastreo(Ref, _, _, VID),
        vehiculo(VID, Tipo, _, _, _)
    ->  porcentaje_avance(KmRecorridos, KmTotal, Pct),
        TiempoRestRound is round(TiempoRestH * 10) / 10,
        conductor_asignado(Tipo, NombreConductor),
        write('ESTADO          : [ EN CAMINO ]'), nl,
        format('Ubicacion actual: ~w~n',       [CheckpointActual]),
        format('Vehiculo        : ~w (~w)~n',  [Tipo, VID]),
        format('Conductor       : ~w~n',        [NombreConductor]),
        write('------------------------------------------------'), nl,
        format('Km recorridos   : ~w de ~w km~n', [KmRecorridos, KmTotal]),
        format('Km restantes    : ~w km~n',        [KmRestantes]),
        write('Progreso        : '),
        mostrar_barra_progreso(Pct),
        format('Tiempo restante : ~w horas~n',     [TiempoRestRound]),
        write('------------------------------------------------'), nl,
        write('================================================'), nl,
        mostrar_alerta_inconveniente(Ref)
    ;   % En camino pero sin checkpoint detallado
        write('ESTADO          : [ EN CAMINO ]'), nl,
        format('Ubicacion actual: ~w~n', [CheckpointActual]),
        write('Progreso        : Datos de rastreo detallado no disponibles.'), nl,
        write('================================================'), nl,
        mostrar_alerta_inconveniente(Ref)
    ).

% Muestra alertas de inconvenientes si existen, o confirma sin novedades
mostrar_alerta_inconveniente(Ref) :-
    (   inconveniente_paquete(Ref, Tipo, Descripcion)
    ->  etiqueta_inconveniente(Tipo, EtiquetaAlerta),
        nl,
        write('================================================'), nl,
        write('  ALERTA DE INCONVENIENTE EN SU ENVIO          '), nl,
        write('================================================'), nl,
        format('Tipo de alerta  : ~w~n',  [EtiquetaAlerta]),
        format('Detalle         : ~w~n',  [Descripcion]),
        write('------------------------------------------------'), nl,
        write('Por este inconveniente el tiempo de entrega    '), nl,
        write('puede verse afectado. Le notificaremos cuando  '), nl,
        write('el envio retome su curso normal.               '), nl,
        write('Contacto urgente: 018000-ENVIOS (3684667)      '), nl,
        write('================================================'), nl
    ;   nl,
        write('>>> Sin inconvenientes reportados. Envio normal.'), nl
    ).

% ============================================================
% BLOQUE 4: MENU Y OPCIONES
% Todas las clausulas de ejecutar/1 juntas y continuas.
% ============================================================

menu :-
    nl,
    write('================================================'), nl,
    write('   BIENVENIDO AL PORTAL DE ENVIOS - PEREIRA    '), nl,
    write('================================================'), nl,
    write(' 1. Mis pedidos y estado de envio              '), nl,
    write(' 2. Cotizar envio / Aceptar o rechazar         '), nl,
    write(' 3. Ver vehiculo optimo para mi pedido         '), nl,
    write(' 4. Facturacion y forma de pago (por cedula)   '), nl,
    write(' 5. Rastrear mi paquete en tiempo real         '), nl,
    write(' 0. Salir                                      '), nl,
    write('================================================'), nl,
    write('Seleccione una opcion: '),
    read(Opcion),
    ejecutar(Opcion).

ejecutar(0) :-
    nl,
    write('================================================'), nl,
    write('  Gracias por usar nuestro servicio de envios. '), nl,
    write('  Hasta pronto desde Pereira, Colombia!        '), nl,
    write('================================================'), nl,
    nl.

ejecutar(1) :-
    nl,
    write('=== MIS PEDIDOS Y ESTADO DE ENVIO ==='), nl,
    write('Ingrese su nombre completo (ej: Carlos Perez): '),
    read(Nombre),
    (   cliente(Cedula, Nombre, Ciudad)
    ->  format('~nHola, ~w. Cedula: ~w | Destino: ~w~n', [Nombre, Cedula, Ciudad]),
        findall(R, paquete(R, _, _, _, Cedula, _), TodosRefs),
        length(TodosRefs, Total),
        format('Paquetes en su cuenta: ~w~n', [Total]),
        write('Ingrese referencia de 4 digitos o 0 para ver todos: '),
        read(CodEntrada),
        write('================================================'), nl,
        (   CodEntrada =:= 0
        ->  findall(Ref-Desc-Peso-Long-Prior,
                    paquete(Ref, Desc, Peso, Long, Cedula, Prior),
                    Paquetes),
            (   Paquetes = []
            ->  write('No tiene paquetes registrados en su cuenta.'), nl
            ;   maplist(
                    [Ref-Desc-Peso-Long-Prior]>>(
                        mostrar_paquete_completo(Ref, Desc, Peso, Long, Cedula, Prior)
                    ),
                    Paquetes)
            )
        ;   (   paquete(CodEntrada, Desc, PesoKg, LongCm, Cedula, Prior)
            ->  mostrar_paquete_completo(CodEntrada, Desc, PesoKg, LongCm, Cedula, Prior)
            ;   write('No encontramos esa referencia en su cuenta.'), nl
            )
        )
    ;   write('No encontramos un cliente registrado con ese nombre.'), nl
    ),
    nl, menu.

ejecutar(2) :-
    nl,
    write('=== COTIZAR ENVIO / ACEPTAR O RECHAZAR ==='), nl,
    write('Ingrese la ciudad destino (ej: bogota, cali, medellin): '),
    read(D),
    cotizar_segun_destino(D),
    nl, menu.

ejecutar(3) :-
    nl,
    write('=== VEHICULO OPTIMO PARA SU PEDIDO ==='), nl,
    write('Ingrese su nombre completo O la referencia de 4 digitos: '),
    read(Entrada),
    nl,
    buscar_vehiculo_optimo(Entrada),
    nl, menu.

ejecutar(4) :-
    nl,
    write('=== FACTURACION Y FORMA DE PAGO ==='), nl,
    write('Ingrese su numero de cedula: '),
    read(Cedula),
    proceso_facturacion_por_cedula(Cedula),
    nl, menu.

ejecutar(5) :-
    nl,
    write('=== RASTREO DE PAQUETE EN TIEMPO REAL ==='), nl,
    write('Ingrese el codigo de referencia de 4 digitos: '),
    read(Ref),
    rastrear_paquete(Ref),
    nl, menu.

ejecutar(9) :-
    nl,
    write('=== ANALISIS INTERNO: RUTA MAS ECONOMICA ==='), nl,
    (   ruta_mas_economica(Destino, Km, Litros)
    ->  write('---------------------------------------------'), nl,
        format('Destino    : ~w~n',    [Destino]),
        format('Kilometros : ~w km~n', [Km]),
        format('Gasolina   : ~w L~n',  [Litros]),
        write('---------------------------------------------'), nl,
        write('Esta ruta representa el menor gasto en'), nl,
        write('combustible para la flota desde Pereira.'), nl
    ;   write('No se pudo determinar la ruta mas economica.'), nl
    ),
    nl, menu.

ejecutar(_) :-
    write('Opcion no valida. Por favor elija una opcion del menu.'), nl,
    nl, menu.
