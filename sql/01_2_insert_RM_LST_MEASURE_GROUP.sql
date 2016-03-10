-- ���������� "������ ������ ���������": ���������� �������.

/*
  1. ������ �.�. ������� ���������� �������.-
     �.: ������ �����, 1977.- 288 �.: ��.
  2. �������������� ������������� ������ ��������� (����)
     Russian Classification of Units of Measurement (RCUM)

     �� 015-94
     ���� �������� 1996-01-01
     http://www.pntd.ru/ok/ok_015-94.php
*/

declare
  mDeriv                constant number := 10;
  mFactor               constant number := 100;
  
  mCommunalID           constant number := 1;
  mExactingID           constant number := 2;
  mPhysicalID           constant number := 3;
  mNaturaleID           constant number := 4;
  mSocietalID           constant number := 5;
  mTexnicalID           constant number := 7;
  mSeparateID           constant number := 9;

  mMechanicID           constant number := mPhysicalID*mDeriv + 1;
  mMoleculeID           constant number := mPhysicalID*mDeriv + 2;
  mEleMagnoID           constant number := mPhysicalID*mDeriv + 3;
  mNuclearoID           constant number := mPhysicalID*mDeriv + 4;
  mEconomicID           constant number := mSocietalID*mDeriv + 1;

  mID                   number;
  mParentID             number;

