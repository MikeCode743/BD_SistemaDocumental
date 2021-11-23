/*==============================================================*/
/* DBMS name:      PostgreSQL 9.x                               */
/* Created on:     18/11/2021 09:36:36 p. m.                    */
/*==============================================================*/


/*==============================================================*/
/* Table: CORE_UNIDADES                                         */
/*==============================================================*/
create table CORE_UNIDADES (
   CODIGO               VARCHAR(10)          not null,
   constraint PK_CORE_UNIDADES primary key (CODIGO)
);

/*==============================================================*/
/* Index: CORE_UNIDADES_PK                                      */
/*==============================================================*/
create unique index CORE_UNIDADES_PK on CORE_UNIDADES (
CODIGO
);

/*==============================================================*/
/* Table: GD_ACUERDO_CATALOGO                                   */
/*==============================================================*/
create table GD_ACUERDO_CATALOGO (
   ID                   SERIAL               not null,
   NOMBRE               VARCHAR(200)         not null,
   DESCRIPCION          VARCHAR(400)         null,
   UPDATED_AT           DATE                 null,
   CREATED_AT           DATE                 null,
   constraint PK_GD_ACUERDO_CATALOGO primary key (ID)
);

/*==============================================================*/
/* Index: GD_ACUERDO_CATALOGO_PK                                */
/*==============================================================*/
create unique index GD_ACUERDO_CATALOGO_PK on GD_ACUERDO_CATALOGO (
ID
);

/*==============================================================*/
/* Table: GD_ARCHIVO                                            */
/*==============================================================*/
create table GD_ARCHIVO (
   ID                   SERIAL               not null,
   NOMBRE               VARCHAR(200)         not null,
   RUTA_ALMACENADO      TEXT                 not null,
   NOMENCLATURA         TEXT                 not null,
   TIPO_MIME            TEXT                 not null,
   ESPACIO_DISCO        INT4                 not null,
   NUM_VERSION          INT4                 null,
   UPDATED_AT           DATE                 null,
   CREATED_AT           DATE                 null,
   constraint PK_GD_ARCHIVO primary key (ID)
);

/*==============================================================*/
/* Index: GD_ARCHIVO_PK                                         */
/*==============================================================*/
create unique index GD_ARCHIVO_PK on GD_ARCHIVO (
ID
);

/*==============================================================*/
/* Table: GD_ASUNTO_CATALOGO                                    */
/*==============================================================*/
create table GD_ASUNTO_CATALOGO (
   ID                   SERIAL               not null,
   ID_GD_ACUERDO_CATALOGO INT4                 null,
   NOMBRE               VARCHAR(200)         not null,
   DESCRIPCION          VARCHAR(400)         null,
   UPDATED_AT           DATE                 null,
   CREATED_AT           DATE                 null,
   constraint PK_GD_ASUNTO_CATALOGO primary key (ID)
);

/*==============================================================*/
/* Index: GD_ASUNTO_CATALOGO_PK                                 */
/*==============================================================*/
create unique index GD_ASUNTO_CATALOGO_PK on GD_ASUNTO_CATALOGO (
ID
);

/*==============================================================*/
/* Index: ESPECIFICA_FK                                         */
/*==============================================================*/
create  index ESPECIFICA_FK on GD_ASUNTO_CATALOGO (
ID_GD_ACUERDO_CATALOGO
);

/*==============================================================*/
/* Table: GD_DETALLE_ARCHIVO                                    */
/*==============================================================*/
create table GD_DETALLE_ARCHIVO (
   ID                   SERIAL               not null,
   ID_GD_ARCHIVO        INT4                 null,
   ID_GD_METADATA       INT4                 null,
   ID_GD_ITEM           INT4                 not null,
   ID_GD_METADATA_ACTA  INT4                 null,
   UPDATED_AT           DATE                 null,
   CREATED_AT           DATE                 null,
   constraint PK_GD_DETALLE_ARCHIVO primary key (ID, ID_GD_ITEM)
);

/*==============================================================*/
/* Index: GD_DETALLE_ARCHIVO_PK                                 */
/*==============================================================*/
create unique index GD_DETALLE_ARCHIVO_PK on GD_DETALLE_ARCHIVO (
ID,
ID_GD_ITEM
);

/*==============================================================*/
/* Index: ALMACENA_FK                                           */
/*==============================================================*/
create  index ALMACENA_FK on GD_DETALLE_ARCHIVO (
ID_GD_ITEM
);

