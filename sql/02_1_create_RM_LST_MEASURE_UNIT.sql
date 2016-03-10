-- Справочник "Единица измерения".

create table RM_LST_MEASURE_UNIT (
  ID                    number(10)          not null,
  NAME                  varchar2(100 char)  not null,
  STRCOD                varchar2(25 char),

  GROUP_ID              number(10),

  SYMB                  varchar2(25 char)   not null,
  EFFECT                varchar2(200 char),
  RELATE                varchar2(200 char),
  NOTICE                varchar2(200 char)--,
);

-- Comments
comment on table RM_LST_MEASURE_UNIT
  is 'Единица измерения';

comment on column RM_LST_MEASURE_UNIT.ID
  is 'Идентификатор';
comment on column RM_LST_MEASURE_UNIT.NAME
  is 'Название';
comment on column RM_LST_MEASURE_UNIT.STRCOD
  is 'Строковый код';
comment on column RM_LST_MEASURE_UNIT.SYMB
  is 'Обозначение';
comment on column RM_LST_MEASURE_UNIT.GROUP_ID
  is 'Группа';
comment on column RM_LST_MEASURE_UNIT.EFFECT
  is 'Характеристика';
comment on column RM_LST_MEASURE_UNIT.RELATE
  is 'Соотносимость';
comment on column RM_LST_MEASURE_UNIT.NOTICE
  is 'Примечание';

-- Indexes
create index RM_LST_MEASURE_UNIT_PK
          on RM_LST_MEASURE_UNIT (
  ID asc
);

create index RM_LST_MEASURE_UNIT_GRP_IDX
          on RM_LST_MEASURE_UNIT (
  GROUP_ID asc
);

-- Constraints
alter table RM_LST_MEASURE_UNIT
  add constraint RM_LST_MEASURE_UNIT_PK primary key (ID);
 
alter table RM_LST_MEASURE_UNIT
  add constraint RM_LST_MEASURE_UNIT_GRP_FK foreign key (GROUP_ID)
      references RM_LST_MEASURE_GROUP (ID);

-- Sequence
create sequence RM_GEN_LST_MEASURE_UNIT
  minvalue 10000
  maxvalue 9999999999
  start with 10000
  increment by 1
  nocache;

--commit;
