INSERT INTO persona(nombre, apellido_paterno, apellido_materno, domicilio, telefono, rfc) VALUES("Carlos","Vega","Pérez","Mar de Cortés #305", "4772345687", "VEPC850428GFV"),
("María","Rodríguez","Menchaca","Palmasur #123", "4771233417", "ROMM960312TDS"),
("Pablo","Cortés","Dávila","Parque Agua Azul #238", "4770192721", "CODP890112GUD"),
("Rosa","López","Andrade","Corregidora #827", "4771728121", "LOAR991123HSJ"),
("Carla","Yépez","Pola","Tralera #121", "4779821212", "YEPC000823UTD"),
("Martha","Vargas","Olla","Roles #234", "4771293201", "VAOM941104IOP"),
("Walter","Jiménez","Roa","Pinos #999", "4779201921", "JIRW981213OIA"),
("Tamara","Veláquez","Parra","Camino Real #333", "4772182911", "TEVN861210IUY"),
("Norma","Terrones","Vázquez","Camino Real #333", "4772182911", "TEVN861210IUY"),
("Osmar","Padilla","Sepia","Delta #452", "4775247152", "PASO020221NJS");

INSERT INTO usuario(nombre, contrasenia, rol) VALUES("alih","tra12","Administrador"),
("mene","jaski21","Recepcionista"),
("udaa","aosp21","Técnico"),
("gafa","218831","Técnico"),
("yayt","akjsi12","Técnico"),
("yata","alksa12","Cliente"),
("lajs","posp12","Cliente"),
("pakw","ap2o12","Cliente"),
("paia","asj23","Cliente"),
("wiiu","laskl21","Cliente");

INSERT INTO empleado(num_empleado, puesto, estatus, fotografia, ruta_fotografia, id_persona, id_usuario) VALUES("EVEPC20210801","Gerente",1,"","",1,3),
("EVEPC20210801","Gerente",1,"","",1,1),
("EVEPC20210801","Gerente",1,"","",1,1),
("EVEPC20210801","Gerente",1,"","",1,1),
("EVEPC20210801","Gerente",1,"","",1,1);
