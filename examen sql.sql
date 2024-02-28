drop database if exists EduManaage;

create database EduManaage;

use EduManaage;

create table profesores(
id_profesor varchar(36) primary key,
nombre varchar(100),
apellido varchar(100),
correo_electronico varchar(100)
);

create table materia(
id_materia varchar(36) primary key,
nombre_materia varchar(100),
grupo_materia int,
id_profesor varchar(36),
cupos int,
foreign key (id_profesor) references profesores(id_profesor)
);

ALTER TABLE materia
ADD CONSTRAINT fk_materia_profesores
FOREIGN KEY (id_profesor) REFERENCES profesores(id_profesor);

create table alumnos(
id_alumno varchar(36) primary key,
carnet_alumno varchar(10),
nombre_alumno varchar(100),
apellido_alumno varchar(100),
edad_alumno int
);

create table inscripciones(
id_inscripcion varchar(36) primary key,
id_alumno varchar(36),
id_materia varchar(36),
fecha_inscripcion date,
estado enum("Activo","Inactivo"),
foreign key (id_alumno) references alumnos(id_alumno),
foreign key (id_materia) references materia(id_materia)
); 

ALTER TABLE inscripciones
ADD CONSTRAINT fk_inscripciones_alumnos
FOREIGN KEY (id_alumno) REFERENCES alumnos(id_alumno);

ALTER TABLE inscripciones
ADD CONSTRAINT fk_inscripciones_materia
FOREIGN KEY (id_materia) REFERENCES materia(id_materia);

create table calificaciones(
id_calificacion varchar(36) primary key,
id_inscripcion varchar(36),
calificacion_final decimal(5,2),
fecha_calificacion date,
foreign key (id_inscripcion) references inscripciones(id_inscripcion)
);

ALTER TABLE calificaciones
ADD CONSTRAINT fk_calificaciones_inscripciones
FOREIGN KEY (id_inscripcion) REFERENCES inscripciones(id_inscripcion);

DELIMITER //

CREATE TRIGGER actualizar_cupos AFTER INSERT ON inscripciones
FOR EACH ROW
BEGIN
    UPDATE materia
    SET cupos = cupos - 1
    WHERE id_materia = NEW.id_materia;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE insertar_profesor(
    IN p_nombre_profesor VARCHAR(100),
    IN p_apellido_profesor VARCHAR(100),
    IN p_correo_profesor VARCHAR(100)
)
BEGIN
    INSERT INTO profesores(id_profesor, nombre, apellido, correo_electronico)
    VALUES (UUID(), p_nombre_profesor, p_apellido_profesor, p_correo_profesor);
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE insertar_materia(
    IN p_nombre_materia VARCHAR(100),
    IN p_grupo_materia INT,
    IN p_cupos INT,
    IN p_id_profesor VARCHAR(36)
)
BEGIN
    INSERT INTO materia(id_materia, nombre_materia, grupo_materia, id_profesor, cupos)
    VALUES (UUID(), p_nombre_materia, p_grupo_materia, p_id_profesor, p_cupos);
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE insertar_alumno(
    IN p_carnet_alumno VARCHAR(10),
    IN p_nombre_alumno VARCHAR(100),
    IN p_apellido_alumno VARCHAR(100),
    IN p_edad_alumno INT
)
BEGIN
    INSERT INTO alumnos(id_alumno, carnet_alumno, nombre_alumno, apellido_alumno, edad_alumno)
    VALUES (UUID(), p_carnet_alumno, p_nombre_alumno, p_apellido_alumno, p_edad_alumno);
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE insertar_inscripcion(
    IN p_id_alumno VARCHAR(36),
    IN p_id_materia VARCHAR(36),
    IN p_fecha_inscripcion DATE,
    IN p_estado ENUM('Activo','Inactivo')
)
BEGIN
    INSERT INTO inscripciones(id_inscripcion, id_alumno, id_materia, fecha_inscripcion, estado)
    VALUES (UUID(), p_id_alumno, p_id_materia, p_fecha_inscripcion, p_estado);
END //

DELIMITER ;

-- para la tabla profesores--
CALL insertar_profesor('John', 'Doe', 'johndoe@example.com');
CALL insertar_profesor('Alice', 'Smith', 'alicesmith@example.com');
CALL insertar_profesor('Michael', 'Johnson', 'michaeljohnson@example.com');
CALL insertar_profesor('Emily', 'Brown', 'emilybrown@example.com');
CALL insertar_profesor('David', 'Miller', 'davidmiller@example.com');
CALL insertar_profesor('Sarah', 'Johnsons', 'sarahjohnson@example.com');
CALL insertar_profesor('Robert', 'Williams', 'robertwilliams@example.com');
CALL insertar_profesor('Jennifer', 'Davis', 'jenniferdavis@example.com');
CALL insertar_profesor('Daniel', 'Wilson', 'danielwilson@example.com');
CALL insertar_profesor('Jessica', 'Martinez', 'jessicamartinez@example.com');
CALL insertar_profesor('Andrew', 'Anderson', 'andrewanderson@example.com');
CALL insertar_profesor('Olivia', 'Taylor', 'oliviataylor@example.com');
CALL insertar_profesor('Matthew', 'Thomas', 'matthewthomas@example.com');
CALL insertar_profesor('Sophia', 'Jackson', 'sophiajackson@example.com');
CALL insertar_profesor('William', 'White', 'williamwhite@example.com');

select * from profesore;