begin
  ----------------------------------------

  ---------------------------------------- �������� ������
  mID := mCommunalID;
  insert into rm_lst_measure_group
        (id, parent_id, strcod, name, notice)
  values(mID, null, 'COMMUNAL',
         '����� �������', '������� ������ ���������');

  mID := mExactingID;
  insert into rm_lst_measure_group
        (id, parent_id, strcod, name, notice)
  values(mID, null, 'EXACTING',
         '������ �������', '������ �����: ���������� � �����������');

  mID := mPhysicalID;
  insert into rm_lst_measure_group
        (id, parent_id, strcod, name, notice)
  values(mID, null, 'PHYSICAL',
         '������������ �������',
         '������������ �����: ������, �����, ...');

  mID := mNaturaleID;
  insert into rm_lst_measure_group
        (id, parent_id, strcod, name, notice)
  values(mID, null, 'NATURALE',
         '��������� �������',
         '��������� �����: ��������, ���������, ��������, ...');

  mID := mSocietalID;
  insert into rm_lst_measure_group
        (id, parent_id, strcod, name, notice)
  values(mID, null, 'SOCIETAL',
         '������������ �������',
         '������������ �����: ���������, ...');

  mID := mTexnicalID;
  insert into rm_lst_measure_group
        (id, parent_id, strcod, name, notice)
  values(mID, null, 'TEXNICAL',
         '����������� �������',
         '����������� � ������������ ����������');

  mID := mSeparateID;
  insert into rm_lst_measure_group
        (id, parent_id, strcod, name, notice)
  values(mID, null, 'SEPARATE',
         '��������� �������',
         '�������������������� � ������������� �������');

  commit;

  ---------------------------------------- ����������� ������
  mParentID := mPhysicalID; -- ������������ �������

  mID := mMechanicID;
  insert into rm_lst_measure_group
        (id, parent_id, strcod, name, notice)
  values(mID, mParentID, 'MECHANIC',
         '������������ �������',
         '������� � ������������ �����������');

  mID := mMoleculeID;
  insert into rm_lst_measure_group
        (id, parent_id, strcod, name, notice)
  values(mID, mParentID, 'MOLECULE',
         '������������ �������',
         '������� � ������������ ������ � �����, ' ||
         '������������� � �������������� ������');

  mID := mEleMagnoID;
  insert into rm_lst_measure_group
        (id, parent_id, strcod, name, notice)
  values(mID, mParentID, 'ELEMAGNO',
         '���������������� �������',
         '������� � ����������������� � ������� ������');

  mID := mNuclearoID;
  insert into rm_lst_measure_group
        (id, parent_id, strcod, name, notice)
  values(mID, mParentID, 'NUCLEARO',
         '������� �������',
         '������� � ������� � ��������� ������');

  commit;

  ----------------------------------------
  mParentID := mSocietalID; -- ������������ �������

  mID := mEconomicID;
  insert into rm_lst_measure_group
        (id, parent_id, strcod, name, notice)
  values(mID, mParentID, 'ECONOMIC',
         '������������� �������',
         '������������� ����������');

  ---------------------------------------- ���������� ������

  ---------------------------------------- ����� �������
  mParentID := mCommunalID;
  mID := mParentID * mFactor;

  mID := mID + 1;
  insert into rm_lst_measure_group
        (id, parent_id, strcod, name, notice)
  values(mID, mParentID, 'CALCUL', '����', '������� �������');

  commit;

  ---------------------------------------- ������ �������
  mParentID := mExactingID;
  mID := mParentID * mFactor;

  mID := mID + 1;
  insert into rm_lst_measure_group
        (id, parent_id, strcod, name, notice)
  values(mID, mParentID, 'AMOUNT', '��������', null);

  mID := mID + 1;
  insert into rm_lst_measure_group
        (id, parent_id, strcod, name, notice)
  values(mID, mParentID, 'INFORM', '����������', null);

  commit;

  ---------------------------------------- ������������ �������
  --mParentID := mPhysicalID;
  --mID := mParentID * mFactor;

  ---------------------------------------- ������������ �������
  mParentID := mMechanicID;
  mID := mParentID * mFactor;

  mID := mID + 1;
  insert into rm_lst_measure_group
        (id, parent_id, strcod, name, notice)
  values(mID, mParentID, 'LENGTH', '�����', null);

  mID := mID + 1;
  insert into rm_lst_measure_group
        (id, parent_id, strcod, name, notice)
  values(mID, mParentID, 'SQUARE', '�������', null);

  mID := mID + 1;
  insert into rm_lst_measure_group
        (id, parent_id, strcod, name, notice)
  values(mID, mParentID, 'VOLUME', '�����', null);

  mID := mID + 1;
  insert into rm_lst_measure_group
        (id, parent_id, strcod, name, notice)
  values(mID, mParentID, 'MASS', '�����', null);

  mID := mID + 1;
  insert into rm_lst_measure_group
        (id, parent_id, strcod, name, notice)
  values(mID, mParentID, 'TEMP', '�����', null);

  mID := mID + 1;
  insert into rm_lst_measure_group
        (id, parent_id, strcod, name, notice)
  values(mID, mParentID, 'MOTION', '��������', null);

  mID := mID + 1;
  insert into rm_lst_measure_group
        (id, parent_id, strcod, name, notice)
  values(mID, mParentID, 'ACTION', '��������', null);

  mID := mID + 1;
  insert into rm_lst_measure_group
        (id, parent_id, strcod, name, notice)
  values(mID, mParentID, 'WAVING', '�����', null);

  commit;

  ---------------------------------------- ������������ �������
  mParentID := mMoleculeID;
  mID := mParentID * mFactor;

  mID := mID + 1;
  insert into rm_lst_measure_group
        (id, parent_id, strcod, name, notice)
  values(mID, mParentID, 'MATTER', '��������', null);

  mID := mID + 1;
  insert into rm_lst_measure_group
        (id, parent_id, strcod, name, notice)
  values(mID, mParentID, 'HEAT', '�������', null);

  mID := mID + 1;
  insert into rm_lst_measure_group
        (id, parent_id, strcod, name, notice)
  values(mID, mParentID, 'TEMPER', '�����������', null);

  commit;

  ---------------------------------------- ���������������� �������
  mParentID := mEleMagnoID;
  mID := mParentID * mFactor;

  mID := mID + 1;
  insert into rm_lst_measure_group
        (id, parent_id, strcod, name, notice)
  values(mID, mParentID, 'ELECTRO', '�������������', null);

  mID := mID + 1;
  insert into rm_lst_measure_group
        (id, parent_id, strcod, name, notice)
  values(mID, mParentID, 'MAGNETO', '���������', null);

  mID := mID + 1;
  insert into rm_lst_measure_group
        (id, parent_id, strcod, name, notice)
  values(mID, mParentID, 'RADIATO', '���������', null);

  commit;

  ---------------------------------------- ������� �������
  mParentID := mNuclearoID;
  mID := mParentID * mFactor;

  mID := mID + 1;
  insert into rm_lst_measure_group
        (id, parent_id, strcod, name, notice)
  values(mID, mParentID, 'NUCLEO', '����', null);

  commit;

  ---------------------------------------- ��������� �������
  --mParentID := mNaturaleID;
  --mID := mParentID * mFactor;

  ---------------------------------------- ������������ �������
  --mParentID := mSocietalID;
  --mID := mParentID * mFactor;

  ---------------------------------------- ������������� �������
  mParentID := mEconomicID;
  mID := mParentID * mFactor;

  mID := mID + 1;
  insert into rm_lst_measure_group
        (id, parent_id, strcod, name, notice)
  values(mID, mParentID, 'NUMBER', '����������', null);

  mID := mID + 1;
  insert into rm_lst_measure_group
        (id, parent_id, strcod, name, notice)
  values(mID, mParentID, 'BOXING', '��������', null);

  mID := mID + 1;
  insert into rm_lst_measure_group
        (id, parent_id, strcod, name, notice)
  values(mID, mParentID, 'MONETA', '������', null);

  commit;

  ---------------------------------------- ����������� �������
  mParentID := mTexnicalID;
  mID := mParentID * mFactor;

  mID := mID + 1;
  insert into rm_lst_measure_group
        (id, parent_id, strcod, name, notice)
  values(mID, mParentID, 'COMMLINE', '������������',
         '���������� � �����');

  mID := mID + 1;
  insert into rm_lst_measure_group
        (id, parent_id, strcod, name, notice)
  values(mID, mParentID, 'ENERGY', '����������',
         '������������, ��������������, ������������� ' ||
         '� ������������� �������������� ��������');

  mID := mID + 1;
  insert into rm_lst_measure_group
        (id, parent_id, strcod, name, notice)
  values(mID, mParentID, 'WATERY', '������������',
         '������������� � �������������');

  mID := mID + 1;
  insert into rm_lst_measure_group
        (id, parent_id, strcod, name, notice)
  values(mID, mParentID, 'AGRONOMY', '���������',
         '�������� ��������� � ������������ �����');

  mID := mID + 1;
  insert into rm_lst_measure_group
        (id, parent_id, strcod, name, notice)
  values(mID, mParentID, 'INDUSTRY', '��������������',
         '���������� � �������������� ��������������');

  mID := mID + 1;
  insert into rm_lst_measure_group
        (id, parent_id, strcod, name, notice)
  values(mID, mParentID, 'BUILDING', '�������������',
         '���������� � ������ ������ � ����������');

  mID := mID + 1;
  insert into rm_lst_measure_group
        (id, parent_id, strcod, name, notice)
  values(mID, mParentID, 'TRANSFER', '���������',
         '��������������� � ��������� ���������');

  commit;

  ---------------------------------------- ��������� �������
  mParentID := mSeparateID;
  mID := mParentID * mFactor;

  mID := mID + 1;
  insert into rm_lst_measure_group
        (id, parent_id, strcod, name, notice)
  values(mID, mParentID, 'ELSE', '������', null);

  commit;

  ----------------------------------------
end;
