
--Ejemplo de disparador BEFORE con INSERT
--Paso 1:Generar tabla
CREATE TABLE MAYORES( ID INTEGER PRIMARY KEY,
                      NOMBRE VARCHAR2 (60),
                      EDAD INTEGER);
--Paso 2: Generar un disparador que impida registrar usuarios menores de edad en la tabla MAYORES

CREATE OR REPLACE TRIGGER DISP_MAYORES BEFORE INSERT ON MAYORES
FOR EACH ROW --garantiza que dispare en cada fila, si se ejecuta un cursor
BEGIN
IF:NEW.EDAD< 18 THEN
raise_application_error(-20000, 'EDAD INCORRECTA'); --Es una excepcion en oracle
END IF;
END;
/


INSERT INTO MAYORES VALUES(1, 'KAREN', 20);
SELECT * FROM MAYORES;
INSERT INTO MAYORES VALUES(2, 'CARLOS', 16);


--Ejemplo 2: desiparador de tipo BEFORE con operacion UPDATE
--Generar tabla
CREATE TABLE NOMINAS(ID INTEGER PRIMARY KEY,
                    SUELDO_BASE FLOAT,
                    HORAS_LABORADAS INTEGER,
                    DEPOSITO FLOAT);
                    
INSERT INTO NOMINAS VALUES(1, 2000, 20, 28000);
INSERT INTO NOMINAS VALUES(2, 1000, 16, 50000);

SELECT * FROM NOMINAS;

--Usar un disparador que lleve a cabo dicha actualizacion
--NOTA:Las horas laboradas pueden variar pero no el sueldo base

CREATE OR REPLACE TRIGGER DISP_NOMINAS BEFORE UPDATE ON NOMINAS
FOR EACH ROW
BEGIN
--Inciiamos la logica del disparador
:NEW.DEPOSITO:=:OLD.DEPOSITO+:NEW.HORAS_LABORADAS * :OLD.SUELDO_BASE;
END;
/

--Probar que funcione para el update del    cuyo id=1 cambiar las horas_laboradas=20

UPDATE NOMINAS SET ID=1