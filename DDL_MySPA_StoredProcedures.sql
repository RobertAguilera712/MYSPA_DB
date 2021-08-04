
-- Stored Procedures
Use myspa;
-- Stored Procedure para insertar nuevos empleados.
DROP PROCEDURE IF EXISTS insertarEmpleado;
DELIMITER $$
CREATE PROCEDURE insertarEmpleado(     /*Datos Personales*/
                                   IN var_nombre          VARCHAR(64), -- 1
                                   IN var_apellidoPaterno VARCHAR(64), -- 2
								   IN var_apellidoMaterno VARCHAR(64), -- 3
								   IN var_genero          VARCHAR(64), -- 4
								   IN var_domicilio       VARCHAR(64), -- 5
                                   IN var_telefono        VARCHAR(64), -- 6
								   IN var_rfc             VARCHAR(64), -- 7
                                   
                                   /*Datos de Usuario*/
                                   IN var_nombreUsuario   VARCHAR(64), -- 8
                                   IN var_contrasenia     VARCHAR(64), -- 9
								   IN var_rol             VARCHAR(64), -- 10
                                   
                                   /*Datos de Empleado*/
                                   IN var_puesto          VARCHAR(64), -- 11
                                   IN var_foto            VARCHAR(64), -- 12
								   IN var_rutaFoto        VARCHAR(64), -- 13
								-- El numero de empleado no se considera porque no es actualizable
                                   
                                   /*ID's de las tablas relacionadas a empleado*/
                                   IN var_idPersona       INT,        -- 14
                                   IN var_idUsuario       INT,        -- 15
								   IN var_idEmpleado      INT         -- 16
                                   )
BEGIN
-- Comenzamamos insertando los datos de la Persona
INSERT INTO persona (nombre, apellidoPaterno, apellidoMaterno, genero,
                     domicilio, telefono, rfc)
		    VALUES(var_nombre, var_apellidoPaterno, var_apellidoMaterno, var_genero,
                     var_domicilio, var_telefono, var_rfc);
 -- Obtenemos el ID de Persona que se genero:
 SET var_idPersona = LAST_INSERT_ID();
 
 -- Inserrtamos los datos de seguridad de empleado
 INSERT INTO usuario (nombreUsuario, contrasenia, rol)
             VALUES  (var_nombreUsuario, var_contrasenia, var_rol);
 
 -- Obtenemos el id de Usuario que se genero
 SET var_idUsuario = LAST_INSERT_ID();
 
 -- Generamos el numero de empleado
 -- Comenzamos agregando el primer digito (la Letra E):
 SET var_numeroEmpleado = 'E';
 
 -- Agregamos los digitos del RFC que tiene
 IF LENGTH(var_rfc) >= 4 THEN 
    SET var_numeroEmpleado = CONCAT(var_numeroEmpleado, SUBSTRING(var_rfc, 1, 4));
 END IF;
 
-- Finalmente, agregamos el timestamp
SET var_numeroEmpleado = CONCAT(var_numeroEmpleado, CAST(UNIX_TIMESTAMP() AS CHAR));
 
-- Finalmente insertamos a la tabla de empleado
INSERT INTO empleado (numeroEmpleado, puesto, estatus, foto, rutaFoto,
                      idPersona, idUsuario)
            VALUES(var_numeroEmpleado, var_puesto, 1, var_foto,
                   var_rutaFoto, var_idPersona, var_idUsuario);
                   
-- Obtenemos el id del empleado que se genera 
SET var_idEmpleado = LAST_INSERT_ID();
END
$$
DELIMITER ;


-- Stored Procedure para actualizar empleados existentes.
DROP PROCEDURE IF EXISTS actualizarEmpleado;
DELIMITER $$
CREATE PROCEDURE actualizarEmpleado(     /*Datos Personales*/
                                   IN var_nombre          VARCHAR(64), -- 1
                                   IN var_apellidoPaterno VARCHAR(64), -- 2
								   IN var_apellidoMaterno VARCHAR(64), -- 3
								   IN var_genero          VARCHAR(64), -- 4
								   IN var_domicilio       VARCHAR(64), -- 5
                                   IN var_telefono        VARCHAR(64), -- 6
								   IN var_rfc             VARCHAR(64), -- 7
                                   
                                   /*Datos de Usuario*/
                                   IN var_nombreUsuario   VARCHAR(64), -- 8
                                   IN var_contrasenia     VARCHAR(64), -- 9
								   IN var_rol             VARCHAR(64), -- 10
                                   
                                   /*Datos de Empleado*/
                                   IN var_puesto          VARCHAR(64), -- 11
                                   IN var_foto            VARCHAR(64), -- 12
								   IN var_rutaFoto        VARCHAR(64), -- 13
                                   
                                   /*Valores de Retorno*/
                                   OUT var_idPersona       INT,        -- 14
                                   OUT var_idUsuario       INT,        -- 15
								   OUT var_idEmpleado      INT,        -- 16
                                   OUT var_numeroEmpleado  VARCHAR(64) -- 17
                                   )
BEGIN

-- Comenzamamos a actualizar los datos personales de empleado
UPDATE persona SET               nombre =  var_nombre,        
                                 apellidoPaterno =  var_apellidoPaterno, 
								 apellidoMaterno = var_apellidoMaterno,
								 genero =  var_genero,          
								 domicilio =  var_domicilio,      
                                 telefono =  var_telefono,       
								 rfc = var_rfc           
					WHERE        idPersona = var_idPersona;
                    

