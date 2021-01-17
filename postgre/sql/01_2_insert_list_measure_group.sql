do
$$

-- Справочник "Группа единиц измерения": Добавление записей.

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
  mDeriv                constant integer := 10;
  mFactor               constant integer := 100;
  
  mCommunalID           constant integer := 1;
  mExactingID           constant integer := 2;
  mPhysicalID           constant integer := 3;
  mNaturaleID           constant integer := 4;
  mSocietalID           constant integer := 5;
  mTexnicalID           constant integer := 7;
  mSeparateID           constant integer := 9;

  mMechanicID           constant integer := mPhysicalID*mDeriv + 1;
  mMoleculeID           constant integer := mPhysicalID*mDeriv + 2;
  mEleMagnoID           constant integer := mPhysicalID*mDeriv + 3;
  mNuclearoID           constant integer := mPhysicalID*mDeriv + 4;
  mEconomicID           constant integer := mSocietalID*mDeriv + 1;

  mID                   integer;
  mParentID             integer;

begin
  ----------------------------------------
  set search_path to measures;

  ---------------------------------------- Основные группы
  mID := mCommunalID;
  insert into list_measure_group
        (id, parent_id, strcod, name, notice)
  values(mID, null, 'COMMUNAL',
         'Общая единица', 'Единицы общего характера');

  mID := mExactingID;
  insert into list_measure_group
        (id, parent_id, strcod, name, notice)
  values(mID, null, 'EXACTING',
         'Точная единица', 'Точные науки: математика и информатика');

  mID := mPhysicalID;
  insert into list_measure_group
        (id, parent_id, strcod, name, notice)
  values(mID, null, 'PHYSICAL',
         'Естественная единица',
         'Естественные науки: физика, химия, ...');

  mID := mNaturaleID;
  insert into list_measure_group
        (id, parent_id, strcod, name, notice)
  values(mID, null, 'NATURAL',
         'Природная единица',
         'Природные науки: биология, география, медицина, ...');

  mID := mSocietalID;
  insert into list_measure_group
        (id, parent_id, strcod, name, notice)
  values(mID, null, 'SOCIETAL',
         'Общественная единица',
         'Общественные науки: экономика, ...');

  mID := mTexnicalID;
  insert into list_measure_group
        (id, parent_id, strcod, name, notice)
  values(mID, null, 'TECHNICAL',
         'Техническая единица',
         'Технические и промышленные дисциплины');

  mID := mSeparateID;
  insert into list_measure_group
        (id, parent_id, strcod, name, notice)
  values(mID, null, 'SEPARATED',
         'Отдельная единица',
         'Неклассифицированные и неопределённые единицы');

  commit;

  ---------------------------------------- Производные группы
  mParentID := mPhysicalID; -- Естественная единица

  mID := mMechanicID;
  insert into list_measure_group
        (id, parent_id, strcod, name, notice)
  values(mID, mParentID, 'MECHANIC',
         'Механическая единица',
         'Единицы в механических дисциплинах');

  mID := mMoleculeID;
  insert into list_measure_group
        (id, parent_id, strcod, name, notice)
  values(mID, mParentID, 'MOLECULE',
         'Молекулярная единица',
         'Единицы в молекулярной физике и химии, ' ||
         'термодинамике и статистической физике');

  mID := mEleMagnoID;
  insert into list_measure_group
        (id, parent_id, strcod, name, notice)
  values(mID, mParentID, 'ELEMAGNO',
         'Электромагнитная единица',
         'Единицы в электромагнетизме и атомной физике');

  mID := mNuclearoID;
  insert into list_measure_group
        (id, parent_id, strcod, name, notice)
  values(mID, mParentID, 'NUCLEARO',
         'Ядерная единица',
         'Единицы в ядерной и квантовой физике');

  commit;

  ----------------------------------------
  mParentID := mSocietalID; -- Общественная единица

  mID := mEconomicID;
  insert into list_measure_group
        (id, parent_id, strcod, name, notice)
  values(mID, mParentID, 'ECONOMIC',
         'Экономическая единица',
         'Экономические дисциплины');

  ---------------------------------------- Конкретные группы

  ---------------------------------------- Общая единица
  mParentID := mCommunalID;
  mID := mParentID * mFactor;

  mID := mID + 1;
  insert into list_measure_group
        (id, parent_id, strcod, name, notice)
  values(mID, mParentID, 'CALCUL', 'Счёт', 'Счётные единицы');

  commit;

  ---------------------------------------- Точная единица
  mParentID := mExactingID;
  mID := mParentID * mFactor;

  mID := mID + 1;
  insert into list_measure_group
        (id, parent_id, strcod, name, notice)
  values(mID, mParentID, 'AMOUNT', 'Величина', null);

  mID := mID + 1;
  insert into list_measure_group
        (id, parent_id, strcod, name, notice)
  values(mID, mParentID, 'INFORM', 'Информация', null);

  commit;

  ---------------------------------------- Естественная единица
  --mParentID := mPhysicalID;
  --mID := mParentID * mFactor;

  ---------------------------------------- Механическая единица
  mParentID := mMechanicID;
  mID := mParentID * mFactor;

  mID := mID + 1;
  insert into list_measure_group
        (id, parent_id, strcod, name, notice)
  values(mID, mParentID, 'LENGTH', 'Длина', null);

  mID := mID + 1;
  insert into list_measure_group
        (id, parent_id, strcod, name, notice)
  values(mID, mParentID, 'SQUARE', 'Площадь', null);

  mID := mID + 1;
  insert into list_measure_group
        (id, parent_id, strcod, name, notice)
  values(mID, mParentID, 'VOLUME', 'Объём', null);

  mID := mID + 1;
  insert into list_measure_group
        (id, parent_id, strcod, name, notice)
  values(mID, mParentID, 'MASS', 'Масса', null);

  mID := mID + 1;
  insert into list_measure_group
        (id, parent_id, strcod, name, notice)
  values(mID, mParentID, 'TEMP', 'Время', null);

  mID := mID + 1;
  insert into list_measure_group
        (id, parent_id, strcod, name, notice)
  values(mID, mParentID, 'MOTION', 'Движение', null);

  mID := mID + 1;
  insert into list_measure_group
        (id, parent_id, strcod, name, notice)
  values(mID, mParentID, 'ACTION', 'Действие', null);

  mID := mID + 1;
  insert into list_measure_group
        (id, parent_id, strcod, name, notice)
  values(mID, mParentID, 'WAVING', 'Волна', null);

  commit;

  ---------------------------------------- Молекулярная единица
  mParentID := mMoleculeID;
  mID := mParentID * mFactor;

  mID := mID + 1;
  insert into list_measure_group
        (id, parent_id, strcod, name, notice)
  values(mID, mParentID, 'MATTER', 'Вещество', null);

  mID := mID + 1;
  insert into list_measure_group
        (id, parent_id, strcod, name, notice)
  values(mID, mParentID, 'HEAT', 'Теплота', null);

  mID := mID + 1;
  insert into list_measure_group
        (id, parent_id, strcod, name, notice)
  values(mID, mParentID, 'TEMPER', 'Температура', null);

  commit;

  ---------------------------------------- Электромагнитная единица
  mParentID := mEleMagnoID;
  mID := mParentID * mFactor;

  mID := mID + 1;
  insert into list_measure_group
        (id, parent_id, strcod, name, notice)
  values(mID, mParentID, 'ELECTRO', 'Электричество', null);

  mID := mID + 1;
  insert into list_measure_group
        (id, parent_id, strcod, name, notice)
  values(mID, mParentID, 'MAGNETO', 'Магнетизм', null);

  mID := mID + 1;
  insert into list_measure_group
        (id, parent_id, strcod, name, notice)
  values(mID, mParentID, 'RADIATO', 'Излучение', null);

  commit;

  ---------------------------------------- Ядерная единица
  mParentID := mNuclearoID;
  mID := mParentID * mFactor;

  mID := mID + 1;
  insert into list_measure_group
        (id, parent_id, strcod, name, notice)
  values(mID, mParentID, 'NUCLEO', 'Ядро', null);

  commit;

  ---------------------------------------- Природная единица
  --mParentID := mNaturaleID;
  --mID := mParentID * mFactor;

  ---------------------------------------- Общественная единица
  --mParentID := mSocietalID;
  --mID := mParentID * mFactor;

  ---------------------------------------- Экономическая единица
  mParentID := mEconomicID;
  mID := mParentID * mFactor;

  mID := mID + 1;
  insert into list_measure_group
        (id, parent_id, strcod, name, notice)
  values(mID, mParentID, 'NUMBER', 'Количество', null);

  mID := mID + 1;
  insert into list_measure_group
        (id, parent_id, strcod, name, notice)
  values(mID, mParentID, 'BOXING', 'Упаковка', null);

  mID := mID + 1;
  insert into list_measure_group
        (id, parent_id, strcod, name, notice)
  values(mID, mParentID, 'MONETA', 'Деньги', null);

  commit;

  ---------------------------------------- Техническая единица
  mParentID := mTexnicalID;
  mID := mParentID * mFactor;

  mID := mID + 1;
  insert into list_measure_group
        (id, parent_id, strcod, name, notice)
  values(mID, mParentID, 'COMMLINE', 'Коммуникация',
         'Информация и связь');

  mID := mID + 1;
  insert into list_measure_group
        (id, parent_id, strcod, name, notice)
  values(mID, mParentID, 'ENERGY', 'Энергетика',
         'Производство, преобразование, распределение ' ||
         'и использование энергетических ресурсов');

  mID := mID + 1;
  insert into list_measure_group
        (id, parent_id, strcod, name, notice)
  values(mID, mParentID, 'WATERY', 'Гидротехника',
         'Водоснабжение и водоотведение');

  mID := mID + 1;
  insert into list_measure_group
        (id, parent_id, strcod, name, notice)
  values(mID, mParentID, 'AGRONOMY', 'Агрономия',
         'Сельское хозяйство и производство сырья');

  mID := mID + 1;
  insert into list_measure_group
        (id, parent_id, strcod, name, notice)
  values(mID, mParentID, 'INDUSTRY', 'Промышленность',
         'Добывающая и обрабатывающая промышленность');

  mID := mID + 1;
  insert into list_measure_group
        (id, parent_id, strcod, name, notice)
  values(mID, mParentID, 'BUILDING', 'Строительство',
         'Возведение и ремонт зданий и сооружений');

  mID := mID + 1;
  insert into list_measure_group
        (id, parent_id, strcod, name, notice)
  values(mID, mParentID, 'TRANSFER', 'Транспорт',
         'Транспортировка и складское хозяйство');

  commit;

  ---------------------------------------- Отдельная единица
  mParentID := mSeparateID;
  mID := mParentID * mFactor;

  mID := mID + 1;
  insert into list_measure_group
        (id, parent_id, strcod, name, notice)
  values(mID, mParentID, 'ELSE', 'Другое', null);

  commit;

  ----------------------------------------
end;

$$ language plpgsql;
