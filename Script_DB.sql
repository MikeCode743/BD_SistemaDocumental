/*==============================================================*/
/* DBMS name:      PostgreSQL 9.x                               */
/* Created on:     25/11/2021 03:43:40 p. m.                    */
/*==============================================================*/


drop index CORE_UNIDADES_PK;

drop table CORE_UNIDADES;

drop index ASUNTO_METADATA_ACUERDO_FK;

drop index METADATA_ACUERDO_ASUNTO_FK;

drop index DETALLE_ASUNTO_PK;

drop table DETALLE_ASUNTO;

drop index GD_ACUERDO_CATALOGO_PK;

drop table GD_ACUERDO_CATALOGO;

drop index GD_ARCHIVO_PK;

drop table GD_ARCHIVO;

drop index ESPECIFICA_FK;

drop index GD_ASUNTO_CATALOGO_PK;

drop table GD_ASUNTO_CATALOGO;

drop index DESCRIBE_FK;

drop index DETALLE_ARCHIVO_FK;

drop index DETALLE_ARCHIVO2_FK;

drop index GD_DETALLE_ARCHIVO_PK;

drop table GD_DETALLE_ARCHIVO;

drop index GD_ESTADO_ITEM_PK;

drop table GD_ESTADO_ITEM;

drop index GD_FORMATO_DOCUMENTO_PK;

drop table GD_FORMATO_DOCUMENTO;

drop index TEMPORADA_GESTION_FK;

drop index GD_METADATA_ACTA_PK;

drop table GD_METADATA_ACTA;

drop index PERTENCE_FK;

drop index TIENE_UN_FK;

drop index ES_FK;

drop index GD_METADATA_ACUERDO_PK;

drop table GD_METADATA_ACUERDO;

drop index TIENE_COLABORADORES_FK;

drop index GD_PERSONA_ASOCIADA_PK;

drop table GD_PERSONA_ASOCIADA;

drop index GD_TEMPORADA_GESTION_PK;

drop table GD_TEMPORADA_GESTION;

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
/* Table: DETALLE_ASUNTO                                        */
/*==============================================================*/
create table DETALLE_ASUNTO (
   ID_GD_ASUNTO_CATALOGO INT4                 not null,
   ID_GD_METADATA_ACUERDO INT4                 not null,
   constraint PK_DETALLE_ASUNTO primary key (ID_GD_ASUNTO_CATALOGO, ID_GD_METADATA_ACUERDO)
);

/*==============================================================*/
/* Index: DETALLE_ASUNTO_PK                                     */
/*==============================================================*/
create unique index DETALLE_ASUNTO_PK on DETALLE_ASUNTO (
ID_GD_ASUNTO_CATALOGO,
ID_GD_METADATA_ACUERDO
);

/*==============================================================*/
/* Index: METADATA_ACUERDO_ASUNTO_FK                            */
/*==============================================================*/
create  index METADATA_ACUERDO_ASUNTO_FK on DETALLE_ASUNTO (
ID_GD_METADATA_ACUERDO
);

/*==============================================================*/
/* Index: ASUNTO_METADATA_ACUERDO_FK                            */
/*==============================================================*/
create  index ASUNTO_METADATA_ACUERDO_FK on DETALLE_ASUNTO (
ID_GD_ASUNTO_CATALOGO
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
   ID_GD_METADATA_ACUERDO INT4                 null,
   ID_GD_METADATA_ACTA  INT4                 null,
   UPDATED_AT           DATE                 null,
   CREATED_AT           DATE                 null,
   constraint PK_GD_DETALLE_ARCHIVO primary key (ID)
);

/*==============================================================*/
/* Index: GD_DETALLE_ARCHIVO_PK                                 */
/*==============================================================*/
create unique index GD_DETALLE_ARCHIVO_PK on GD_DETALLE_ARCHIVO (
ID
);

