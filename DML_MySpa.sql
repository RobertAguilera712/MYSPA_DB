INSERT INTO persona(nombre, apellido_paterno, apellido_materno, domicilio, telefono, rfc) VALUES("Carlos","Vega","Pérez","Mar de Cortés #305", "4772345687", "VEPC850428GFV"),
("María","Rodríguez","Menchaca","Palmasur #123", "4771233417", "ROMM960312TDS"),
("Pablo","Cortés","Dávila","Parque Agua Azul #238", "4770192721", "CODP890112GUD"),
("Rosa","López","Andrade","Corregidora #827", "4771728121", "LOAR991123HSJ"),
("Carla","Yépez","Pola","Tralera #121", "4779821212", "YEPC000823UTD"),
("Martha","Vargas","Olla","Roles #234", "4771293201", "VAOM941104IOP"),
("Walter","Jiménez","Roa","Pinos #999", "4779201921", "JIRW981213OIA"),
("Tamara","Veláquez","Parra","Romero #192", "4779201212", "VEPT881204ORP"),
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

INSERT INTO empleado(num_empleado, puesto, estatus, fotografia, ruta_fotografia, id_persona, id_usuario) VALUES("EVEPC20210801","Gerente",1,"","",1,1),
("EROMM20210801","Recepcionista",1,"","",2,2),
("ECODP20210801","Técnico",1,"","",3,3),
("ELOAR20210801","Técnico",1,"","",4,4),
("EYEPC20210801","Técnico",1,"","",5,5);

INSERT INTO cliente(num_unico_cliente, correo, estatus, id_persona, id_usuario) VALUES("VAOM20210801","mar102@gmail.com",6,6,6),
("JIRW20210801","walterbig@gmail.com",7,7,7),
("VEPT20210801","tamatama@gmail.com",8,8,8),
("TEVN20210801","nonoterrones@gmail.com",9,9,9),
("PASO20210801","padilla12312@gmail.com",10,10,10);

INSERT INTO sucursal(nombre, domicilio, longitud, latitud) VALUES("Sucursal Centro","Belizario Dominguez, #418, Col. Centro",-101.682636, 21.12117),
("Sucursal Arbide","Puerto Rico, #418, Col. Arbide",-101.696867, 21.123116),
("Sucursal Villa Insurgentes","Ignacio Pérez, #403, Col. Villa Insurgentes",-101.682901, 21.190017);

INSERT INTO sala(nombre, descripcion, fotografia, ruta_fotografia, estatus, id_sucursal) VALUES("Nature","Sala que te llevará a una calma total, centrada completamente en productos naturistas","","",1,1),
("Aqua","Sala que te transportará a una profunda relajación, el tema principal de la sala es el agua","","",1,3),
("Meditation","Sala con una vibra muy baja para aquellos que quieren relajarse, nuestros especialistas lo guiarán por una profunda meditación","","",1,2),
("Balance","La sala más activa de todas, aquí activarás tu cuerpo, éste se sentira más vivo que nunca. Diversas mecánica de activación te llevará a descubrir que tu físico es genial","","",1,3),
("Peace","Sala centrada en el amor propio, en esta sala harás una introspección y te encontrarás contigo mismo","","",1,1);

INSERT INTO producto(nombre, marca, estatus, precio_uso) VALUES("Aceite de Albahaca","healths",1,"25"),
("Aceite de Coco","healths",1,"25"),
("Aceite de argán","healths",1,"35"),
("Velas aromáticas","wald",1,"25"),
("Aceite esencial de Cardamomo","healths",1,"25");

INSERT INTO tratamiento(nombre, descripcion) VALUES("Aromaterapia","Descansa mientras inhalas esencias naturales que te llevarán a otro nivel de relajación"),
("Circuito de aguas","En un circuito de aguas, el cliente pasa por diferentes chorros de agua que se encuentran a diferentes temperaturas y que sirven para hidratar la piel y para relajar todo el cuerpo."),
("Masajes","Los masajes terapéuticos se realizan con el objetivo de curar problemas musculares, y por lo tanto tienen un objetivo médico y deben de ser realizados por fisioterapeutas titulados."),
("Ducha de sensaciones","Es una combinación del masaje tradicional con bastantes incorporaciones de esencias aromáticas, así como otros elementos de la naturaleza."),
("Tratamiento de belleza","Existen diferentes tratamientos de belleza en los Spa, en los que la mayoría pretende mejorar la apariencia de la piel.");

