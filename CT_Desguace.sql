/*
By: Campo Nayarith & Mancipe Ivan
*/


/*==============================================================*/
/* table: empleados                                             */
/*==============================================================*/
CREATE TABLE empleados (
   dni_empleado               NUMBER(9)      NOT NULL,
   numero_seguridad_social    NUMBER(9)      NOT NULL,
   nombre_empleado            VARCHAR2(30)   NOT NULL,
   direccion_empleado         VARCHAR2(30)   NOT NULL,
   telefono_empleado          VARCHAR2(30)   NOT NULL,
   sueldo_empleado            NUMBER(7)      NOT NULL,
   tipo_empleado              CHAR(10)       NOT NULL,
   extra_vehiculo             NUMBER(5)              ,
   CONSTRAINT emp_pk_idem PRIMARY KEY (dni_empleado)
);

/*==============================================================*/
/* table: gruas                                                 */
/*==============================================================*/
CREATE TABLE gruas (
   id_grua                 NUMBER(9)   NOT NULL,
   anio_adquisicion_grua   NUMBER(4)   NOT NULL,
   CONSTRAINT gru_pk_idgr PRIMARY KEY (id_grua)
);

/*==============================================================*/
/* table: plazas                                                */
/*==============================================================*/
CREATE TABLE plazas (
   id_plaza    NUMBER(9)   NOT NULL,
   CONSTRAINT pla_pk_idpl PRIMARY KEY (id_plaza)
);

/*==============================================================*/
/* table: marcas                                                */
/*==============================================================*/
CREATE TABLE marcas (
   id_marca       NUMBER(9)      NOT NULL,
   nombre_marca   VARCHAR2(30)   NOT NULL,
   CONSTRAINT mar_pk_idma PRIMARY KEY (id_marca)
);

/*==============================================================*/
/* table: modelos                                               */
/*==============================================================*/
CREATE TABLE modelos (
   id_modelo      NUMBER(9)      NOT NULL,
   id_marca       NUMBER(9)      NOT NULL,
   nombre_modelo  VARCHAR2(30)   NOT NULL,
   CONSTRAINT mod_pk_idmo PRIMARY KEY (id_modelo)
);


/*==============================================================*/
/* table: vehiculos                                             */
/*==============================================================*/
CREATE TABLE vehiculos (
   matricula_vehiculo         NUMBER(9)   NOT NULL,
   id_modelo                  NUMBER(9)   NOT NULL,
   anio_fabricacion_vehiculo  NUMBER(4)   NOT NULL,
   precio_pagado_vehiculo     NUMBER(9)   NOT NULL,
   fecha_entrada_vehiculo     DATE        NOT NULL,
   tipo_vehiculo              CHAR(10)    NOT NULL,
   dni_mecanico               NUMBER(9)           ,
   fecha_reparacion           DATE                ,
   id_plaza                   NUMBER(9)           ,
   fecha_venta_reparado       DATE                ,
   precio_venta_reparado      NUMBER(8)           ,
   fecha_final_desguace       DATE                ,
   kilos_metal                NUMBER(5)           ,
   CONSTRAINT veh_pk_idve PRIMARY KEY (matricula_vehiculo)
);


/*==============================================================*/
/* table: piezas                                                */
/*==============================================================*/
CREATE TABLE piezas (
   id_pieza             NUMBER(9)      NOT NULL,
   matricula_desguesado NUMBER(9)      NOT NULL,
   nombre_pieza         VARCHAR2(30)   NOT NULL,
   descripcion_pieza    VARCHAR2(30)   NOT NULL,
   precio_pieza         NUMBER(7)      NOT NULL,
   CONSTRAINT pie_pk_idpi PRIMARY KEY (id_pieza)
);

/*==============================================================*/
/* table: grua_conductor_vehiculo                               */
/*==============================================================*/
CREATE TABLE grua_conductor_vehiculo (
   dni_conductor        NUMBER(9)   NOT NULL,
   matricula_vehiculo   NUMBER(9)   NOT NULL,
   id_grua              NUMBER(9)   NOT NULL,
   fecha_asignada       DATE        NOT NULL,
   CONSTRAINT gcv_pk_idgcv PRIMARY KEY (dni_conductor, matricula_vehiculo, id_grua)
);

/*==============================================================*/
/* table: historial_revision                                    */
/*==============================================================*/
CREATE TABLE historial_revision (
   dni_mecanico      NUMBER(9)   NOT NULL,
   id_grua           NUMBER(9)   NOT NULL,
   fecha_revision    CHAR(10)    NOT NULL,
   CONSTRAINT hre_pk_idmg PRIMARY KEY (dni_mecanico, id_grua)
);