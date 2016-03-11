-- Hierarchical query using CONNECT (for Oracle)
select g.id, --g.name
  level as Hevel,
  lpad(' ', 3 * (level-1)) || g.name as Tab_Name,
  null
  from list_measure_group g
  --where g.parent_id is not null
 --start with g.id in (1, 5, 7, 30+1)
 start with g.parent_id is null
 connect by nocycle prior g.id = g.parent_id
 order siblings by g.id;
 
-- Hierarchical query using WITH (for Oracle >11g only)
with rm_meas_hier (id, name, strcod, ids, path, hevel) as (
     select g.id as id,
            g.name as name,
            g.strcod as strcod,
            '-'|| trim(to_char(g.id,
                    lpad('9', greatest(
                         length(trim(to_char(g.id))), 7),
                         '0')
                  )) as ids,
            g.name as path,
            0 as hevel
       from list_measure_group g
      where g.parent_id is null
     union all
     select g.id as id,
            g.name as name,
            g.strcod as strcod,
            (case when length(h.ids) < 2000 then
                  h.ids ||'-'||
                  trim(to_char(g.id,
                    lpad('9', greatest(
                         length(trim(to_char(g.id))), 5),
                         '0')
                  ))
             else h.ids ||'-.'
             end) as ids,
            h.path ||' \ '|| g.name as path,
            hevel + 1 as hevel
       from rm_meas_hier h
      inner join list_measure_group g
         on g.parent_id = h.id
      where 1 = 1
        and h.hevel < 100 -- level limit
        and instr(h.ids, '-'|| g.id || '-') = 0 -- nocycle
)
select h.id as ID,
       h.hevel + 1 as Hevel,
       --h.name as Name,
       lpad(' ', 3 * hevel) || h.name as Tab_Name,
       --h.ids as IDs,
       --h.path as Path_Name,
       --h.strcod as StrCod,
       null
  from rm_meas_hier h
 --order by Path_Name
 order by IDs
