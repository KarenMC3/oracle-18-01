--A)CREAMOS LA TABLA

CREATE TABLE ALUMNO (ID_ALUMNO INTEGER PRIMARY KEY,
                     NOMBRE VARCHAR2(80),
                     SEMESTRE INTEGER);
                     
--B)INSERTAR REGISTROS CON SEMESRE=1

INSERT INTO ALUMNO VALUES(1,'KAREN',1);
INSERT INTO ALUMNO VALUES(2,'RODRIGO',1);
INSERT INTO ALUMNO VALUES(3,'CARLOS',1);
INSERT INTO ALUMNO VALUES(4,'ROCIO',1);
INSERT INTO ALUMNO VALUES(5,'LUIS',1);

SELECT * FROM ALUMNO;

--C)CREAR UN CURSOR DE TIPO UPDATE, PARA CAMBIAR EL SEMESTRE =2 PARA TODOS LOS ALUMNOS

DECLARE
CURSOR CUR_ALUMNOS IS SELECT * FROM ALUMNO FOR UPDATE OF SEMESTRE;
BEGIN
--ESTA ES UNA LOGICA MUY SIMPLE
FOR REC IN CUR_ALUMNOS LOOP
UPDATE ALUMNO SET SEMESTRE=2 WHERE CURRENT OF CUR_ALUMNOS;
END LOOP;
END;
/

--EJERCICIO 2:
CREATE TABLE MATERIA (ID_MATERIA INTEGER PRIMARY KEY,
                      CUENTA INTEGER,
                      MATERIA VARCHAR2(80),
                      CALIFICACION FLOAT,
                      CONSTRAINT FK_CTA FOREIGN KEY(CUENTA) REFERENCES ALUMNO(ID_ALUMNO));
                      
                      SELECT * FROM MATERIA;
                      
                      --GENERA SECUENCIA
                       CREATE SEQUENCE SEC_MATERIA
                       START WITH 1
                       INCREMENT BY 1
                       NOMAXVALUE;
                       
                       
                       --CREAR PROCEDIMIENTO Y ENLACE DE TABLA Y SECUENCIA
                      
                      CREATE OR REPLACE PROCEDURE GUARDAR_MATERIA(MY_ID OUT INTEGER, MY_CUENTA IN INTEGER, MY_MATERIA IN VARCHAR2, MY_CALIFICACION IN FLOAT)
                      AS
                      BEGIN
                      SELECT SEC_MATERIA.NEXTVAL INTO MY_ID FROM DUAL;
                      INSERT INTO MATERIA VALUES(MY_ID, MY_CUENTA, MY_MATERIA, MY_CALIFICACION);
                      END;
                      /
                      
                      
                      DECLARE
                      VALOR INTEGER;
                      BEGIN
                      GUARDAR_MATERIA(VALOR, 2, 'INGENIERIA SISTEMAS', 8);
                      DBMS_OUTPUT.PUT_LINE('EL PK GENERADO ES '||VALOR);
                      END;
                      /


                    SELECT * FROM MATERIA;