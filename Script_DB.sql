/*==============================================================*/
/* DBMS name:      PostgreSQL 9.x                               */
/* Created on:     14/10/2021 09:26:58 p. m.                    */
/*==============================================================*/


drop index CORE_UNIDADES_PK;

drop table CORE_UNIDADES;

drop index ESTUDIANTES_PK;

drop table ESTUDIANTES;

drop index GD_ACUERDO_CATALOGO_PK;

drop table GD_ACUERDO_CATALOGO;

drop index GD_ARCHIVO_PK;

drop table GD_ARCHIVO;

drop index ESPECIFICA_FK;

drop index GD_ASUNTO_CATALOGO_PK;

drop table GD_ASUNTO_CATALOGO;

drop index DETALLE_ARCHIVO_FK;

drop index DETALLE_ARCHIVO2_FK;

drop index ALMACENA_FK;

drop index GD_DETALLE_ARCHIVO_PK;

drop table GD_DETALLE_ARCHIVO;

drop index GD_ESTADO_ITEM_PK;

drop table GD_ESTADO_ITEM;

drop index AGRUPA_FK;

drop index GESTIONO_FK;

drop index GD_ITEM_PK;

drop table GD_ITEM;

drop index PERTENCE_FK;

drop index TIENE_UN_FK;

drop index CLASIFICA_FK;

drop index ES_FK;

drop index GD_METADATA_PK;

drop table GD_METADATA;

drop index TIENE_COLABORADORES_FK;

drop index ES_ASOCIADO_FK;

drop index ASOCIADO_FK;

drop index GD_PERSONA_ASOCIADA_PK;

drop table GD_PERSONA_ASOCIADA;

drop index GD_TEMPORADA_GESTION_PK;

drop table GD_TEMPORADA_GESTION;

drop index GD_TIPO_DOCUMENTO_PK;

drop table GD_TIPO_DOCUMENTO;

drop index RH_PERSONAL_PK;

drop table RH_PERSONAL;

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
/* Table: ESTUDIANTES                                           */
/*==============================================================*/
create table ESTUDIANTES (
   CARNET               VARCHAR(10)          not null,
   constraint PK_ESTUDIANTES primary key (CARNET)
);

/*==============================================================*/
/* Index: ESTUDIANTES_PK                                        */
/*==============================================================*/
create unique index ESTUDIANTES_PK on ESTUDIANTES (
CARNET
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
   ID_GD_ARCHIVO        INT4                 not null,
   ID_GD_METADATA       INT4                 not null,
   ID_GD_ITEM           INT4                 not null,
   UPDATED_AT           DATE                 null,
   CREATED_AT           DATE                 null,
   constraint PK_GD_DETALLE_ARCHIVO primary key (ID_GD_ARCHIVO, ID_GD_METADATA, ID_GD_ITEM)
);

/*==============================================================*/
/* Index: GD_DETALLE_ARCHIVO_PK                                 */
/*==============================================================*/
create unique index GD_DETALLE_ARCHIVO_PK on GD_DETALLE_ARCHIVO (
ID_GD_ARCHIVO,
ID_GD_METADATA,
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
/* Table: GD_ITEM                                               */
/*==============================================================*/
create table GD_ITEM (
   ID                   SERIAL               not null,
   ID_GD_TEMPORADA_GESTION INT4                 null,
   ID_GD_TEMPORADA_CATALOGO INT4                 null,
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
/* Table: GD_METADATA                                           */
/*==============================================================*/
create table GD_METADATA (
   ID                   SERIAL               not null,
   ID_GD_ESTADO_ITEM    INT4                 null,
   ID_GD_TIPO_DOCUMENTO INT4                 null,
   ID_GD_ASUNTO_CATALOGO INT4                 null,
   CODIGO_CORE_UNIDAD   VARCHAR(10)          null,
   TITULO               VARCHAR(500)         not null,
   TITULO_ALTERNATIVO   VARCHAR(500)         null,
   RESUMEN              TEXT                 null,
   AUTOR                TEXT                 not null,
   DESCRIPCION          VARCHAR(400)         null,
   FECHA_PUBLICACION    DATE                 null,
   IDIOMA               TEXT                 not null,
   ETIQUETAS            TEXT                 null,
   INFORMACION_ADICIONAL TEXT                 null,
   COMENTARIOS          TEXT                 null,
   ANIO_GESTION         INT4                 not null,
   NUMERO_ACTA          INT4                 not null,
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
/* Table: GD_PERSONA_ASOCIADA                                   */
/*==============================================================*/
create table GD_PERSONA_ASOCIADA (
   ID                   SERIAL               not null,
   ID_GD_METADATA       INT4                 null,
   ID_RH_PERSONAL       INT4                 null,
   CARNET_CORE_ESTUDIANTES VARCHAR(10)          null,
   IS_COLABORADOR       BOOL                 not null,
   EXTERNO              TEXT                 null,
   UPDATED_AT           DATE                 null,
   CREATED_AT           DATE                 null,
   constraint PK_GD_PERSONA_ASOCIADA primary key (ID)
);

/*==============================================================*/
/* Index: GD_PERSONA_ASOCIADA_PK                                */
/*==============================================================*/
create unique index GD_PERSONA_ASOCIADA_PK on GD_PERSONA_ASOCIADA (
ID
);

/*==============================================================*/
/* Index: ASOCIADO_FK                                           */
/*==============================================================*/
create  index ASOCIADO_FK on GD_PERSONA_ASOCIADA (
ID_RH_PERSONAL
);

/*==============================================================*/
/* Index: ES_ASOCIADO_FK                                        */
/*==============================================================*/
create  index ES_ASOCIADO_FK on GD_PERSONA_ASOCIADA (
CARNET_CORE_ESTUDIANTES
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
/* Table: GD_TIPO_DOCUMENTO                                     */
/*==============================================================*/
create table GD_TIPO_DOCUMENTO (
   ID                   SERIAL               not null,
   NOMBRE               VARCHAR(200)         not null,
   DESCRIPCION          VARCHAR(400)         null,
   UPDATED_AT           DATE                 null,
   CREATED_AT           DATE                 null,
   constraint PK_GD_TIPO_DOCUMENTO primary key (ID)
);

/*==============================================================*/
/* Index: GD_TIPO_DOCUMENTO_PK                                  */
/*==============================================================*/
create unique index GD_TIPO_DOCUMENTO_PK on GD_TIPO_DOCUMENTO (
ID
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

alter table GD_METADATA
   add constraint FK_GD_METAD_CLASIFICA_GD_ASUNT foreign key (ID_GD_ASUNTO_CATALOGO)
      references GD_ASUNTO_CATALOGO (ID)
      on delete restrict on update restrict;

alter table GD_METADATA
   add constraint FK_GD_METAD_ES_GD_TIPO_ foreign key (ID_GD_TIPO_DOCUMENTO)
      references GD_TIPO_DOCUMENTO (ID)
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
   add constraint FK_GD_PERSO_ASOCIADO_RH_PERSO foreign key (ID_RH_PERSONAL)
      references RH_PERSONAL (ID_RRHH)
      on delete restrict on update restrict;

alter table GD_PERSONA_ASOCIADA
   add constraint FK_GD_PERSO_ES_ASOCIA_ESTUDIAN foreign key (CARNET_CORE_ESTUDIANTES)
      references ESTUDIANTES (CARNET)
      on delete restrict on update restrict;

alter table GD_PERSONA_ASOCIADA
   add constraint FK_GD_PERSO_TIENE_COL_GD_METAD foreign key (ID_GD_METADATA)
      references GD_METADATA (ID)
      on delete restrict on update restrict;

