--Creamos la siguiente tabla
CREATE TABLE CARTERA_CLIENTES(ID INTEGER PRIMARY KEY,
             NOMBRE VARCHAR2(40),
             EDAD INTEGER,
             SUELDO_BASE FLOAT);
             
             --INSERTAMOS DATOS
             INSERT INTO CARTERA_CLIENTES VALUES(1,'JUAN',24,60000);
             INSERT INTO CARTERA_CLIENTES VALUES(2,'ANA',45,40000);
             INSERT INTO CARTERA_CLIENTES VALUES(3,'PEDRO',32,40000);
             INSERT INTO CARTERA_CLIENTES VALUES(4,'IRMA',45,70000);
             INSERT INTO CARTERA_CLIENTES VALUES(5,'LUIS',55,20000);
             
             
             SELECT * FROM CARTERA_CLIENTES;
          
          --EJERCICIO:
          --Escribir un cursor implicito que obtenga el sueldo_base de el registro que tiene id=3,
          --una vez obtenida que multiplique el sueldo_base por 20 horas laboradas y lo asigne a 
          --una variable local llamada pago_nomina. Imprimir el resultado de esa variable.
          
          
          DECLARE
          SUELDO FLOAT;
          PAGO_NOMINA FLOAT;
          BEGIN
          --DECLARAMOS EL CURSOR IMPLICITO
          SELECT SUELDO_BASE INTO SUELDO FROM CARTERA_CLIENTES WHERE ID=3;
          PAGO_NOMINA:=SUELDO*20;
          DBMS_OUTPUT.PUT_LINE('eL PAGO ES '||PAGO_NOMINA);
          END;
          /
          SET SERVEROUTPUT ON;
          
          
          --CURSOR IMPLCIITO EJERCICIO 2:
          --Genera la siguiente tabla en oracle que tenga su campo primary key auto incrementado
          --de 2 en 2 empezando desde el 1. Es decir llevará la secuencia 1,3,5,7,9...
          
          
          --1. CREAMOS LA TABLA
          CREATE TABLE NOMINAS(ID_NOMINA INTEGER PRIMARY KEY,
                       NOMBRE VARCHAR2(60));
          
          --2. GENERAR UNA SECUENCIA
          CREATE SEQUENCE SEC_NOMINAS
          START WITH 1
          INCREMENT BY 2
          NOMAXVALUE; --NO HAY LIMITE SUPERIOR
          
          --3. CREAR EL PROCEDIMIENTO DE ENLACE DE TABLA Y SECUENCIA
          CREATE OR REPLACE PROCEDURE GUARDAR_NOMINA(MY_ID OUT INTEGER, MY_NOMBRE IN VARCHAR2)
          AS--DECLARE
          BEGIN
          SELECT SEC_NOMINAS.NEXTVAL INTO MY_ID FROM DUAL;
          INSERT INTO NOMINAS VALUES(MY_ID, MY_NOMBRE);
          END;
          /
          
          --FINALMENTE VAMOS A PROBAR EL PROCEDIMIENTO CON UN BLOQUE PL SQL
          DECLARE
          VALOR INTEGER;
          BEGIN
          GUARDAR_NOMINA(VALOR, 'JUAN');
          DBMS_OUTPUT.PUT_LINE('EL PK GENERADO ES '||VALOR);
          END;
          /
          
          SELECT * FROM NOMINAS;
          
          
          