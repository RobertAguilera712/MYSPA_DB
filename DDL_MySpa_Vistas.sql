use myspa;
DROP VIEW IF EXISTS v_empleados;
CREATE VIEW v_empleados AS
    SELECT P.*,
           E.id_empleado,
           E.num_empleado,
           E.puesto,
           E.estatus,
           E.fotografia,
           E.ruta_fotografia,
           U.*
   FROM    persona P
   INNER JOIN empleado E ON E.id_persona = P.id_persona
   INNER JOIN usuario U ON U.id_usuario = E.id_usuario;
   
   DROP VIEW IF EXISTS v_clientes;
   CREATE VIEW v_clientes AS
       SELECT  P.*,
               C.id_cliente,
               C.correo,
               C.num_unico_cliente,
               C.estatus,
               U.*
	  FROM     persona P
	  INNER JOIN cliente C ON C.id_persona = P.id_persona
      INNER JOIN usuario U ON U.id_usuario = C.id_usuario;
      
      DROP VIEW IF EXISTS v_sucursales_salas;
      CREATE VIEW v_sucursales_salas AS
          SELECT SU.*,
          SA.id_sala,
          SA.nombre AS nombre_sala,
          SA.descripcion,
          SA.fotografia,
          SA.ruta_fotografia,
          SA.estatus AS estatus_sala
    FROM sucursal SU
	INNER JOIN sala SA ON SA.id_sucursal = SU.id_sucursal;
    
    DROP VIEW IF EXISTS v_reservacion;
      CREATE VIEW v_reservacion AS
          SELECT P.*,
          C.id_cliente,
          C.correo,
          C.num_unico_cliente,
          R.id_reservacion,
          DATE_FORMAT(R.fecha, '%d/%m/%Y') AS fecha,
          R.estatus,
          S.id_sala,
          S.nombre AS nombre_sala,
          S.fotografia AS foto_sala,
          S.ruta_fotografia AS ruta_foto_sala,
          S.estatus AS estatus_sala
  FROM persona P
  INNER JOIN cliente C ON C.id_persona = P.id_persona
  INNER JOIN reservacion R ON R.id_cliente = C.id_cliente
  INNER JOIN sala S ON S.id_sala = R-id_sala;
  