/*==============================================================*/
/* DBMS name:      PostgreSQL 9.x                               */
/* Created on:     12/10/2021 03:26:49 p. m.                    */
/*==============================================================*/


/*==============================================================*/
/* Table: ACUERDOCATALOGO                                       */
/*==============================================================*/
create table ACUERDOCATALOGO (
   ID                   SERIAL               not null,
   NOMBRE               VARCHAR(200)         not null,
   DESCRIPCION          VARCHAR(400)         null,
   constraint PK_ACUERDOCATALOGO primary key (ID)
);

/*==============================================================*/
/* Index: ACUERDOCATALOGO_PK                                    */
/*==============================================================*/
create unique index ACUERDOCATALOGO_PK on ACUERDOCATALOGO (
ID
);

/*==============================================================*/
/* Table: ARCHIVO                                               */
/*==============================================================*/
create table ARCHIVO (
   ID                   SERIAL               not null,
   NOMBRE               VARCHAR(200)         not null,
   RUTA_ALMACENADO      TEXT                 not null,
   NOMENCLATURA         TEXT                 not null,
   TIPO_MIME            TEXT                 not null,
   ESPACIO_DISCO        INT4                 not null,
   NUM_VERSION          INT4                 null,
   constraint PK_ARCHIVO primary key (ID)
);

/*==============================================================*/
/* Index: ARCHIVO_PK                                            */
/*==============================================================*/
create unique index ARCHIVO_PK on ARCHIVO (
ID
);

/*==============================================================*/
/* Table: ASUNTOCATALOGO                                        */
/*==============================================================*/
create table ASUNTOCATALOGO (
   ID                   SERIAL               not null,
   ID_GD_ACUERDO_CATALOGO INT4                 null,
   NOMBRE               VARCHAR(200)         not null,
   DESCRIPCION          VARCHAR(400)         null,
   constraint PK_ASUNTOCATALOGO primary key (ID)
);

/*==============================================================*/
/* Index: ASUNTOCATALOGO_PK                                     */
/*==============================================================*/
create unique index ASUNTOCATALOGO_PK on ASUNTOCATALOGO (
ID
);

/*==============================================================*/
/* Index: ESPECIFICA_FK                                         */
/*==============================================================*/
create  index ESPECIFICA_FK on ASUNTOCATALOGO (
ID_GD_ACUERDO_CATALOGO
);

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
/* Table: DETALLE_ARCHIVO                                       */
/*==============================================================*/
create table DETALLE_ARCHIVO (
   ID_GD_ARCHIVO        INT4                 not null,
   ID_GD_METADATA       INT4                 not null,
   ID_GD_ITEM           INT4                 not null,
   constraint PK_DETALLE_ARCHIVO primary key (ID_GD_ARCHIVO, ID_GD_METADATA, ID_GD_ITEM)
);

/*==============================================================*/
/* Index: DETALLE_ARCHIVO_PK                                    */
/*==============================================================*/
create unique index DETALLE_ARCHIVO_PK on DETALLE_ARCHIVO (
ID_GD_ARCHIVO,
ID_GD_METADATA,
ID_GD_ITEM
);

/*==============================================================*/
/* Index: ALMACENA_FK                                           */
/*==============================================================*/
create  index ALMACENA_FK on DETALLE_ARCHIVO (
ID_GD_ITEM
);

/*==============================================================*/
/* Index: DETALLE_ARCHIVO2_FK                                   */
/*==============================================================*/
create  index DETALLE_ARCHIVO2_FK on DETALLE_ARCHIVO (
ID_GD_METADATA
);

/*==============================================================*/
/* Index: DETALLE_ARCHIVO_FK                                    */
/*==============================================================*/
create  index DETALLE_ARCHIVO_FK on DETALLE_ARCHIVO (
ID_GD_ARCHIVO
);

