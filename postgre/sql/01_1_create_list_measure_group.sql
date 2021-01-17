-- Справочник "Группа единиц измерения".

set search_path to measures;

create table if not exists list_measure_group (
  id                    serial          not null,
  name                  varchar(50)     not null,
  strcod                varchar(25),

  parent_id             integer,

  notice                varchar(250)--,
);

-- Comments
comment on table list_measure_group
  is 'Группа единиц измерения';

comment on column list_measure_group.id
  is 'Идентификатор';
comment on column list_measure_group.name
  is 'Название';
comment on column list_measure_group.strcod
  is 'Строковый код';
comment on column list_measure_group.parent_id
  is 'Родительская группа';
comment on column list_measure_group.notice
  is 'Примечание';

-- Indexes
create index list_measure_group_ix
          on list_measure_group (
  id asc
);

-- Constraints
alter table list_measure_group
  add constraint list_measure_group_pk primary key (id);

alter table list_measure_group
  add constraint list_measure_group_pid_fk foreign key (parent_id)
      references list_measure_group (id);

--commit;