-- para la tabla materias 
CALL insertar_materia('Matemáticas', 1, 30, '31258e1e-d651-11ee-87bf-cc853680dedb');
CALL insertar_materia('Ciencias', 2, 25, 'c3fa8bb1-d657-11ee-87bf-cc853680dedb');
CALL insertar_materia('Historia', 3, 20, 'c3fbaddb-d657-11ee-87bf-cc853680dedb');
CALL insertar_materia('Literatura', 4, 15, 'c3fc1927-d657-11ee-87bf-cc853680dedb');
CALL insertar_materia('Física', 5, 10, 'c3fc62bf-d657-11ee-87bf-cc853680dedb');
CALL insertar_materia('Química', 6, 12, 'c3fcb049-d657-11ee-87bf-cc853680dedb');
CALL insertar_materia('Geografía', 7, 18, 'c3fcf6e7-d657-11ee-87bf-cc853680dedb');
CALL insertar_materia('Inglés', 8, 15, 'c3fd384c-d657-11ee-87bf-cc853680dedb');
CALL insertar_materia('Economía', 9, 20, 'c3fd7ce9-d657-11ee-87bf-cc853680dedb');
CALL insertar_materia('Programación', 10, 25, 'c3fd7ce9-d657-11ee-87bf-cc853680dedb');
CALL insertar_materia('Arte', 11, 10, 'c3fdc915-d657-11ee-87bf-cc853680dedb');
CALL insertar_materia('Educación Física', 12, 15, 'c3fe11a9-d657-11ee-87bf-cc853680dedb');
CALL insertar_materia('Psicología', 13, 16, 'id_profesor_13');
CALL insertar_materia('Biología', 14, 22, 'id_profesor_14');
CALL insertar_materia('Filosofía', 15, 14, 'id_profesor_15');

-- para la tabla alumno--
CALL insertar_alumno('A12345', 'John', 'Doe', 20);
CALL insertar_alumno('B67890', 'Alice', 'Smith', 22);
CALL insertar_alumno('C24680', 'Michael', 'Johnson', 18);
CALL insertar_alumno('D13579', 'Emily', 'Brown', 21);
CALL insertar_alumno('E97531', 'David', 'Miller', 19);
CALL insertar_alumno('F24681', 'Sophie', 'Johnson', 19);
CALL insertar_alumno('G35792', 'Oliver', 'Smith', 20);
CALL insertar_alumno('H46803', 'Isabella', 'Davis', 21);
CALL insertar_alumno('I57914', 'Ethan', 'Wilson', 18);
CALL insertar_alumno('J68025', 'Mia', 'Martinez', 22);
CALL insertar_alumno('K79136', 'Noah', 'Anderson', 19);
CALL insertar_alumno('L80247', 'Ava', 'Taylor', 20);
CALL insertar_alumno('M91358', 'Liam', 'Thomas', 21);
CALL insertar_alumno('N02469', 'Emma', 'Jackson', 18);
CALL insertar_alumno('O13570', 'Lucas', 'White', 22);

select * from alumnos;

select * from materia;

-- tabla inscripcion --

CALL insertar_inscripcion('326914ee-d653-11ee-87bf-cc853680dedb', '7452672a-d658-11ee-87bf-cc853680dedb', '2024-02-28', 'Activo');
CALL insertar_inscripcion('edac7c25-d657-11ee-87bf-cc853680dedb', '74538993-d658-11ee-87bf-cc853680dedb', '2024-02-29', 'Activo');
CALL insertar_inscripcion('edacf192-d657-11ee-87bf-cc853680dedb', '745405b2-d658-11ee-87bf-cc853680dedb', '2024-03-01', 'Inactivo');
CALL insertar_inscripcion('edad6bba-d657-11ee-87bf-cc853680dedb', '74545cd0-d658-11ee-87bf-cc853680dedb', '2024-03-02', 'Activo');
CALL insertar_inscripcion('edadca49-d657-11ee-87bf-cc853680dedb', '7454c4f1-d658-11ee-87bf-cc853680dedb', '2024-03-03', 'Inactivo');
CALL insertar_inscripcion('edae30c3-d657-11ee-87bf-cc853680dedb', '745527ef-d658-11ee-87bf-cc853680dedb', '2024-03-04', 'Activo');
CALL insertar_inscripcion('edae8966-d657-11ee-87bf-cc853680dedb', '74559792-d658-11ee-87bf-cc853680dedb', '2024-03-05', 'Inactivo');
CALL insertar_inscripcion('edaee274-d657-11ee-87bf-cc853680dedb', '74566e55-d658-11ee-87bf-cc853680dedb', '2024-03-06', 'Activo');
CALL insertar_inscripcion('edaf2890-d657-11ee-87bf-cc853680dedb', '74572e73-d658-11ee-87bf-cc853680dedb', '2024-03-07', 'Activo');
CALL insertar_inscripcion('edaf697f-d657-11ee-87bf-cc853680dedb', '74579423-d658-11ee-87bf-cc853680dedb', '2024-03-08', 'Inactivo');
CALL insertar_inscripcion('edafbea0-d657-11ee-87bf-cc853680dedb', '7457edbb-d658-11ee-87bf-cc853680dedb', '2024-03-09', 'Activo');
CALL insertar_inscripcion('edb003ff-d657-11ee-87bf-cc853680dedb', 'a4a6f10e-d651-11ee-87bf-cc853680dedb', '2024-03-10', 'Activo');
CALL insertar_inscripcion('edb09e18-d657-11ee-87bf-cc853680dedb', 'id_materia_13', '2024-03-11', 'Inactivo');
CALL insertar_inscripcion('edb0f5ed-d657-11ee-87bf-cc853680dedb', 'id_materia_14', '2024-03-12', 'Activo');
CALL insertar_inscripcion('edb138ff-d657-11ee-87bf-cc853680dedb', 'id_materia_15', '2024-03-13', 'Activo');


 select* from  inscripciones