/*==============================================================*/
/* Table: ESTADOITEM                                            */
/*==============================================================*/
create table ESTADOITEM (
   ID                   SERIAL               not null,
   NOMBRE               VARCHAR(200)         not null,
   NOMBRE_CORTO         VARCHAR(10)          not null,
   DESCRIPCION          VARCHAR(400)         null,
   IS_VISIBLE           BOOL                 not null,
   constraint PK_ESTADOITEM primary key (ID)
);

/*==============================================================*/
/* Index: ESTADOITEM_PK                                         */
/*==============================================================*/
create unique index ESTADOITEM_PK on ESTADOITEM (
ID
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
/* Table: ITEM                                                  */
/*==============================================================*/
create table ITEM (
   ID                   SERIAL               not null,
   ID_GD_TEMPORADA_GESTION INT4                 null,
   ID_GD_TEMPORADA_CATALOGO INT4                 null,
   INFORMACION          TEXT                 null,
   constraint PK_ITEM primary key (ID)
);

/*==============================================================*/
/* Index: ITEM_PK                                               */
/*==============================================================*/
create unique index ITEM_PK on ITEM (
ID
);

/*==============================================================*/
/* Index: GESTIONO_FK                                           */
/*==============================================================*/
create  index GESTIONO_FK on ITEM (
ID_GD_TEMPORADA_GESTION
);

/*==============================================================*/
/* Index: AGRUPA_FK                                             */
/*==============================================================*/
create  index AGRUPA_FK on ITEM (
ID_GD_TEMPORADA_CATALOGO
);

/*==============================================================*/
/* Table: METADATA                                              */
/*==============================================================*/
create table METADATA (
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
   constraint PK_METADATA primary key (ID)
);

/*==============================================================*/
/* Index: METADATA_PK                                           */
/*==============================================================*/
create unique index METADATA_PK on METADATA (
ID
);

/*==============================================================*/
/* Index: ES_FK                                                 */
/*==============================================================*/
create  index ES_FK on METADATA (
ID_GD_TIPO_DOCUMENTO
);

/*==============================================================*/
/* Index: CLASIFICA_FK                                          */
/*==============================================================*/
create  index CLASIFICA_FK on METADATA (
ID_GD_ASUNTO_CATALOGO
);

/*==============================================================*/
/* Index: TIENE_UN_FK                                           */
/*==============================================================*/
create  index TIENE_UN_FK on METADATA (
ID_GD_ESTADO_ITEM
);

/*==============================================================*/
/* Index: PERTENCE_FK                                           */
/*==============================================================*/
create  index PERTENCE_FK on METADATA (
CODIGO_CORE_UNIDAD
);

/*==============================================================*/
/* Table: PERSONAASOCIADA                                       */
/*==============================================================*/
create table PERSONAASOCIADA (
   ID                   SERIAL               not null,
   ID_GD_METADATA       INT4                 null,
   ID_RH_PERSONAL       INT4                 null,
   CARNET_CORE_ESTUDIANTES VARCHAR(10)          null,
   IS_COLABORADOR       BOOL                 not null,
   EXTERNO              TEXT                 null,
   constraint PK_PERSONAASOCIADA primary key (ID)
);

/*==============================================================*/
/* Index: PERSONAASOCIADA_PK                                    */
/*==============================================================*/
create unique index PERSONAASOCIADA_PK on PERSONAASOCIADA (
ID
);

/*==============================================================*/
/* Index: ASOCIADO_FK                                           */
/*==============================================================*/
create  index ASOCIADO_FK on PERSONAASOCIADA (
ID_RH_PERSONAL
);

/*==============================================================*/
/* Index: ES_ASOCIADO_FK                                        */
/*==============================================================*/
create  index ES_ASOCIADO_FK on PERSONAASOCIADA (
CARNET_CORE_ESTUDIANTES
);

/*==============================================================*/
/* Index: TIENE_COLABORADORES_FK                                */
/*==============================================================*/
create  index TIENE_COLABORADORES_FK on PERSONAASOCIADA (
ID_GD_METADATA
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

/*==============================================================*/
/* Table: TEMPORADAGESTION                                      */
/*==============================================================*/
create table TEMPORADAGESTION (
   ID                   SERIAL               not null,
   ANIO_INICIO          DATE                 not null,
   ANIO_FINALIZACION    DATE                 not null,
   NOMBRE_RECTOR        TEXT                 not null,
   constraint PK_TEMPORADAGESTION primary key (ID)
);

/*==============================================================*/
/* Index: TEMPORADAGESTION_PK                                   */
/*==============================================================*/
create unique index TEMPORADAGESTION_PK on TEMPORADAGESTION (
ID
);

/*==============================================================*/
/* Table: TIPODOCUMENTO                                         */
/*==============================================================*/
create table TIPODOCUMENTO (
   ID                   SERIAL               not null,
   NOMBRE               VARCHAR(200)         not null,
   DESCRIPCION          VARCHAR(400)         null,
   constraint PK_TIPODOCUMENTO primary key (ID)
);

/*==============================================================*/
/* Index: TIPODOCUMENTO_PK                                      */
/*==============================================================*/
create unique index TIPODOCUMENTO_PK on TIPODOCUMENTO (
ID
);

alter table ASUNTOCATALOGO
   add constraint FK_ASUNTOCA_ESPECIFIC_ACUERDOC foreign key (ID_GD_ACUERDO_CATALOGO)
      references ACUERDOCATALOGO (ID)
      on delete restrict on update restrict;

alter table DETALLE_ARCHIVO
   add constraint FK_DETALLE__ALMACENA_ITEM foreign key (ID_GD_ITEM)
      references ITEM (ID)
      on delete restrict on update restrict;

alter table DETALLE_ARCHIVO
   add constraint FK_DETALLE__DETALLE_A_ARCHIVO foreign key (ID_GD_ARCHIVO)
      references ARCHIVO (ID)
      on delete restrict on update restrict;

alter table DETALLE_ARCHIVO
   add constraint FK_DETALLE__DETALLE_A_METADATA foreign key (ID_GD_METADATA)
      references METADATA (ID)
      on delete restrict on update restrict;

alter table ITEM
   add constraint FK_ITEM_AGRUPA_ACUERDOC foreign key (ID_GD_TEMPORADA_CATALOGO)
      references ACUERDOCATALOGO (ID)
      on delete restrict on update restrict;

alter table ITEM
   add constraint FK_ITEM_GESTIONO_TEMPORAD foreign key (ID_GD_TEMPORADA_GESTION)
      references TEMPORADAGESTION (ID)
      on delete restrict on update restrict;

alter table METADATA
   add constraint FK_METADATA_CLASIFICA_ASUNTOCA foreign key (ID_GD_ASUNTO_CATALOGO)
      references ASUNTOCATALOGO (ID)
      on delete restrict on update restrict;

alter table METADATA
   add constraint FK_METADATA_ES_TIPODOCU foreign key (ID_GD_TIPO_DOCUMENTO)
      references TIPODOCUMENTO (ID)
      on delete restrict on update restrict;

alter table METADATA
   add constraint FK_METADATA_PERTENCE_CORE_UNI foreign key (CODIGO_CORE_UNIDAD)
      references CORE_UNIDADES (CODIGO)
      on delete restrict on update restrict;

alter table METADATA
   add constraint FK_METADATA_TIENE_UN_ESTADOIT foreign key (ID_GD_ESTADO_ITEM)
      references ESTADOITEM (ID)
      on delete restrict on update restrict;

alter table PERSONAASOCIADA
   add constraint FK_PERSONAA_ASOCIADO_RH_PERSO foreign key (ID_RH_PERSONAL)
      references RH_PERSONAL (ID_RRHH)
      on delete restrict on update restrict;

alter table PERSONAASOCIADA
   add constraint FK_PERSONAA_ES_ASOCIA_ESTUDIAN foreign key (CARNET_CORE_ESTUDIANTES)
      references ESTUDIANTES (CARNET)
      on delete restrict on update restrict;

alter table PERSONAASOCIADA
   add constraint FK_PERSONAA_TIENE_COL_METADATA foreign key (ID_GD_METADATA)
      references METADATA (ID)
      on delete restrict on update restrict;

