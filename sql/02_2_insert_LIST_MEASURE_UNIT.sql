-- Справочник "Единица измерения": Добавление записей.

/*
  1. Чертов А.Г. Единицы физических величин.-
     М.: Высшая школа, 1977.- 288 с.: ил.
  2. Общероссийский классификатор единиц измерения (ОКЕИ)
     Russian Classification of Units of Measurement (RCUM)

     ОК 015-94
     Дата введения 1996-01-01
     http://www.pntd.ru/ok/ok_015-94.php
*/

declare
  sGroupCode            varchar2(25);

  cursor cGroupID (xCode varchar2) is
    select g.id
      from list_measure_group g
     where g.strcod = xCode;

  mID                   number;
  mGroupID              number;

begin
  ----------------------------------------
  mID := 0;

  ---------------------------------------- Общая единица

  ---------------------------------------- -- Счёт
  mGroupID := 0;
  sGroupCode := 'CALCUL';
  open cGroupID(sGroupCode);
  fetch cGroupID into mGroupID;
  close cGroupID;

  if (mGroupID > 0) then
    -------- Единица
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'UNIT', 'единица', 'ед',
           null, '= 1', null);
  
    -------- Доли
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'PERCENT', 'процент', '%',
           null, '= 1/100', 'Сотая доля единицы');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'PERMILLE', 'промилле', '%o',
           null, '= 1/1000', 'Тысячная доля единицы');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'PERMYRIAD', 'промириад', '%oo',
           null, '= 1/100 % = 1/(100*100)', 'Сотая доля процента');

  end if;

  commit;

  -- Первые четыре записи зафиксированы навсегда!
  if (mID < 4) then mID := 4; end if;

  ---------------------------------------- Точная единица

  ---------------------------------------- -- Величина
  mGroupID := 0;
  sGroupCode := 'AMOUNT';
  open cGroupID(sGroupCode);
  fetch cGroupID into mGroupID;
  close cGroupID;

  if (mGroupID > 0) then
    -------- Безразмерные
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'RADIAN', 'радиан', 'рад',
           'Плоский угол', null, 'Основная единица');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'STERADIAN', 'стерадиан', 'ср',
           'Телесный угол', null, 'Основная единица');
  
    -------- Размерные
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'ARC_DEGREE', 'градус', 'гр.',
           null, '= 1/360 окружности', null);
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'ARC_MINUTE', 'угловая минута', '''',
           null, '= (1/60) гр.', '(минута дуги)');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'ARC_SECOND', 'угловая секунда',
           '''''',
           null, '= (1/60)'' = (1/3600) гр.', '(секунда дуги)');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'ARC_TURN', 'оборот', 'об',
           null, '= 360 гр.', null);

  end if;

  commit;

  ---------------------------------------- -- Информация
  mGroupID := 0;
  sGroupCode := 'INFORM';
  open cGroupID(sGroupCode);
  fetch cGroupID into mGroupID;
  close cGroupID;

  if (mGroupID > 0) then
    -------- Двоичные
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'BIT', 'бит', 'б',
           'Количество информации', null,
           'один разряд в двоичной системе счисления');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'BYTE', 'байт', 'Б',
           null, 'обычно = 8 бит',
           'Набор одновременно обрабатываемых/передаваемых битов');

  end if;

  commit;

  ---------------------------------------- Естественная единица
  --mGroupID := 0;
  --sGroupCode := 'PHYSICAL';

  ---------------------------------------- Механическая единица
  --mGroupID := 0;
  --sGroupCode := 'MECHANIC';

  ---------------------------------------- -- Длина
  mGroupID := 0;
  sGroupCode := 'LENGTH';
  open cGroupID(sGroupCode);
  fetch cGroupID into mGroupID;
  close cGroupID;

  if (mGroupID > 0) then
    -------- Метр в квадрате
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'METER', 'метр', 'м',
           'Длина / расстояние', null, 'СИ: основная единица');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'DECIMETER', 'дециметр', 'дм',
           null, '= 1/10 м', null);
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'CENTIMETER', 'сантиметр', 'см',
           null, '= 1/100 м', null);
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'MILLIMETER', 'миллиметр', 'мм',
           null, '= 1/1000 м', null);
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'KILOMETER', 'километр', 'км',
           null, '= 1000 м', null);
  
    -------- Метровые
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'M^-1', 'метр в (-1)-й степени', '1/м',
           null, 'Единица кривизны = 1/м', 'СИ');

  end if;

  commit;

  ---------------------------------------- -- Площадь
  mGroupID := 0;
  sGroupCode := 'SQUARE';
  open cGroupID(sGroupCode);
  fetch cGroupID into mGroupID;
  close cGroupID;

  if (mGroupID > 0) then
    -------- Метр в квадрате
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'METER2', 'квадратный метр', 'кв.м',
           'Площадь', '= 1 м2', null);
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'DECIMETER2', 'квадратный дециметр', 'кв.дм',
           null, '= 1/100 кв.м', null);
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'CENTIMETER2', 'квадратный сантиметр', 'кв.см',
           null, '= 1/(10 000) кв.м', null);
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'MILLIMETER2', 'квадратный миллиметр', 'кв.мм',
           null, '= 1/(1 000 000) кв.м', null);
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'KILOMETER2', 'квадратный километр', 'кв.км',
           null, '= 1 000 000 кв.м', null);
  
    -------- Ар
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'ARE', 'ар', 'а', null, '= 100 кв.м', null);
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'HECTARE', 'гектар', 'га',
           null, '= 100 ар = 10 000 кв.м', null);
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'KILOHECTARE', 'тысяча гектаров', '1000 га',
           null, '= 1000 га = 100 000 ар = 10 кв.км', '(килогектар)');

  end if;

  commit;

  ---------------------------------------- -- Объём
  mGroupID := 0;
  sGroupCode := 'VOLUME';
  open cGroupID(sGroupCode);
  fetch cGroupID into mGroupID;
  close cGroupID;

  if (mGroupID > 0) then
    -------- Метр в кубе
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'METER3', 'кубический метр', 'куб.м',
           'Объём', '= 1 м3', '(кубометр)');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'DECIMETER3', 'кубический дециметр', 'куб.дм',
           null, '= 1/1000 куб.м', null);
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'CENTIMETER3', 'кубический сантиметр', 'куб.см',
           null, '= 1/(1 000 000) куб.м', null);
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'MILLIMETER3', 'кубический миллиметр', 'куб.мм',
           null, '= 1/(1 000 000 000) куб.м', null);
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'KILOMETER3', 'кубический километр', 'куб.км',
           null, '= 1 000 000 000 куб.м', null);
  
    -------- Литр
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'LITER', 'литр', 'л',
           'Объём жидкостей', '= 1 куб.дм = 1/1000 куб.м', null);
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'MILLILITER', 'миллилитр', 'мл',
           null, '= 1/1000 л = 1 куб.см', null);
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'DEKALITER', 'декалитр', 'дкл',
           null, '= 10 л', null);

  end if;

  commit;

  ---------------------------------------- -- Масса
  mGroupID := 0;
  sGroupCode := 'MASS';
  open cGroupID(sGroupCode);
  fetch cGroupID into mGroupID;
  close cGroupID;

  if (mGroupID > 0) then
    -------- Грамм
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'GRAM', 'грамм', 'г', null, '= 1/1000 кг', null);
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'MILLIGRAM', 'миллиграмм', 'мг',
           null, '= 1/1000 г', null);
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'KILOGRAM', 'килограмм', 'кг',
           'Масса', '= 1000 г', 'СИ: основная единица');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'CENTNER', 'центнер', 'ц',
           null, '= 100 кг = 1/10 т', '(децитонна)');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'TONNE', 'тонна', 'т',
           null, '= 1000 кг', null);
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'KILOTONNE', 'килотонна', 'кт',
           null, '= 1000 т = 1 000 000 кг', null);
  
    -------- Особые
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'CARAT', 'карат', 'кар',
           null, '= 200 мг = 0,0002 кг', null);
  
    --------
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'KG/M3', 'килограмм на куб. метр', 'кг/м3',
           'Плотность', '= 1 кг/м3', 'СИ');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'M3/KG', 'куб. метр на килограмм', 'м3/кг',
           'Удельный объём', '= 1 м3/кг', 'СИ');

  end if;

  commit;

  ---------------------------------------- -- Время
  mGroupID := 0;
  sGroupCode := 'TEMP';
  open cGroupID(sGroupCode);
  fetch cGroupID into mGroupID;
  close cGroupID;

  if (mGroupID > 0) then
    -------- День
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'SECOND', 'секунда', 'с',
           'Время', null, 'СИ: основная единица');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'MINUTE', 'минута', 'мин', null, '= 60 с', null);
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'HOUR', 'час', 'ч', null, '= 60 мин = 3600 с', null);
  
    -------- Дни
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'NATURAL_DAY', 'сутки', 'сут',
           null, '= 24 ч', '(nychthemeron)');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'DAY', 'день', 'дн', 'Дата', '= 24 ч', null);
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'WEEK', 'неделя', 'нед', null, '= 7 сут', null);
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'DECADE', 'декада', 'дек', null, '= 10 сут', null);
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'MONTH', 'месяц', 'мес',
           null, '= 1/12 г = 28-31 сут', null);
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'QUARTER', 'квартал', 'кварт',
           null, '= 1/4 г = 3 мес', null);
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'HALF_YEAR', 'полугодие', 'полгода',
           null, '= 1/2 г = 6 мес', null);
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'YEAR', 'год', 'г', null, '= 12 мес', null);
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'YEARS_NUM', 'число лет', 'лет',
           'Период и Возраст', '= 1 г', null);
  
    -------- Многолетия
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'DECENNARY', 'десятилетие', 'деслет',
           null, '= 10 лет', null);
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'CENTURY', 'век', 'в',
           null, '= 100 лет', '(столетие)');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'CENTENARY', 'столетие', 'столет',
           null, '= 100 лет', '(век)');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'MILLENARY', 'тысячелетие', 'тыслет',
           null, '= 1000 лет', '(миллениум)');
  
    -------- Доли секунды
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'MILLISECOND', 'миллисекунда', 'мс',
           null, '= 1/1000 с', null);
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'MICROSECOND', 'микросекунда', 'мкс',
           null, '= 1/1000 мс = 1/(1 000 000) с', null);

  end if;

  commit;

  ---------------------------------------- -- Движение
  mGroupID := 0;
  sGroupCode := 'MOTION';
  open cGroupID(sGroupCode);
  fetch cGroupID into mGroupID;
  close cGroupID;

  if (mGroupID > 0) then
    -------- Обычные
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'M/SEC', 'метр в секунду', 'м/с',
           'Скорость', '= 1 м/с', 'СИ');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'M/SEC2', 'метр на секунду в квадрате', 'м/с2',
           'Ускорение', '= 1 м/с2', 'СИ');
  
    -------- Угол
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'RAD/SEC', 'радиан в секунду', 'рад/с',
           'Угловая скорость', '= 1 рад/с', 'СИ');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'RAD/SEC2', 'радиан на секунду в квадрате', 'рад/с2',
           'Угловое ускорение', '= 1 рад/с2', 'СИ');
  
    -------- Импульс и момент
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'KG*M/SEC',
           'килограмм-метр в секунду', 'кг*м/с',
           'Импульс (количества движения)', '= 1 кг*м/с', 'СИ');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'KG*M2',
           'килограмм-метр в квадрате', 'кг*м2',
           '(Динамический) момент инерции', '= 1 кг*м2', 'СИ');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'KG*M2/SEC',
           'килограмм-метр в квадрате в секунду', 'кг*м2/с',
           'Момент импульса', '= 1 кг*м2/с', 'СИ');
  
    -------- Жидкость и Газ
/*
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'SEC^-1',
           'секунда в (-1)-й степени', '1/с',
           'Градиент скорости', '= 1/с', 'СИ');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'KG/M4',
           'килограмм на метр 4-й степени', 'кг/м4',
           'Градиент плотности', '= 1 кг/м4', 'СИ');
*/
/*
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'PASCAL*SEC', 'паскаль-секунда', 'Па*с',
           'Динамическая вязкость', '= 1 Па*с', 'СИ');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'M2/SEC', 'кв. метр в секунду', 'м2/с',
           'Кинетическая вязкость, коэффициент диффузии', '= 1 м2/с', 'СИ');
*/
  end if;

  commit;

  ---------------------------------------- -- Действие
  mGroupID := 0;
  sGroupCode := 'ACTION';
  open cGroupID(sGroupCode);
  fetch cGroupID into mGroupID;
  close cGroupID;

  if (mGroupID > 0) then
    -------- Сила
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'NEWTON', 'ньютон', 'Н',
           'Сила', '= 1 кг*м/с2', 'СИ');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'KG-FORCE', 'килограмм-сила', 'кгс',
           'Сила', '= 1 кг * g м/с2 == 9,80665 Н', 'МКГСС');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'JOULE', 'джоуль', 'Дж',
           'Энергия, работа', '= 1 Н*м', 'СИ');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'WATT', 'ватт', 'Вт',
           'Мощность', '= 1 Дж/с', 'СИ');
  
    -------- Силовые
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'NEWTON*SEC', 'ньютон-секунда', 'Н*с',
           'Импульс силы', '= 1 Н*с', 'СИ');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'NEWTON*M', 'ньютон-метр', 'Н*м',
           'Момент силы', '= 1 Н*м', 'СИ');
  
    -------- Особые
/*
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'NEWTON/M3', 'ньютон на куб. метр', 'Н/м3',
           'Удельный вес', '= 1 Н/м3', 'СИ');
*/
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'PASCAL', 'паскаль', 'Па',
           'Давление, (механическое) напряжение, модули упругости',
           '= 1 Н/м2', 'СИ');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'ATMO_TEX', 'атмосфера (техническая)', 'ат',
           'Давление',
           '= 1 кгс / см2 = 98 066,5 Па', null);
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'ATMO_STD', 'атмосфера (стандартная)', 'атм',
           'Давление',
           '= 101 325 Па ~= 1 бар', null);
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'BAR', 'бар', 'бар',
           'Давление',
           '= 100 000 Па ~= 1 атм', null);
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'MMHG', 'миллиметр ртутного столба', 'мм рт.ст.',
           'Атмосферное давление',
           '= 1/760 атм = 101 325 / 760 Па ~= 133,322 Па', '(торр)');

    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'NEWTON/M', 'ньютон на метр', 'Н/м',
           'Жёсткость, поверхностное натяжение', '= 1 Н/м', 'СИ');
/*
    -------- Гравитационное поле
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'NEWTON/KG', 'ньютон на килограмм', 'Н/кг',
           'Напряжённость гравитационного поля', '= 1 Н/кг', 'СИ');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'J/KG', 'джоуль на килограмм', 'Дж/кг',
           'Потенциал гравитационного поля', '= 1 Дж/кг', 'СИ');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'J/KG*M', 'джоуль на килограмм-метр', 'Дж/(кг*м)',
           'Градиент потенциала гравитационного поля', '= 1 Дж/(кг*м)', 'СИ');
*/
  end if;

  commit;

  ---------------------------------------- -- Волна
  mGroupID := 0;
  sGroupCode := 'WAVING';
  open cGroupID(sGroupCode);
  fetch cGroupID into mGroupID;
  close cGroupID;

  if (mGroupID > 0) then
    -------- Частота
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'ONE/SEC', 'единица в секунду', '1/с',
           'Частота, круговая частота', '= 1/с', 'СИ');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'HERTZ', 'герц', 'Гц',
           'Частота периодического процесса, ' ||
           'коэффициент затухания', '= 1/с', 'СИ');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'NEWTON*SEC/M', 'ньютон-секунда на метр', 'Н*с/м',
           'Коэффициент сопротивления', '= 1 Н*с/м', 'СИ');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'ONE/M', 'единица на метр', '1/м',
           'Волновое число', '= 1/м', 'СИ');

  end if;

  commit;

  ---------------------------------------- Молекулярная единица
  --mGroupID := 0;
  --sGroupCode := 'PROBABLE';

  ---------------------------------------- -- Вещество
  mGroupID := 0;
  sGroupCode := 'MATTER';
  open cGroupID(sGroupCode);
  fetch cGroupID into mGroupID;
  close cGroupID;

  if (mGroupID > 0) then
    -------- Моль
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'MOLE', 'моль', 'моль',
           'Количество вещества', null, 'СИ: основная единица');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'ONE/M3', 'единица на куб. метр', '1/м3',
           'Концентрация молекул', '= 1/м3', 'СИ');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'KG/MOLE', 'килограмм на моль', 'кг/моль',
           'Молярная масса', '= 1 кг/моль', 'СИ');

  end if;

  commit;

  ---------------------------------------- -- Теплота
  mGroupID := 0;
  sGroupCode := 'HEAT';
  open cGroupID(sGroupCode);
  fetch cGroupID into mGroupID;
  close cGroupID;

  if (mGroupID > 0) then
    -------- Тепло
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'H:JOULE', 'джоуль', 'Дж',
           'Теплота', '= 1 Н*м', 'СИ');
/*
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'H:J/KG', 'джоуль на килограмм', 'Дж/кг',
           'Удельное количество теплоты', '= 1 Дж/кг', 'СИ');
*/
    -------- Теплоёмкость
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'H:J/KELVIN', 'джоуль на кельвин', 'Дж/К',
           'Теплоёмкость системы', '= 1 Дж/К', 'СИ');
/*
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'H:J/KG*KELVIN',
           'джоуль на килограмм-кельвин', 'Дж/(кг*К)',
           'Удельная теплоёмкость', '= 1 Дж/(кг*К)', 'СИ');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'H:J/MOLE*KELVIN',
           'джоуль на моль-кельвин', 'Дж/(моль*К)',
           'Молярная теплоёмкость', '= 1 Дж/(моль*К)', 'СИ');
*/
    -------- Тепловой поток
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'H:WATT', 'ватт', 'Вт',
           'Тепловой поток/мощность', '= 1 Дж/с', 'СИ');
/*
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'H:W/M2', 'ватт на кв. метр', 'Вт/м2',
           'Плотность теплового потока', '= 1 Вт/м2', 'СИ');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'H:W/M*KELVIN',
           'ватт на метр-кельвин', 'Вт/(м*К)',
           '(Коэффициент) теплопроводности', '= 1 Вт/(м*К)', 'СИ');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'H:W/M*KELVIN',
           'ватт на кв. метр-кельвин', 'Вт/(м2*К)',
           'Коэффициент теплообмена, теплопередачи', '= 1 Вт/(м2*К)', 'СИ');
*/
    -------- Энтропия
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'Y:JOULE', 'джоуль', 'Дж',
           'Энтальпия', '= 1 Н*м', 'СИ');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'Y:J/KELVIN', 'джоуль на кельвин', 'Дж/К',
           'Энтропия', '= 1 Дж/К', 'СИ');
/*
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'Y:J/KG*KELVIN',
           'джоуль на килограмм-кельвин', 'Дж/(кг*К)',
           'Удельная энтропия', '= 1 Дж/(кг*К)', 'СИ');
*/
  end if;

  commit;

  ---------------------------------------- -- Температура
  mGroupID := 0;
  sGroupCode := 'TEMPER';
  open cGroupID(sGroupCode);
  fetch cGroupID into mGroupID;
  close cGroupID;

  if (mGroupID > 0) then
    -------- Градус
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'KELVIN', 'кельвин', 'К',
           'Термодинамическая температура', null, 'СИ: основная единица');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'CELSIUS', 'градус Цельсия', 'гр.C',
           'Температура Цельсия', null,
           'Формула: tC = T - T0, T0 = 273,15 К');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'FAHRENHEIT', 'градус Фаренгейта', 'гр.F',
           'Температура Фаренгейта', null,
           'Формула: tF = 9/5*tC + 32; tC = 5/9*(tF - 32)');
  
    -------- Температурные
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'KELVIN/M', 'кельвин на метр', 'К/м',
           'Градиент температуры', '= 1 К/м', 'СИ');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'T:M2/SEC', 'кв. метр в секунду', 'м2/с',
           'Температуропроводность', '= 1 м2/с', 'СИ');

  end if;

  commit;

  ---------------------------------------- Электромагнитная единица
  --mGroupID := 0;
  --sGroupCode := 'ELEMAGNO';

  ---------------------------------------- -- Электричество
  mGroupID := 0;
  sGroupCode := 'ELECTRO';
  open cGroupID(sGroupCode);
  fetch cGroupID into mGroupID;
  close cGroupID;

  if (mGroupID > 0) then
    -------- Электрический заряд
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'COULOMB', 'кулон', 'Кл',
           'Электрический заряд (количество электричества)', '= 1 А*с', 'СИ');
/*
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'COULOMB/M', 'кулон на метр', 'Кл/м',
           'Линейная плотность электрического заряда', '= 1 Кл/м', 'СИ');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'COULOMB/M2', 'кулон на кв. метр', 'Кл/м2',
           'Поверхностная плотность электрического заряда', '= 1 Кл/м2', 'СИ');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'COULOMB/M3', 'кулон на куб. метр', 'Кл/м3',
           'Объёмная плотность электрического заряда', '= 1 Кл/м3', 'СИ');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'COULOMB*M', 'кулон-метр', 'Кл*м',
           'Электрический момент диполя', '= 1 Кл*м', 'СИ');
*/
    -------- Электрический ток
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'AMPERE', 'ампер', 'А',
           'Сила (электрического) тока, м.д.с.', null, 'СИ: основная единица');
/*
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'A/M2', 'ампер на кв. метр', 'А/м2',
           'Плотность электрического тока', '= 1 А/м2', 'СИ');
*/
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'VOLT', 'вольт', 'В',
           'Электрическое напряжение/потенциал, э.д.с.',
           '= 1 Вт/А = 1 Дж/Кл', 'СИ');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'OHM', 'ом', 'Ом',
           'Электрическое сопротивление', '= 1 В/А', 'СИ');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'OHM*M', 'ом-метр', 'Ом*м',
           'Удельное электрическое сопротивление', '= 1 Ом*м', 'СИ');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'SIEMENS', 'сименс', 'См',
           'Электрическая проводимость', '= 1/Ом = 1 А/В', 'СИ');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'SIEMENS/M', 'сименс на метр', 'См/м',
           'Удельная электрическая проводимость', '= 1 См/м= 1/(Ом*м)', 'СИ');
  
    -------- Электрическое поле
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'V/M', 'вольт на метр', 'В/м',
           'Напряжённость/градиент электрического поля', '= 1 Н/Кл = 1 В/м', 'СИ');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'V*M', 'вольт-метр', 'В*м',
           'Поток (вектора) напряжённости электрического поля', '= 1 В*м', 'СИ');
  
    -------- Электрические
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'FARAD', 'фарада', 'Ф',
           'Электрическая ёмкость', '= 1 Кл/В', 'СИ');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'FARAD/M', 'фарада на метр', 'Ф/м',
           'Электрическая постоянная', '= 1 Кл/(В*м) = 1 Ф/м', 'СИ');

  end if;

  commit;

  ---------------------------------------- -- Магнетизм
  mGroupID := 0;
  sGroupCode := 'MAGNETO';
  open cGroupID(sGroupCode);
  fetch cGroupID into mGroupID;
  close cGroupID;

  if (mGroupID > 0) then
    -------- Магнитный заряд
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'J/A', 'джоуль на ампер', 'Дж/А',
           'Магнитный заряд (количество магнетизма)', '= 1 Дж/А', 'СИ');
  
    -------- Магнитные параметры тока
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'A*M2', 'ампер-кв. метр', 'А*м2',
           'Магнитный момент (электрического) тока', '= 1 А*м2', 'СИ');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'TESLA', 'тесла', 'Т',
           'Магнитная индукция', '= 1 Н/(А*м)', 'СИ');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'HENRY', 'генри', 'Г',
           'Индуктивность', '= 1 Вб/А', 'СИ');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'A/WEBER', 'ампер на вебер', 'А/Вб',
           'Магнитное сопротивление', '= 1 А/Вб', 'СИ');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'WEBER/A', 'вебер на ампер', 'Вб/А',
           'Магнитная проводимость', '= 1 Вб/А', 'СИ');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'A/M', 'ампер на метр', 'А/м',
           'Намагниченность', '= 1 А/м', 'СИ');
  
    -- Магнитное поле
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'WEBER', 'вебер', 'Вб',
           'Магнитный поток', '= 1 Т*м2 = 1 В*с', 'СИ');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'HENRY/M', 'генри на метр', 'Г/м',
           'Напряжённость магнитного поля, магнитная постоянная', '= 1 Г/м', 'СИ');

  end if;

  commit;

  ---------------------------------------- -- Излучение
  mGroupID := 0;
  sGroupCode := 'RADIATO';
  open cGroupID(sGroupCode);
  fetch cGroupID into mGroupID;
  close cGroupID;

  if (mGroupID > 0) then
  -------- Свет
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'CANDELA', 'кандела', 'кд',
           'Сила света', null, 'СИ: основная единица');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'DIOPTER', 'диоптрия', 'дп',
           'Оптическая сила линзы', '= 1/м', 'СИ');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'W/SR', 'ватт на стерадиан', 'Вт/ср',
           'Энергетическая сила излучения', '= 1 Вт/ср', 'СИ');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'W/SR*M2',
           'ватт на стерадиан-кв. метр', 'Вт/(ср*м2)',
           'Энергетическая яркость/лучистость', '= 1 Вт/(ср*м2)', 'СИ');
  
    -------- Световой поток
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'LUMEN', 'люмен', 'лм',
           'Световой поток', '= 1 кд*ср', 'СИ');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'LUMEN/W', 'люмен на ватт', 'лм/Вт',
           'Спектральная световая эффективность', '= 1 лм/Вт', 'СИ');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'LUX', 'люкс', 'лк',
           'Освещённость/светимость', '= 1 лм/м2', 'СИ');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'CANDELA/M2', 'кандела на кв. метр', 'кд/м2',
           'Яркость', '= 1 кд/м2', 'СИ');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'LUMEN*SEC', 'люмен-секунда', 'лм*с',
           'Световая энергия', '= 1 лм*с', 'СИ');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'LUX*SEC', 'люкс-секунда', 'лк*с',
           'Световая экспозиция', '= 1 лк*с', 'СИ');

  end if;

  commit;

  ---------------------------------------- Ядерная единица
  --mGroupID := 0;
  --sGroupCode := 'NUCLEARO';

  ---------------------------------------- -- Ядро
  mGroupID := 0;
  sGroupCode := 'NUCLEO';
  open cGroupID(sGroupCode);
  fetch cGroupID into mGroupID;
  close cGroupID;

  if (mGroupID > 0) then
    -------- Ядро
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'BECQUEREL', 'беккерель', 'Бк',
           'Активность изотопа', '= 1 распад/с', 'СИ');
/*
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'BECQUEREL/KG', 'беккерель на килограмм', 'Бк/кг',
           'Удельная массовая активность', '= 1 Бк/кг', 'СИ');
*/
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'GRAY', 'грей', 'Гй',
           'Доза излучения', '= 1 Дж/кг', 'СИ');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'HERTZ/TESLA', 'герц на тесла', 'Гц/Т',
           'Гиромагнитное отношение', '= 1 Гц/Т', 'СИ');

  end if;

  commit;

  ---------------------------------------- Природная единица
  --mGroupID := 0;
  --sGroupCode := 'NATURALE';

  ---------------------------------------- Общественная единица
  --mGroupID := 0;
  --sGroupCode := 'SOCIETAL';

  ---------------------------------------- Экономическая единица
  --mGroupID := 0;
  --sGroupCode := 'ECONOMIC';

  ---------------------------------------- -- Количество
  mGroupID := 0;
  sGroupCode := 'NUMBER';
  open cGroupID(sGroupCode);
  fetch cGroupID into mGroupID;
  close cGroupID;

  if (mGroupID > 0) then
    -------- Целое
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'ARTICLE', 'изделие', 'изд',
           null, null, 'Изготовленный предмет');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'PIECE', 'штука', 'шт',
           null, null, 'Отдельный предмет');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'EXEMPLAR', 'экземпляр', 'экз',
           null, null, 'Отдельный представитель совокупности предметов');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'NUMER', 'номер', 'ном',
           null, null, 'Нумерованный представитель совокупности предметов');
  
    -------- Счёт
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'PAIR', 'пара', 'пар', null, '= 2 шт', null);
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'DOZEN', 'дюжина', 'дюжин', null, '= 12 шт', null);
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'GROSS', 'гросс', 'гросс',
           null, '= 12 дюжин = 144 шт', '(дюжина дюжин)');
  
    -------- Составляющая предмета
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'CELL', 'элемент', 'элем',
           'Составляющая предмета', null, 'Неразложимая составляющая предмета');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'PART', 'часть', 'часть',
           'Составляющая предмета', null, 'Произвольная составляющая предмета');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'CHUNK', 'кусок', 'кус',
           'Составляющая предмета', null, 'Выделяемая составляющая предмета');
  
    -------- Количество вещества
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'DOSE', 'доза', 'доз',
           'Количество вещества', null, null);
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'PORTION', 'порция', 'порция',
           'Количество вещества', null, null);
  
    -------- Совокупность предметов
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'SET', 'набор', 'набор',
           'Совокупность предметов', null, 'Некоторая совокупность предметов');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'PACKET', 'пакет', 'пакет',
           'Совокупность предметов', null, 'Неопределённая совокупность предметов');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'SUIT', 'комплект', 'компл',
           'Совокупность предметов', null, 'Совокупность связанных предметов');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'PARTY', 'партия', 'партия',
           'Совокупность предметов', null, 'Единовременно поставляемый товар');
  
    -------- Природа
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'PLACE', 'место', 'мест',
           null, null, 'Часть пространства');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'HUMAN', 'человек', 'чел', null, null, null);
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'FAMILY', 'семья', 'семей', null, null, null);
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'HEAD', 'голова', 'гол', null, null, null);
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'WORKPLACE', 'рабочее место', 'раб.мест',
           null, null, 'Часть пространства для работы');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'SHIFT', 'смена', 'смен', null, null, null);
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'HUMAN*HOUR', 'человеко-час', 'чел*час',
           'Учёт рабочего времени', '= 1 чел * 1 ч', null);
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'HUMAN*DAY', 'человеко-день', 'чел*дней',
           'Учёт рабочего времени', '= 1 чел * 1 раб.дн', null);
  
    -------- Перевозка
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'PAX-SEAT',
           'пассажирское место', 'пасс.мест',
           'Вместимость транспортного средства', '= 1 пассажир/ТС', null);
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'PAX_FLOW',
           'пассажиропоток', 'пасс.поток',
           'Объём перевозок пассажиров', '= 1 пассажир*ед.вр.', null);
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'PAX*KM',
           'пассажиро-километр', 'п*км',
           'Пассажирооборот', '= 1 пассажир*км', null);
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'TONNE*KM',
           'тонно-километр', 'т*км',
           ' Грузооборот', '= 1 т*км', null);
  
    -------- Остальные
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'LEAF', 'лист', 'л.', null, null, null);
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'ROLL', 'рулон', 'рул', null, null, null);
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'BRICK', 'кирпич', 'кирп', null, null, null);
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'LINEAR_M', 'погонный метр', 'пог.м',
           null, 'Длина при известной ширине = 1 м', null);

  end if;

  commit;

  ---------------------------------------- -- Упаковка
  mGroupID := 0;
  sGroupCode := 'BOXING';
  open cGroupID(sGroupCode);
  fetch cGroupID into mGroupID;
  close cGroupID;

  if (mGroupID > 0) then
    -------- Обычная
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'PACKAGE', 'упаковка', 'упак', null, null, null);
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'BOX', 'ящик', 'ящ', null, null, null);
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'PARCEL', 'посылка', 'посыл', null, null, null);
  
    -------- Стеклянная
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'JAR_CAN', 'банка', 'банк', null, null, null);
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'BOTTLE', 'бутылка', 'бут', null, null, null);
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'AMPULE', 'ампула', 'ампул', null, null, null);
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'FLACON', 'флакон', 'флак', null, null, null);

  end if;

  commit;

  ---------------------------------------- -- Деньги
  mGroupID := 0;
  sGroupCode := 'MONETA';
  open cGroupID(sGroupCode);
  fetch cGroupID into mGroupID;
  close cGroupID;

  if (mGroupID > 0) then
    -------- Абстрактные
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'MONETARY_UNIT', 'денежная единица', 'д.е.',
           null, null, 'Абстрактная денежная единица');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'IMPUTED_UNIT', 'условная единица', 'у.е.',
          null, null, 'Условно расчётная/начисляемая денежная единица');
  
    -------- Конкретные
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'RUBLE', 'рубль', 'р.', null, null, null);
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'DOLLAR', 'доллар', '$', null, null, null);
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'EURO', 'евро', 'евр', null, null, null);

  end if;

  commit;

  ---------------------------------------- Техническая единица
  --mGroupID := 0;
  --sGroupCode := 'TEXNICAL';

  ---------------------------------------- -- Коммуникация
  mGroupID := 0;
  sGroupCode := 'COMMLINE';
  open cGroupID(sGroupCode);
  fetch cGroupID into mGroupID;
  close cGroupID;

  if (mGroupID > 0) then
    --------
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'BAUD', 'бод', 'бод',
           'Символьная скорость', null, null);

  end if;

  commit;

  ---------------------------------------- -- Энергетика
  mGroupID := 0;
  sGroupCode := 'ENERGY';
  open cGroupID(sGroupCode);
  fetch cGroupID into mGroupID;
  close cGroupID;

  if (mGroupID > 0) then
    --------
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'V*A', 'вольт-ампер', 'В*А',
           'Полная мощность электрического тока', '= 1 В*А', null);
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'KW*HOUR', 'киловатт-час', 'кВт*ч',
           'Количество электроэнергии',
           '= 1000 Вт*ч = 1000 Вт * 3600 с = 3,6 МДж', null);
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'CALORIE', 'калория (международная)', 'кал',
           'Количество тепловой энергии', '= 4,1868 Дж', null);
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'W*HOUR', 'ватт-час', 'Вт*ч',
           'Ёмкость аккумуляторов',
           '= 1 Вт*ч = 1 Вт * 3600 с = 3600 Дж', 'Запасаемая энергия');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'A*HOUR', 'ампер-час', 'А*ч',
           'Ёмкость аккумуляторов',
           '= 1 А*ч = 1 А * 3600 с = 3600 Кл', 'Запасаемый заряд');

  end if;

  commit;

  ---------------------------------------- -- Гидротехника
/*
  mGroupID := 0;
  sGroupCode := 'WATERY';
  open cGroupID(sGroupCode);
  fetch cGroupID into mGroupID;
  close cGroupID;

  if (mGroupID > 0) then
    --------
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, '', '', '', null, null, null);

  end if;

  commit;
*/

  ---------------------------------------- -- Агрономия
/*
  mGroupID := 0;
  sGroupCode := 'AGRONOMY';
  open cGroupID(sGroupCode);
  fetch cGroupID into mGroupID;
  close cGroupID;

  if (mGroupID > 0) then
    --------
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, '', '', '', null, null, null);

  end if;

  commit;
*/

  ---------------------------------------- -- Промышленность
/*
  mGroupID := 0;
  sGroupCode := 'INDUSTRY';
  open cGroupID(sGroupCode);
  fetch cGroupID into mGroupID;
  close cGroupID;

  if (mGroupID > 0) then
    --------
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, '', '', '', null, null, null);

  end if;

  commit;
*/

  ---------------------------------------- -- Строительство
/*
  mGroupID := 0;
  sGroupCode := 'BUILDING';
  open cGroupID(sGroupCode);
  fetch cGroupID into mGroupID;
  close cGroupID;

  if (mGroupID > 0) then
    --------
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, '', '', '', null, null, null);

  end if;

  commit;
*/

  ---------------------------------------- -- Транспорт
  mGroupID := 0;
  sGroupCode := 'TRANSFER';
  open cGroupID(sGroupCode);
  fetch cGroupID into mGroupID;
  close cGroupID;

  if (mGroupID > 0) then
    --------
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'HORSE_POWER',
           'лошадиная сила (метрическая)', 'л.с.',
           'Мощность двигателя', '= 75 кгс*м/с == 735,49875 Вт', null);

    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'KM/HOUR',
           'километр в час', 'км/ч',
           'Скорость транспорта',
           '= 1000 м / 3600 с = 5/18 м/с ~= 0,27778 м/с', null);

  end if;

  commit;

  ---------------------------------------- Отдельная единица
  --mGroupID := 0;
  --sGroupCode := 'SEPARATE';

  ---------------------------------------- -- Другое
/*
  mGroupID := 0;
  sGroupCode := 'ELSE';
  open cGroupID(sGroupCode);
  fetch cGroupID into mGroupID;
  close cGroupID;

  if (mGroupID > 0) then
    --------
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, '', '', '', null, null, null);

  end if;

  commit;
*/
  ----------------------------------------
end;
