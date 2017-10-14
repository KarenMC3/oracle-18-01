CREATE TABLE USUARIO_X(ID INTEGER PRIMARY KEY,
                       NOMBRE VARCHAR2(40),
                       EDAD INTEGER);
                       
                       INSERT INTO USUARIO_X VALUES(1,'JUAN',40);
                       INSERT INTO USUARIO_X VALUES(2,'ANA',20);
                       INSERT INTO USUARIO_X VALUES(3,'PEDRO',30);
                       INSERT INTO USUARIO_X VALUES(4,'MARIA',27);
                       
                       
                       SELECT * FROM USUARIO_X;
                       
                       SET SERVEROTUPUT ON; --MODO DE COMPILACION
                
                --GENERAR UN CURSOR SOBRE LA TABLA USUARIO_X QUE AL "VER" CADA REGISTRO IMPRIMA EL CAMPO "NOMBRE" DE CADA REGISTRO       
                       
                       DECLARE
                       CURSOR cur_1 IS SELECT * FROM USUARIO_X;
                       BEGIN
                       --AQUI VIENE LA LOGICA DEL CURSOR
                       FOR FILA IN cur_1 LOOP
                       DBMS_OUTPUT.PUT_LINE('EL NOMBRE ACTUAL ES '||FILA.NOMBRE);
                       END LOOP;
                       END;
                       /
                       
                 --GENERAR UN CURSOR QUE TENGA UNA VARIABLE INTERNA Y QUE REALICE LA SIG OPERACION:
                 --SI LA EDAD ES ESTRICTAMENTE MAYOR A 30, ASIGNAR SUELDO_BASE UN FACTOR DE 1.5 Y 
                 --SI ES MENOR, NO ASIGNAR EL FACTOR DONDE SUELDO_BASE=6000 PESOS
                 
                       DECLARE
                       CURSOR cur_2 IS SELECT * FROM USUARIO_X;
                       SUELDO_BASE INTEGER;
                       BEGIN
                       --INICIALIZAMOS EL SUELDO BASE
                       
                       FOR FILA IN cur_2 LOOP
                       SUELDO_BASE:=6000;
                       IF FILA.EDAD >30 THEN
                       SUELDO_BASE:=SUELDO_BASE*1.5;
                       END IF;
                       DBMS_OUTPUT.PUT_LINE('EL SUELDO ES '||SUELDO_BASE ||' EDAD:'||FILA.EDAD);
                       END LOOP;
                       END;
                       /