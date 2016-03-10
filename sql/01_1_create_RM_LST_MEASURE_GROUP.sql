-- Справочник "Группа единиц измерения".

create table RM_LST_MEASURE_GROUP (
  ID                    number(10)          not null,
  NAME                  varchar2(50 char)   not null,
  STRCOD                varchar2(25 char),

  PARENT_ID             number(10),

  NOTICE                varchar2(250 char)--,
);

-- Comments
comment on table RM_LST_MEASURE_GROUP
  is 'Группа единиц измерения';

comment on column RM_LST_MEASURE_GROUP.ID
  is 'Идентификатор';
comment on column RM_LST_MEASURE_GROUP.NAME
  is 'Название';
comment on column RM_LST_MEASURE_GROUP.STRCOD
  is 'Строковый код';
comment on column RM_LST_MEASURE_GROUP.PARENT_ID
  is 'Родительская группа';
comment on column RM_LST_MEASURE_GROUP.NOTICE
  is 'Примечание';

-- Indexes
create index RM_LST_MEASURE_GROUP_PK
          on RM_LST_MEASURE_GROUP (
  ID asc
);

-- Constraints
alter table RM_LST_MEASURE_GROUP
  add constraint RM_LST_MEASURE_GROUP_PK primary key (ID);

alter table RM_LST_MEASURE_GROUP
  add constraint RM_LST_MEASURE_GRPAR_FK foreign key (PARENT_ID)
      references RM_LST_MEASURE_GROUP (ID);
  
-- Sequence
create sequence RM_GEN_LST_MEASURE_GROUP
  minvalue 10000
  maxvalue 9999999999
  start with 10000
  increment by 1
  nocache;

--commit;
