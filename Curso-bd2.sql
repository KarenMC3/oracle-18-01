--Clase de hoy sabado 7 de octubre
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