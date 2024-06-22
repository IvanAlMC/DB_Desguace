/*
By: Campo Nayarith & Mancipe Ivan
*/

ALTER TABLE empleados ADD(
   CONSTRAINT emp_ck_tiem CHECK (tipo_empleado IN ('M'/*mecanico*/,'C'/*conductor*/,'O'/*otro*/)),
   CONSTRAINT emp_uq_nuss UNIQUE (numero_seguridad_social),
   CONSTRAINT emp_ck_extr CHECK (extra_vehiculo > 0),
   CONSTRAINT emp_ck_suel CHECK (sueldo_empleado > 0),
   CONSTRAINT emp_ck_idem CHECK (dni_empleado > 0)
);

ALTER TABLE gruas ADD(
   CONSTRAINT gru_ck_anio CHECK (anio_adquisicion_grua > 1900),
   CONSTRAINT gru_ck_idgr CHECK (id_grua > 0)
);

ALTER TABLE plazas ADD(
   CONSTRAINT pla_cj_idpl CHECK (id_plaza > 0)
);

ALTER TABLE marcas ADD(
   CONSTRAINT mar_ck_idma CHECK (id_marca > 0)
);

ALTER TABLE modelos ADD( 
   CONSTRAINT mod_fk_idma FOREIGN KEY (id_marca) REFERENCES marcas(id_marca),
   CONSTRAINT mod_ck_idmo CHECK (id_modelo > 0)
);

ALTER TABLE vehiculos ADD( 
   CONSTRAINT veh_fk_idme FOREIGN KEY (dni_mecanico) REFERENCES empleados(dni_empleado),
   CONSTRAINT veh_fk_idpl FOREIGN KEY (id_plaza) REFERENCES plazas(id_plaza),
   CONSTRAINT veh_fk_idmo FOREIGN KEY (id_modelo) REFERENCES modelos(id_modelo),
   CONSTRAINT veh_ck_tive CHECK (tipo_vehiculo IN ('R' /*reparado*/,'D' /*desguesado*/)),
   CONSTRAINT veh_ck_anio CHECK (anio_fabricacion_vehiculo > 1885),
   CONSTRAINT veh_ck_ppag CHECK (precio_pagado_vehiculo > 0),
   CONSTRAINT veh_ck_pven CHECK (precio_venta_reparado > precio_pagado_vehiculo),
   CONSTRAINT veh_ck_frfe CHECK (fecha_reparacion > fecha_entrada_vehiculo),
   CONSTRAINT veh_ck_fvfr CHECK (fecha_venta_reparado > fecha_reparacion),
   CONSTRAINT veh_ck_fdfe CHECK (fecha_final_desguace > fecha_entrada_vehiculo),
   CONSTRAINT veh_ck_kime CHECK (kilos_metal >= 0),
   CONSTRAINT veh_ck_idve CHECK (matricula_vehiculo > 0)
);

ALTER TABLE piezas ADD(
   CONSTRAINT pie_fk_idde FOREIGN KEY (matricula_desguesado) REFERENCES vehiculos(matricula_vehiculo),
   CONSTRAINT pie_ck_prec CHECK (precio_pieza > 0),
   CONSTRAINT pie_ck_idpi CHECK (id_pieza > 0)
);

ALTER TABLE grua_conductor_vehiculo ADD(
   CONSTRAINT gcv_fk_idco FOREIGN KEY (dni_conductor) REFERENCES empleados(dni_empleado),
   CONSTRAINT gcv_fk_idgr FOREIGN KEY (id_grua) REFERENCES gruas(id_grua),
   CONSTRAINT gcv_fk_idve FOREIGN KEY (matricula_vehiculo)REFERENCES vehiculos(matricula_vehiculo)
);

ALTER TABLE historial_revision ADD(
   CONSTRAINT hre_fk_idgr FOREIGN KEY (id_grua) REFERENCES gruas(id_grua),
   CONSTRAINT hre_fk_idme FOREIGN KEY (dni_mecanico) REFERENCES empleados(dni_empleado)
);