-- Actualizamos los datos de seguridad                    
UPDATE usuario SET               nombreUsuario =  var_nombreUsuario,        
                                 rol =  var_rol, 
								 idUsuario = var_idUsuario
					WHERE        idUsuario = var_idUsuario;
                    
                     
-- Actualizamos sus datos de empleado
UPDATE empleado SET              puesto = var_puesto,
                                 estatus = var_estatus,
                                 foto = var_foto,
                                 rutaFoto = var_rutaFoto
					WHERE        idEmpleado = var_idEmpleado;

END
$$
DELIMITER ;


-- Stored Procedure para insertar nuevos clientes.
DROP PROCEDURE IF EXISTS insertarCliente;
DELIMITER $$
CREATE PROCEDURE insertarCliente(     /*Datos Personales*/
                                   IN var_nombre          VARCHAR(64), -- 1
                                   IN var_apellidoPaterno VARCHAR(64), -- 2
								   IN var_apellidoMaterno VARCHAR(64), -- 3
								   IN var_genero          VARCHAR(64), -- 4
								   IN var_domicilio       VARCHAR(64), -- 5
                                   IN var_telefono        VARCHAR(64), -- 6
								   IN var_rfc             VARCHAR(64), -- 7
                                   
                                   /*Datos de Usuario*/
                                   IN var_nombreUsuario   VARCHAR(64), -- 8
                                   IN var_contrasenia     VARCHAR(64), -- 9
								   IN var_rol             VARCHAR(64), -- 10
                                   
                                   /*Datos de Empleado*/
                                   IN var_correo         VARCHAR(64), -- 11
                                   IN var_numeroUnico    VARCHAR(64), -- 12
								 
                                   
                                   /*Valores de Retorno*/
                                   OUT var_idPersona       INT,        -- 14
                                   OUT var_idUsuario       INT,        -- 15
								   OUT var_idCliente       INT         -- 16
                                   )
BEGIN
-- Comenzamamos insertando los datos de la Persona
INSERT INTO persona (nombre, apellidoPaterno, apellidoMaterno, genero,
                     domicilio, telefono, rfc)
		    VALUES(var_nombre, var_apellidoPaterno, var_apellidoMaterno, var_genero,
                     var_domicilio, var_telefono, var_rfc);
 -- Obtenemos el ID de Persona que se genero:
 SET var_idPersona = LAST_INSERT_ID();
 
 -- Inserrtamos los datos de seguridad del cliente
 INSERT INTO usuario (nombreUsuario, contrasenia, rol)
             VALUES  (var_nombreUsuario, var_contrasenia, var_rol);
 
 -- Obtenemos el id de Usuario que se genero
 SET var_idUsuario = LAST_INSERT_ID();
 
 
-- Finalmente insertamos a la tabla de cliente
INSERT INTO cliente (correo, numeroUnico, estatus,
                      idPersona, idUsuario)
            VALUES(var_correo, var_numeroUnico, 1, 
                   var_idPersona, var_idUsuario);
                   
-- Obtenemos el id del empleado que se genera 
SET var_idEmpleado = LAST_INSERT_ID();

END
$$
DELIMITER ;





-- Stored Procedure para actualizar empleados existentes.
DROP PROCEDURE IF EXISTS actualizarCliente;
DELIMITER $$
CREATE PROCEDURE actualizarCliente(     /*Datos Personales*/
                                   IN var_nombre          VARCHAR(64), -- 1
                                   IN var_apellidoPaterno VARCHAR(64), -- 2
								   IN var_apellidoMaterno VARCHAR(64), -- 3
								   IN var_genero          VARCHAR(64), -- 4
								   IN var_domicilio       VARCHAR(64), -- 5
                                   IN var_telefono        VARCHAR(64), -- 6
								   IN var_rfc             VARCHAR(64), -- 7
                                   
                                   /*Datos de Usuario*/
                                   IN var_nombreUsuario   VARCHAR(64), -- 8
                                   IN var_contrasenia     VARCHAR(64), -- 9
								   IN var_rol             VARCHAR(64), -- 10
                                   
                                   /*Datos de Cliente*/
                                   IN var_puesto          VARCHAR(64), -- 11
                                   IN var_clave           VARCHAR(64), -- 12
                                   
                                   /*ID's de las tablas relacionadas a empleado*/
                                   IN var_idPersona       INT,        -- 14
                                   IN var_idUsuario       INT,        -- 15
								   IN var_idEmpleado      INT         -- 16
                                   )
BEGIN

-- Comenzamamos a actualizar los datos personales de empleado
UPDATE persona SET               nombre =  var_nombre,        
                                 apellidoPaterno =  var_apellidoPaterno, 
								 apellidoMaterno = var_apellidoMaterno,
								 genero =  var_genero,          
								 domicilio =  var_domicilio,      
                                 telefono =  var_telefono,       
								 rfc = var_rfc           
					WHERE        idPersona = var_idPersona;
                    

-- Actualizamos los datos de seguridad                    
UPDATE usuario SET               nombreUsuario =  var_nombreUsuario,        
                                 rol =  var_rol, 
								 idUsuario = var_idUsuario
					WHERE        idUsuario = var_idUsuario;
                    
                     
-- Actualizamos sus datos de empleado
UPDATE cliente SET               correo = var_correo,
                                 cleve =  var_clave,
                                 estatus = var_estatus,
                                 rutaFoto = var_rutaFoto
					WHERE        idCliente = var_idCliente;

END
$$
DELIMITER ;



                                   
                                   
                                   
                                   
                                   
	
                                   
								 
                                   
                                   
                                   
