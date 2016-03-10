-- ���������� "������� ���������".

create table LIST_MEASURE_UNIT (
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
comment on table LIST_MEASURE_UNIT
  is '������� ���������';

comment on column LIST_MEASURE_UNIT.ID
  is '�������������';
comment on column LIST_MEASURE_UNIT.NAME
  is '��������';
comment on column LIST_MEASURE_UNIT.STRCOD
  is '��������� ���';
comment on column LIST_MEASURE_UNIT.SYMB
  is '�����������';
comment on column LIST_MEASURE_UNIT.GROUP_ID
  is '������';
comment on column LIST_MEASURE_UNIT.EFFECT
  is '��������������';
comment on column LIST_MEASURE_UNIT.RELATE
  is '�������������';
comment on column LIST_MEASURE_UNIT.NOTICE
  is '����������';

-- Indexes
create index LIST_MEASURE_UNIT_PK
          on LIST_MEASURE_UNIT (
  ID asc
);

create index LIST_MEASURE_UNIT_GRP_IDX
          on LIST_MEASURE_UNIT (
  GROUP_ID asc
);

-- Constraints
alter table LIST_MEASURE_UNIT
  add constraint LIST_MEASURE_UNIT_PK primary key (ID);
 
alter table LIST_MEASURE_UNIT
  add constraint LIST_MEASURE_UNIT_GRP_FK foreign key (GROUP_ID)
      references LIST_MEASURE_GROUP (ID);

-- Sequence
create sequence LIST_MEASURE_UNIT_SEQ
  minvalue 10000
  maxvalue 9999999999
  start with 10000
  increment by 1
  nocache;

--commit;
