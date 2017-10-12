create table almacen(numero_almacen integer, ubicacion_almacen varchar2(80),
 
                     constraint pk_na primary key(numero_almacen)
 
                     );

                     
 
 --Vamos a generar un procedimiento almacenado para guardar una entidad o registro de tipo almacen
 
 
 
 create or replace procedure guardar_almacen(mi_id IN integer, mi_ubicacion IN varchar2)
 
                             as
 
                             begin
 
                             --Aqui la logica del procedimiento
 
                           insert into almacen values(mi_id, mi_ubicacion);
 
                           end;
 
                           /
 
        --Vamos a comprobar que funciona nuestro procedimiento
 
         begin
 
         guardar_almacen(1,'Plymouth');
 
         end;
 
         /
 
        select * from almacen; 
        
        --Generamos la tabla del vendedor
        
        create table vendedor (numero_vendedor integer,
                     nombre_vendedor varchar2(69),
                     area_ventas varchar2(60),
                     constraint pk_nv primary key (numero_vendedor)
                     );
                     DESCRIBE almacen;
                     
                     
                     create table cliente(numero_cliente integer,
                                  numero_almacen integer,
                                  nombre_cliente varchar2(60),
                                  constraint pk_nc primary key(numero_cliente),
                                  constraint fk1_na foreign key(numero_almacen) references almacen(numero_almacen)
                                  );
                                  
                        DESCRIBE cliente;
                                  
                      create table ventas(id_ventas integer,
                                   numero_cliente integer,
                                   numero_vendedor integer,
                                   monto_venta float(126),
                                   constraint pk_idv primary key(id_ventas),
                                   constraint fk_nc1 foreign key (numero_cliente) references cliente(numero_cliente),
                                   constraint fk_nv1 foreign key(numero_vendedor) references vendedor(numero_vendedor)
                                   );
                                   
                      create table vendedor(numero_vendedor integer,
                                   nombre_vendedor varchar2(60),
                                   area_ventas varchar2(40),
                                   constraint pk_nv primary key (numero_vendedor),
                                   constraint fk_nv foreign key (numero_vendedor) references ventas(numero_vendedor)
                                   );
                                   
                                   describe vendedor;
                                   describe ventas;
                                   describe cliente;
                                   
                                  

