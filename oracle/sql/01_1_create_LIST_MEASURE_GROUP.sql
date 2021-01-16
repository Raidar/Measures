-- Справочник "Группа единиц измерения".

create table LIST_MEASURE_GROUP (
  ID                    number(10)          not null,
  NAME                  varchar2(50 char)   not null,
  STRCOD                varchar2(25 char),

  PARENT_ID             number(10),

  NOTICE                varchar2(250 char)--,
);

-- Comments
comment on table LIST_MEASURE_GROUP
  is 'Группа единиц измерения';

comment on column LIST_MEASURE_GROUP.ID
  is 'Идентификатор';
comment on column LIST_MEASURE_GROUP.NAME
  is 'Название';
comment on column LIST_MEASURE_GROUP.STRCOD
  is 'Строковый код';
comment on column LIST_MEASURE_GROUP.PARENT_ID
  is 'Родительская группа';
comment on column LIST_MEASURE_GROUP.NOTICE
  is 'Примечание';

-- Indexes
create index LIST_MEASURE_GROUP_PK
          on LIST_MEASURE_GROUP (
  ID asc
);

-- Constraints
alter table LIST_MEASURE_GROUP
  add constraint LIST_MEASURE_GROUP_PK primary key (ID);

alter table LIST_MEASURE_GROUP
  add constraint LIST_MEASURE_GRPAR_FK foreign key (PARENT_ID)
      references LIST_MEASURE_GROUP (ID);
  
-- Sequence
create sequence LIST_MEASURE_GROUP_SEQ
  minvalue 10000
  maxvalue 9999999999
  start with 10000
  increment by 1
  nocache;

--commit;