/*==============================================================*/
/* Index: DETALLE_ARCHIVO2_FK                                   */
/*==============================================================*/
create  index DETALLE_ARCHIVO2_FK on GD_DETALLE_ARCHIVO (
ID_GD_METADATA
);

/*==============================================================*/
/* Index: DETALLE_ARCHIVO_FK                                    */
/*==============================================================*/
create  index DETALLE_ARCHIVO_FK on GD_DETALLE_ARCHIVO (
ID_GD_ARCHIVO
);

/*==============================================================*/
/* Index: DESCRIBE_FK                                           */
/*==============================================================*/
create  index DESCRIBE_FK on GD_DETALLE_ARCHIVO (
ID_GD_METADATA_ACTA
);

/*==============================================================*/
/* Table: GD_ESTADO_ITEM                                        */
/*==============================================================*/
create table GD_ESTADO_ITEM (
   ID                   SERIAL               not null,
   NOMBRE               VARCHAR(200)         not null,
   NOMBRE_CORTO         VARCHAR(10)          not null,
   DESCRIPCION          VARCHAR(400)         null,
   IS_VISIBLE           BOOL                 not null,
   UPDATED_AT           DATE                 null,
   CREATED_AT           DATE                 null,
   constraint PK_GD_ESTADO_ITEM primary key (ID)
);

/*==============================================================*/
/* Index: GD_ESTADO_ITEM_PK                                     */
/*==============================================================*/
create unique index GD_ESTADO_ITEM_PK on GD_ESTADO_ITEM (
ID
);

/*==============================================================*/
/* Table: GD_FORMATO_DOCUMENTO                                  */
/*==============================================================*/
create table GD_FORMATO_DOCUMENTO (
   ID                   SERIAL               not null,
   NOMBRE               VARCHAR(200)         not null,
   DESCRIPCION          VARCHAR(400)         null,
   UPDATED_AT           DATE                 null,
   CREATED_AT           DATE                 null,
   constraint PK_GD_FORMATO_DOCUMENTO primary key (ID)
);

/*==============================================================*/
/* Index: GD_FORMATO_DOCUMENTO_PK                               */
/*==============================================================*/
create unique index GD_FORMATO_DOCUMENTO_PK on GD_FORMATO_DOCUMENTO (
ID
);

/*==============================================================*/
/* Table: GD_ITEM                                               */
/*==============================================================*/
create table GD_ITEM (
   ID                   SERIAL               not null,
   ID_GD_TEMPORADA_GESTION INT4                 null,
   ID_GD_TEMPORADA_CATALOGO INT4                 null,
   ID_GD_TIPO_DOCUMENTO INT4                 null,
   INFORMACION          TEXT                 null,
   UPDATED_AT           DATE                 null,
   CREATED_AT           DATE                 null,
   constraint PK_GD_ITEM primary key (ID)
);

/*==============================================================*/
/* Index: GD_ITEM_PK                                            */
/*==============================================================*/
create unique index GD_ITEM_PK on GD_ITEM (
ID
);

/*==============================================================*/
/* Index: GESTIONO_FK                                           */
/*==============================================================*/
create  index GESTIONO_FK on GD_ITEM (
ID_GD_TEMPORADA_GESTION
);

/*==============================================================*/
/* Index: AGRUPA_FK                                             */
/*==============================================================*/
create  index AGRUPA_FK on GD_ITEM (
ID_GD_TEMPORADA_CATALOGO
);

/*==============================================================*/
/* Index: PERTENECE_A_FK                                        */
/*==============================================================*/
create  index PERTENECE_A_FK on GD_ITEM (
ID_GD_TIPO_DOCUMENTO
);

/*==============================================================*/
/* Table: GD_METADATA                                           */
/*==============================================================*/
create table GD_METADATA (
   ID                   SERIAL               not null,
   ID_GD_ESTADO_ITEM    INT4                 null,
   ID_GD_TIPO_DOCUMENTO INT4                 null,
   ID_GD_ASUNTO_CATALOGO INT4                 null,
   CODIGO_CORE_UNIDAD   VARCHAR(10)          null,
   TITULO               VARCHAR(500)         null,
   TITULO_ALTERNATIVO   VARCHAR(500)         null,
   RESUMEN              TEXT                 null,
   AUTOR                TEXT                 null,
   DESCRIPCION          VARCHAR(400)         null,
   FECHA_PUBLICACION    DATE                 null,
   IDIOMA               TEXT                 null,
   ETIQUETAS            TEXT                 null,
   INFORMACION_ADICIONAL TEXT                 null,
   COMENTARIOS          TEXT                 null,
   ANIO_GESTION         INT4                 null,
   NUMERO_ACTA          INT4                 null,
   DERECHOS             TEXT                 null,
   UPDATED_AT           DATE                 null,
   CREATED_AT           DATE                 null,
   constraint PK_GD_METADATA primary key (ID)
);

