
--TRIGGER TIPO AFTER

CREATE TABLE PRIMERA(ID INTEGER PRIMARY KEY, NOMBRE VARCHAR2(60), EDAD INTEGER);
                     
CREATE TABLE RESPALDO_MENORES(ID INTEGER, NOMBRE VARCHAR2(60), EDAD INTEGER);
                    
CREATE TABLE RESPALDO_MAYORES(ID INTEGER, NOMBRE VARCHAR2(60), EDAD INTEGER);


CREATE OR REPLACE TRIGGER DISP_PRIMERA AFTER INSERT ON PRIMERA FOR EACH ROW
BEGIN
IF :NEW.EDAD<18 THEN
INSERT INTO RESPALDO_MENORES VALUES(:NEW.ID, :NEW.NOMBRE, :NEW.EDAD);
ELSE
INSERT INTO RESPALDO_MAYORES VALUES(:NEW.ID, :NEW.NOMBRE, :NEW.EDAD);
END IF;
END;
/

INSERT INTO PRIMERA VALUES(1,'KAREN', 20);
 SELECT * FROM PRIMERA;
 SELECT * FROM RESPALDO_MAYORES;
 SELECT * FROM RESPALDO_MENORES;
 
 INSERT INTO PRIMERA VALUES(2,'CARLOS',17);
 
 
 
 -----
 
 CREATE TABLE PAGO_HONORARIOS(ID INTEGER PRIMARY KEY, SUBTOTAL FLOAT,IVA FLOAT,ISR FLOAT,
                              RET_IVA FLOAT, TOTAL_PAGAR FLOAT);
                              
--B) CREAR UN BLOQUE PL/SQL QUE TIENE LA TABLA ANTERIOR CON
--C) UN TOTAL DE 30 REGISTROS CON EL SIGUIENTE FORMATO:
--1.EL ID DEBERA DE INCREMENTAR DE 1 EN 1 HASTA 300
--2.EL IVA. RETENCION DEL IVA, ISR Y TOTAL A PAGAR NO DEBERAN INSERTARSE
--3.SOLO DEBERA INSERTARSE EL SUBTOTAL Y ESTE DEBE INCREMENTARSE DE 100 EN 100 EMPEZANDO DESDE 1500
--D) CREAR UN PROCEDIMIENTO ALMACENADO PARA HACER LA ACTUALIZACION CON LOS DATOS DEL SUBTOTAL PARA TODO LOS REGISTROS COMO SIGUE:
--IVA=SUBTOTAL*0.16;
--RET_VA=IVA/3*2;
--ISR=SUBTOTAL*0.10
--TOTAL_PAGAR=SUBTOTAL+RET_IVA-IVA-ISR;
--E) REALIZA EL DIAGRAMA DE UN ARQUITECTURA DE UN SISTEMA DE BASE DE DATOS DISTRIBUIDO, MUESTRA CADA UNA  DE LAS COMPONENTES DEL MISMO 
--EXPLICA CUAL ES LA TAREA DE LA CAPA CONTROLADORA, VISTA Y MODELO.


SELECT * FROM PAGO_HONORARIOS;

CREATE SEQUENCE SEC_PAGO
          START WITH 1
          INCREMENT BY 1
         
          
          
          CREATE OR REPLACE PROCEDURE GUARDAR_PAGO(MY_ID OUT INTEGER, MY_SUBTOTAL IN FLOAT)
          AS
          MY_IVA FLOAT;
          MY_RETIVA FLOAT;
          MY_ISR FLOAT;
          BEGIN
          MY_IVA:=MY_SUBTOTAL*0.16;
          MY_RETIVA:=MY_IVA73*2;
          MY_ISR:=MY_SUBTOTAL*0.10;
          MY_TOTAL:=MY_SUBTOTAL+MY_RETIVA-MY_IVA-MY_ISR;
          SELECT SEC_PAGO.NEXTVAL INTO MY_ID FROM DUAL;
          INSERT INTO PAGO_HONORARIOS VALUES(MY_ID, MY_SUBTOTAL,MY_IVA, MY_ISR, MY_RETIVA,MY_TOTAL);
          END;
          /
          
          
          
          
          



 