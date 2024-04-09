/**********Creacion de tablas**********/

CREATE TABLE USUARIO (
    usuario_id           INT PRIMARY KEY NOT NULL,
    nombre               VARCHAR(60),
    correo_electronico   VARCHAR(50),
    contraseña           VARCHAR(20),
    saldo                INT
);

CREATE TABLE MONEDA (
    divisa_id            INT PRIMARY KEY NOT NULL,
    divisa_nombre        VARCHAR(60),
    divisa_simbolo       VARCHAR(50)
);

CREATE TABLE TRANSFERENCIA (
    transferencia_id     INT PRIMARY KEY,
    envio_usuario_id     INT,
    recibo_usuario_id    INT,
    importe              INT,
    transferencia_fecha  DATE,
    id_divisa            INT,
    FOREIGN KEY (envio_usuario_id) REFERENCES USUARIO(usuario_id),
    FOREIGN KEY (recibo_usuario_id) REFERENCES USUARIO(usuario_id),
    FOREIGN KEY (id_divisa) REFERENCES MONEDA(divisa_id)
);

/********** Inserte datos a BD **********/

INSERT INTO MONEDA (divisa_id, divisa_nombre, divisa_simbolo)
VALUES 
    (1, 'USD', 'Dólar estadounidense'),
    (2, 'EUR', 'Euro'),
    (3, 'JPY', 'Yen japonés');
    
    
INSERT INTO USUARIO (usuario_id, nombre, correo_electronico, contraseña, saldo)
VALUES 
    (1, 'Novak Djokovic', 'novak@example.com', 'contraseña1', 500),
    (2, 'Roger Federer', 'roger.f@example.com', 'contraseña2', 700),
    (3, 'Rafael Nada', 'rafa@example.com', 'contraseña3', 300),
    (4, 'Ana Martínez', 'ana@example.com', 'password123', 300),
    (5, 'Pedro López', 'pedro@example.com', 'contraseña456', 250),
    (6, 'Laura Rodríguez', 'laura@example.com', 'password789', 180),
    (7, 'David Sánchez', 'david@example.com', 'clave123', 400),
    (8, 'Sofía García', 'sofia@example.com', 'contraseña789', 350),
    (9, 'Diego Fernández', 'diego@example.com', 'password321', 220),
    (10, 'Elena Pérez', 'elena@example.com', 'clave456', 280);

INSERT INTO TRANSFERENCIA (transferencia_id, envio_usuario_id, recibo_usuario_id, importe, transferencia_fecha, id_divisa)
VALUES 
    (1, 1, 2, 100, '2024-04-05', 1),
    (2, 2, 1, 150, '2024-04-06', 2),
    (3, 3, 1, 200, '2024-04-07', 3);

/**********Crear consultas SQL**********/

/*consulta para obtener el nombre de la moneda elegida por usuario especifico*/

SELECT U.nombre AS nombre_usuario, M.divisa_nombre AS nombre_moneda
FROM USUARIO U
INNER JOIN TRANSFERENCIA T ON U.usuario_id = T.envio_usuario_id
INNER JOIN MONEDA M ON T.id_divisa = M.divisa_id
WHERE U.usuario_id = 1; /*Novak Djocovic*/

/*Consulta para obtener todas las transacciones registradas*/

SELECT * FROM TRANSFERENCIA;

/*Consulta para obtener todas las transacciones realizadas por un usuario específico*/

SELECT *
FROM TRANSFERENCIA
WHERE envio_usuario_id = 1;

/*Sentencia DML para modificar el campo correo electrónico de un usuario específico*/

UPDATE USUARIO
SET correo_electronico = 'roger.federer@example.com'
WHERE usuario_id = 2;                                       /*En esta consulta pido modificar correo*/
SELECT *                                                    /*Con este comando me muestra el cambio*/
FROM USUARIO;

/*Sentencia para eliminar los datos de una transacción (eliminado de la fila completa)*/

DELETE FROM TRANSFERENCIA
WHERE transferencia_id=3;

SELECT *
FROM TRANSFERENCIA;