/*==============================================================*/
/* Index: GD_METADATA_PK                                        */
/*==============================================================*/
create unique index GD_METADATA_PK on GD_METADATA (
ID
);

/*==============================================================*/
/* Index: ES_FK                                                 */
/*==============================================================*/
create  index ES_FK on GD_METADATA (
ID_GD_TIPO_DOCUMENTO
);

/*==============================================================*/
/* Index: CLASIFICA_FK                                          */
/*==============================================================*/
create  index CLASIFICA_FK on GD_METADATA (
ID_GD_ASUNTO_CATALOGO
);

/*==============================================================*/
/* Index: TIENE_UN_FK                                           */
/*==============================================================*/
create  index TIENE_UN_FK on GD_METADATA (
ID_GD_ESTADO_ITEM
);

/*==============================================================*/
/* Index: PERTENCE_FK                                           */
/*==============================================================*/
create  index PERTENCE_FK on GD_METADATA (
CODIGO_CORE_UNIDAD
);

/*==============================================================*/
/* Table: GD_METADATA_ACTA                                      */
/*==============================================================*/
create table GD_METADATA_ACTA (
   ID                   SERIAL               not null,
   NUMERO_ACTA          VARCHAR(200)         null,
   PERIODO_GESTION      TEXT                 null,
   constraint PK_GD_METADATA_ACTA primary key (ID)
);

/*==============================================================*/
/* Index: GD_METADATA_ACTA_PK                                   */
/*==============================================================*/
create unique index GD_METADATA_ACTA_PK on GD_METADATA_ACTA (
ID
);

/*==============================================================*/
/* Table: GD_PERSONA_ASOCIADA                                   */
/*==============================================================*/
create table GD_PERSONA_ASOCIADA (
   ID                   SERIAL               not null,
   ID_GD_METADATA       INT4                 null,
   REMITENTE            TEXT                 null,
   BENEFICIARIO         TEXT                 null,
   CREATED_AT           DATE                 null,
   UPDATED_AT           DATE                 null,
   constraint PK_GD_PERSONA_ASOCIADA primary key (ID)
);

/*==============================================================*/
/* Index: GD_PERSONA_ASOCIADA_PK                                */
/*==============================================================*/
create unique index GD_PERSONA_ASOCIADA_PK on GD_PERSONA_ASOCIADA (
ID
);

/*==============================================================*/
/* Index: TIENE_COLABORADORES_FK                                */
/*==============================================================*/
create  index TIENE_COLABORADORES_FK on GD_PERSONA_ASOCIADA (
ID_GD_METADATA
);

/*==============================================================*/
/* Table: GD_TEMPORADA_GESTION                                  */
/*==============================================================*/
create table GD_TEMPORADA_GESTION (
   ID                   SERIAL               not null,
   ANIO_INICIO          DATE                 not null,
   ANIO_FINALIZACION    DATE                 not null,
   NOMBRE_RECTOR        TEXT                 not null,
   CREATED_AT           DATE                 null,
   UPDATED_AT           DATE                 null,
   constraint PK_GD_TEMPORADA_GESTION primary key (ID)
);

/*==============================================================*/
/* Index: GD_TEMPORADA_GESTION_PK                               */
/*==============================================================*/
create unique index GD_TEMPORADA_GESTION_PK on GD_TEMPORADA_GESTION (
ID
);

/*==============================================================*/
/* Table: GD_TIPO                                               */
/*==============================================================*/
create table GD_TIPO (
   ID                   SERIAL               not null,
   NOMBRE               VARCHAR(200)         not null,
   DESCRIPCION          VARCHAR(400)         null,
   UPDATED_AT           DATE                 null,
   CREATED_AT           DATE                 null,
   constraint PK_GD_TIPO primary key (ID)
);

