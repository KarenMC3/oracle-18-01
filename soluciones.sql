CREATE TABLE ALMACEN (NUMERO_ALMACEN INTEGER, UBICACION_ALMACEN VARCHAR2(40),

                     CONSTRAINT PK_NA PRIMARY KEY(NUMERO_ALMACEN)

                     );

                     

CREATE TABLE VENDEDOR(NUMERO_VENDEDOR INTEGER, NOMBRE_VENDEDOR VARCHAR2(60),

                      AREA_VENTAS VARCHAR2(40),

                      CONSTRAINT PK_NV PRIMARY KEY(NUMERO_VENDEDOR)

                      );

                        

         

      CREATE TABLE CLIENTE(NUMERO_CLIENTE INTEGER, NUMERO_ALMACEN INTEGER,

      NOMBRE_CLIENTE VARCHAR2(50),

      CONSTRAINT PK_NC PRIMARY KEY(NUMERO_CLIENTE),

      CONSTRAINT FK_NA1 FOREIGN KEY(NUMERO_ALMACEN) REFERENCES ALMACEN(NUMERO_ALMACEN)

      );

      

      CREATE TABLE VENTAS(ID_VENTAS INTEGER, NUMERO_CLIENTE INTEGER, 

      NUMERO_VENDEDOR INTEGER, MONTO_VENTA FLOAT,

      CONSTRAINT PK_IDV PRIMARY KEY(ID_VENTAS),

      CONSTRAINT FK_NC1 FOREIGN KEY(NUMERO_CLIENTE) REFERENCES CLIENTE(NUMERO_CLIENTE),

      CONSTRAINT FK_NV1 FOREIGN KEY(NUMERO_VENDEDOR) REFERENCES VENDEDOR(NUMERO_VENDEDOR)

      );

      

      CREATE SEQUENCE SEC_VENTAS

      START WITH 1

      INCREMENT BY 1

      NOMAXVALUE;

      

      

      --PROCEDIMIENTO ALMACEN 

      CREATE OR REPLACE PROCEDURE GUARDAR_ALMACEN(MY_NUMERO_ALMACEN IN INTEGER, MY_UBICACION_ALMACEN IN VARCHAR2)

      AS

      BEGIN

      INSERT INTO ALMACEN VALUES(MY_NUMERO_ALMACEN, MY_UBICACION_ALMACEN);

      END;

      /

      

      --PROCEDIMIENTO VENDEDOR

      CREATE OR REPLACE PROCEDURE GUARDAR_VENDEDOR(MY_NUMERO_VENDEDOR IN INTEGER, MY_NOMBRE_VENDEDOR IN VARCHAR2,MY_AREA_VENTAS IN VARCHAR2)

      AS

      BEGIN

      INSERT INTO VENDEDOR VALUES(MY_NUMERO_VENDEDOR, MY_NOMBRE_VENDEDOR, MY_AREA_VENTAS);

      END;

      /

      

      --PROCEDIMIENTO CLIENTE

      CREATE OR REPLACE PROCEDURE GUARDAR_CLIENTE(MY_NUMERO_CLIENTE IN INTEGER,MY_NUMERO_ALMACEN IN INTEGER, MY_NOMBRE_CLIENTE IN VARCHAR2)

      AS

      BEGIN

      INSERT INTO CLIENTE VALUES(MY_NUMERO_CLIENTE, MY_NUMERO_ALMACEN, MY_NOMBRE_CLIENTE);

      END;

      /

      

      --PROCEDIMIENTO VENTAS

      

      CREATE OR REPLACE PROCEDURE GUARDAR_VENTAS(MY_ID OUT INTEGER, MY_NUMERO_CLIENTE IN INTEGER , MY_NUMERO_VENDEDOR IN INTEGER, MY_MONTO_VENTA IN FLOAT)

      AS BEGIN

      SELECT SEC_VENTAS.NEXTVAL INTO MY_ID FROM DUAL;

      INSERT INTO VENTAS VALUES(MY_ID, MY_NUMERO_CLIENTE, MY_NUMERO_VENDEDOR, MY_MONTO_VENTA);

      END;

      /

      

      --GUARDARMOS PRIMERO LA M�S INDEPENDIENTE ALMACEN

      

      

      BEGIN

      GUARDAR_ALMACEN(1,'PLYMOUTH');

      GUARDAR_ALMACEN(2,'SUPERIOR');

      GUARDAR_ALMACEN(3,'BISMARCK');

      GUARDAR_ALMACEN(4,'FARGO');

      END;

      /

      SELECT * FROM ALMACEN;

      

      --LA SIGUIENTE INDEPENDIENTE  A GUARDAR ES CLIENTE

      

      BEGIN

      GUARDAR_CLIENTE(18765,4,'DELTA SYSTEMS');

    GUARDAR_CLIENTE(18830,3,'A. LEVY AND SONS');

    GUARDAR_CLIENTE(19242,3,'RANIER COMPANY');

    GUARDAR_CLIENTE(18841,2,'R.W. FLOOD INC.');

    GUARDAR_CLIENTE(18899,2,'SEWARD SYSTEMS');

    GUARDAR_CLIENTE(19565,1,'STODOLA''S INC.');

    END;

    /

    

    SELECT * FROM CLIENTE;

      

    --SIGUIENTE INDEPENDIENTE VENDEDOR  

    

    BEGIN

    GUARDAR_VENDEDOR(3462,'WATERS','WEST');

    GUARDAR_VENDEDOR(3593,'DRYNE','EAST');

    END;

    /

    

    SELECT * FROM VENDEDOR;

    

    --ULTIMA DEPENDIENTE VENTAS

    DECLARE

    VALOR INTEGER;

    BEGIN

    GUARDAR_VENTAS(VALOR, 18765,3462,13540);

    GUARDAR_VENTAS(VALOR, 18830,3462,10600);

    GUARDAR_VENTAS(VALOR, 19242,3462,9700);

    GUARDAR_VENTAS(VALOR, 18841,3593,11560);

    GUARDAR_VENTAS(VALOR, 18899,3593,2590);

    GUARDAR_VENTAS(VALOR, 19565,3593,8800);

    END;

    /

    SELECT * FROM VENTAS;
    
    
    --Solucion al ejercicio 1 de blackboard
    
    DECLARE
      CURSOR CUR_CLIENTE IS SELECT * FROM CLIENTE;
      CURSOR CUR_ALMACEN IS SELECT * FROM ALMACEN;
    BEGIN
      FOR REC_CLIENTE IN CUR_CLIENTE LOOP
        FOR REC_ALMACEN IN CUR_ALMACEN LOOP
     
          IF REC_ALMACEN.NUMERO_ALMACEN=REC_CLIENTE.NUMERO_ALMACEN THEN
          DBMS_OUTPUT.PUT_LINE('UBICACION '||REC_ALMACEN.UBICACION_ALMACEN||' NOMBRE CLIENTE '||REC_CLIENTE.NOMBRE_CLIENTE);
        
          END IF;
          
        END LOOP; -- CIERRE DEL CURSOR ALMACEN
      END LOOP; -- CIERRE DEL CURSOR CLIENTE
    END;
    /
    SET SERVEROUTPUT ON;
    
    --2
    
    DECLARE
      CURSOR CUR_CLIENTE IS SELECT * FROM CLIENTE;
      CURSOR CUR_VENTAS IS SELECT * FROM VENTAS;
    BEGIN
      FOR REC_CLIENTE IN CUR_CLIENTE LOOP
       FOR REC_VENTAS IN CUR_VENTAS LOOP
      
        IF REC_CLIENTE.NUMERO_CLIENTE=REC_VENTAS.NUMERO_CLIENTE THEN
        DBMS_OUTPUT.PUT_LINE('NOMBRE CLIENTE '||REC_CLIENTE.NOMBRE_CLIENTE||' MONTO '||REC_VENTAS.MONTO_VENTA);
        
        END IF;
      
       END LOOP;
      END LOOP;
    END;
    /
    SET SERVEROUTPUT ON;
    
    
    --3
    DECLARE
      CURSOR CUR_VENDEDOR IS SELECT * FROM VENDEDOR;
      CURSOR CUR_VENTAS IS SELECT * FROM VENTAS;
    BEGIN
      FOR REC_VENDEDOR IN CUR_VENDEDOR LOOP
        FOR REC_VENTAS IN CUR_VENTAS LOOP
        
          IF REC_VENDEDOR.NUMERO_VENDEDOR=REC_VENTAS.NUMERO_VENDEDOR THEN
          DBMS_OUTPUT.PUT_LINE('NOMBRE VENDEDOR: '||REC_VENDEDOR.NOMBRE_VENDEDOR||'   MONTO: '||REC_VENTAS.MONTO_VENTA);
          
          END IF;
        END LOOP;
      END LOOP;
    END;
    /
    SET SERVEROUTPUT ON;
    
    
    --4
    DECLARE
      CURSOR CUR_VENTAS IS SELECT * FROM VENTAS;
      CURSOR CUR_CLIENTE IS SELECT * FROM CLIENTE;
      CURSOR CUR_ALMACEN IS SELECT * FROM ALMACEN;
      CURSOR CUR_VENDEDOR IS SELECT * FROM VENDEDOR;
      
    BEGIN
      FOR REC_VENTAS IN CUR_VENTAS LOOP
       FOR REC_CLIENTE IN CUR_CLIENTE LOOP
         FOR REC_ALMACEN IN CUR_ALMACEN LOOP
           FOR REC_VENDEDOR IN CUR_VENDEDOR LOOP
           
            IF 
        