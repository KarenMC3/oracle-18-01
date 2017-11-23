
--ponemos primero el SET SERVEROUTPUT ON

SET SERVEROUTPUT ON;

--Agregamos un bloque pl sql
DECLARE
  DIA CHAR(80);
  FECHA DATE;
BEGIN
--Inicializamos los campos con las funciones siguientes
FECHA:=SYSDATE;
DIA:=TO_CHAR(SYSDATE,'DD-MONTH-YYYY');
DIA:=TO_CHAR(SYSDATE,'DD');
DIA:=TO_CHAR(SYSDATE,'MONTH');
DIA:=TO_CHAR(SYSDATE,'DAY');
DIA:=TO_CHAR(SYSDATE,'MI');
DBMS_OUTPUT.PUT_LINE('lA FECHA ES '||(DIA);
END;
/


--EJERCICIO: Generar un disparador que impida que los usuarios se guarden el dia miercoles


CREATE TABLE USUARIO_TIEMPO(ID INTEGER PRIMARY KEY, NOMBRE VARCHAR2(80), EDAD INTEGER);

CREATE OR REPLACE TRIGGER DISP_TIEMPO BEFORE INSERT ON USUARIO_TIEMPO FOR EACH ROW
BEGIN
IF UPPER(TO_CHAR(SYSDATE,'DAY'))= UPPER('MI�RCOLES') THEN
DBMS_OUTPUT.PUT_LINE('EL DIA ES '||TO_CHAR(SYSDATE,'DAY'));
RAISE_APPLICATION_ERROR(-20000,'NO PUEDES GUARDAR EN MIERCOLES');
END IF;
END;
/
INSERT INTO USUARIO_TIEMPO VALUES(11,'KAREN',30);


--EJERCICIO 2: 
--A)GENERAR TABLA

CREATE TABLE USUARIO_CHECADOR(NOMBRE VARCHAR2(80));

--B)GENERAR UN DISPARADOR QUE IMPIDA EN LOS SEGUNDOS DEL 11 AL 59 DE CADA MINUTO

CREATE OR REPLACE TRIGGER DISP_CHECADOR BEFORE INSERT ON USUARIO_CHECADOR FOR EACH ROW
BEGIN
IF TO_CHAR(SYSDATE,'SS')>'10' THEN
DBMS_OUTPUT.PUT_LINE('LA HORA ES '||TO_CHAR(SYSDATE,'SS'));
RAISE_APPLICATION_ERROR(-20000,'NO PUEDES GUARDAR EN ESTA HORA');
END IF;
END;
/
INSERT INTO USUARIO_CHECADOR VALUES('KAREN');