/*==============================================================*/
/* Index: DETALLE_ARCHIVO2_FK                                   */
/*==============================================================*/
create  index DETALLE_ARCHIVO2_FK on GD_DETALLE_ARCHIVO (
ID_GD_METADATA_ACUERDO
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
/* Table: GD_METADATA_ACTA                                      */
/*==============================================================*/
create table GD_METADATA_ACTA (
   ID                   SERIAL               not null,
   ID_GD_TEMPORADA_GESTION INT4                 null,
   NUMERO_ACTA          VARCHAR(200)         null,
   PERIODO_GESTION      TEXT                 null,
   UPDATED_AT           DATE                 null,
   CREATED_AT           DATE                 null,
   constraint PK_GD_METADATA_ACTA primary key (ID)
);

/*==============================================================*/
/* Index: GD_METADATA_ACTA_PK                                   */
/*==============================================================*/
create unique index GD_METADATA_ACTA_PK on GD_METADATA_ACTA (
ID
);

/*==============================================================*/
/* Index: TEMPORADA_GESTION_FK                                  */
/*==============================================================*/
create  index TEMPORADA_GESTION_FK on GD_METADATA_ACTA (
ID_GD_TEMPORADA_GESTION
);

/*==============================================================*/
/* Table: GD_METADATA_ACUERDO                                   */
/*==============================================================*/
create table GD_METADATA_ACUERDO (
   ID                   SERIAL               not null,
   ID_GD_ESTADO_ITEM    INT4                 null,
   ID_GD_FORMATO_DOCUMENTO INT4                 null,
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
   constraint PK_GD_METADATA_ACUERDO primary key (ID)
);

/*==============================================================*/
/* Index: GD_METADATA_ACUERDO_PK                                */
/*==============================================================*/
create unique index GD_METADATA_ACUERDO_PK on GD_METADATA_ACUERDO (
ID
);

/*==============================================================*/
/* Index: ES_FK                                                 */
/*==============================================================*/
create  index ES_FK on GD_METADATA_ACUERDO (
ID_GD_FORMATO_DOCUMENTO
);

/*==============================================================*/
/* Index: TIENE_UN_FK                                           */
/*==============================================================*/
create  index TIENE_UN_FK on GD_METADATA_ACUERDO (
ID_GD_ESTADO_ITEM
);

/*==============================================================*/
/* Index: PERTENCE_FK                                           */
/*==============================================================*/
create  index PERTENCE_FK on GD_METADATA_ACUERDO (
CODIGO_CORE_UNIDAD
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

alter table DETALLE_ASUNTO
   add constraint FK_DETALLE__ASUNTO_ME_GD_ASUNT foreign key (ID_GD_ASUNTO_CATALOGO)
      references GD_ASUNTO_CATALOGO (ID)
      on delete restrict on update restrict;

alter table DETALLE_ASUNTO
   add constraint FK_DETALLE__METADATA__GD_METAD foreign key (ID_GD_METADATA_ACUERDO)
      references GD_METADATA_ACUERDO (ID)
      on delete restrict on update restrict;

alter table GD_ASUNTO_CATALOGO
   add constraint FK_GD_ASUNT_ESPECIFIC_GD_ACUER foreign key (ID_GD_ACUERDO_CATALOGO)
      references GD_ACUERDO_CATALOGO (ID)
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
   add constraint FK_GD_DETAL_DETALLE_A_GD_METAD foreign key (ID_GD_METADATA_ACUERDO)
      references GD_METADATA_ACUERDO (ID)
      on delete restrict on update restrict;

alter table GD_METADATA_ACTA
   add constraint FK_GD_METAD_TEMPORADA_GD_TEMPO foreign key (ID_GD_TEMPORADA_GESTION)
      references GD_TEMPORADA_GESTION (ID)
      on delete restrict on update restrict;

alter table GD_METADATA_ACUERDO
   add constraint FK_GD_METAD_ES_GD_FORMA foreign key (ID_GD_FORMATO_DOCUMENTO)
      references GD_FORMATO_DOCUMENTO (ID)
      on delete restrict on update restrict;

alter table GD_METADATA_ACUERDO
   add constraint FK_GD_METAD_PERTENCE_CORE_UNI foreign key (CODIGO_CORE_UNIDAD)
      references CORE_UNIDADES (CODIGO)
      on delete restrict on update restrict;

alter table GD_METADATA_ACUERDO
   add constraint FK_GD_METAD_TIENE_UN_GD_ESTAD foreign key (ID_GD_ESTADO_ITEM)
      references GD_ESTADO_ITEM (ID)
      on delete restrict on update restrict;

alter table GD_PERSONA_ASOCIADA
   add constraint FK_GD_PERSO_TIENE_COL_GD_METAD foreign key (ID_GD_METADATA)
      references GD_METADATA_ACUERDO (ID)
      on delete restrict on update restrict;

