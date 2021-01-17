-- Справочник "Единица измерения".

set search_path to measures;

create table if not exists list_measure_unit (
  id                    bigserial       not null,
  name                  varchar(100)    not null,
  strcod                varchar(25),

  group_id              integer,

  symb                  varchar(25)     not null,
  effect                varchar(200),
  relate                varchar(200),
  notice                varchar(200)--,
);

-- Comments
comment on table list_measure_unit
  is 'Единица измерения';

comment on column list_measure_unit.id
  is 'Идентификатор';
comment on column list_measure_unit.name
  is 'Название';
comment on column list_measure_unit.strcod
  is 'Строковый код';
comment on column list_measure_unit.symb
  is 'Обозначение';
comment on column list_measure_unit.group_id
  is 'Группа';
comment on column list_measure_unit.effect
  is 'Характеристика';
comment on column list_measure_unit.relate
  is 'Соотносимость';
comment on column list_measure_unit.notice
  is 'Примечание';

-- Indexes
create index list_measure_unit_ix
          on list_measure_unit (
  id asc
);

create index list_measure_unit_grp_ix
          on list_measure_unit (
  group_id asc
);

-- Constraints
alter table list_measure_unit
  add constraint list_measure_unit_grp_fk foreign key (group_id)
      references list_measure_group (id);

--commit;