/*==============================================================*/
/* Index: GD_TIPO_PK                                            */
/*==============================================================*/
create unique index GD_TIPO_PK on GD_TIPO (
ID
);

/*==============================================================*/
/* Table: REAC_ALUMNO                                           */
/*==============================================================*/
create table REAC_ALUMNO (
   CARNET               VARCHAR(10)          not null,
   constraint PK_REAC_ALUMNO primary key (CARNET)
);

/*==============================================================*/
/* Index: ESTUDIANTES_PK                                        */
/*==============================================================*/
create unique index ESTUDIANTES_PK on REAC_ALUMNO (
CARNET
);

/*==============================================================*/
/* Table: RH_PERSONAL                                           */
/*==============================================================*/
create table RH_PERSONAL (
   ID_RRHH              SERIAL               not null,
   NOMBRE               TEXT                 null,
   constraint PK_RH_PERSONAL primary key (ID_RRHH)
);

/*==============================================================*/
/* Index: RH_PERSONAL_PK                                        */
/*==============================================================*/
create unique index RH_PERSONAL_PK on RH_PERSONAL (
ID_RRHH
);

alter table GD_ASUNTO_CATALOGO
   add constraint FK_GD_ASUNT_ESPECIFIC_GD_ACUER foreign key (ID_GD_ACUERDO_CATALOGO)
      references GD_ACUERDO_CATALOGO (ID)
      on delete restrict on update restrict;

alter table GD_DETALLE_ARCHIVO
   add constraint FK_GD_DETAL_ALMACENA_GD_ITEM foreign key (ID_GD_ITEM)
      references GD_ITEM (ID)
      on delete restrict on update restrict;

alter table GD_DETALLE_ARCHIVO
   add constraint FK_GD_DETAL_DESCRIBE_GD_METAD foreign key (ID_GD_METADATA_ACTA)
      references GD_METADATA_ACTA (ID)
      on delete restrict on update restrict;

alter table GD_DETALLE_ARCHIVO
   add constraint FK_GD_DETAL_DETALLE_A_GD_ARCHI foreign key (ID_GD_ARCHIVO)
      references GD_ARCHIVO (ID)
      on delete restrict on update restrict;

alter table GD_DETALLE_ARCHIVO
   add constraint FK_GD_DETAL_DETALLE_A_GD_METAD foreign key (ID_GD_METADATA)
      references GD_METADATA (ID)
      on delete restrict on update restrict;

alter table GD_ITEM
   add constraint FK_GD_ITEM_AGRUPA_GD_ACUER foreign key (ID_GD_TEMPORADA_CATALOGO)
      references GD_ACUERDO_CATALOGO (ID)
      on delete restrict on update restrict;

alter table GD_ITEM
   add constraint FK_GD_ITEM_GESTIONO_GD_TEMPO foreign key (ID_GD_TEMPORADA_GESTION)
      references GD_TEMPORADA_GESTION (ID)
      on delete restrict on update restrict;

alter table GD_ITEM
   add constraint FK_GD_ITEM_PERTENECE_GD_TIPO foreign key (ID_GD_TIPO_DOCUMENTO)
      references GD_TIPO (ID)
      on delete restrict on update restrict;

alter table GD_METADATA
   add constraint FK_GD_METAD_CLASIFICA_GD_ASUNT foreign key (ID_GD_ASUNTO_CATALOGO)
      references GD_ASUNTO_CATALOGO (ID)
      on delete restrict on update restrict;

alter table GD_METADATA
   add constraint FK_GD_METAD_ES_GD_FORMA foreign key (ID_GD_TIPO_DOCUMENTO)
      references GD_FORMATO_DOCUMENTO (ID)
      on delete restrict on update restrict;

alter table GD_METADATA
   add constraint FK_GD_METAD_PERTENCE_CORE_UNI foreign key (CODIGO_CORE_UNIDAD)
      references CORE_UNIDADES (CODIGO)
      on delete restrict on update restrict;

alter table GD_METADATA
   add constraint FK_GD_METAD_TIENE_UN_GD_ESTAD foreign key (ID_GD_ESTADO_ITEM)
      references GD_ESTADO_ITEM (ID)
      on delete restrict on update restrict;

alter table GD_PERSONA_ASOCIADA
   add constraint FK_GD_PERSO_TIENE_COL_GD_METAD foreign key (ID_GD_METADATA)
      references GD_METADATA (ID)
      on delete restrict on update restrict;

