/* P1 (safety): ningun asiento llega a Vendido sin haber pasado por Reservado. */
A[] (Asiento.Vendido imply pasoPorReservado)

/* P2 (safety): nunca hay dos clientes con el mismo asiento reservado o comprado. */
A[] tenedores <= 1

/* P3 (safety): un asiento disponible no tiene titular. */
A[] (Asiento.Disponible imply titular == 0)

/* P4 (liveness): toda reserva termina en venta o vuelve a Disponible. */
Asiento.Reservado --> (Asiento.Vendido or Asiento.Disponible)

/* P5 (safety temporal): una reserva nunca dura mas de T_RESERVA. */
A[] (Asiento.Reservado imply Asiento.x <= T_RESERVA)

/* P6: el unico bloqueo posible es el asiento ya vendido. */
A[] (deadlock imply Asiento.Vendido)

/* R1 (alcanzabilidad): es posible vender el asiento. */
E<> Asiento.Vendido

/* R2 (alcanzabilidad): la expiracion de la reserva es alcanzable. */
E<> (Asiento.Reservado and Asiento.x == T_RESERVA)

/* R3 (alcanzabilidad): cualquier cliente, no solo el primero, puede obtener la entrada. */
E<> Cliente(3).ConEntrada

