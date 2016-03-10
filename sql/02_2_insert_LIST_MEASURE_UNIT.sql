-- ���������� "������� ���������": ���������� �������.

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

  ---------------------------------------- ����� �������

  ---------------------------------------- -- ����
  mGroupID := 0;
  sGroupCode := 'CALCUL';
  open cGroupID(sGroupCode);
  fetch cGroupID into mGroupID;
  close cGroupID;

  if (mGroupID > 0) then
    -------- �������
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'UNIT', '�������', '��',
           null, '= 1', null);
  
    -------- ����
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'PERCENT', '�������', '%',
           null, '= 1/100', '����� ���� �������');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'PERMILLE', '��������', '%o',
           null, '= 1/1000', '�������� ���� �������');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'PERMYRIAD', '���������', '%oo',
           null, '= 1/100 % = 1/(100*100)', '����� ���� ��������');

  end if;

  commit;

  -- ������ ������ ������ ������������� ��������!
  if (mID < 4) then mID := 4; end if;

  ---------------------------------------- ������ �������

  ---------------------------------------- -- ��������
  mGroupID := 0;
  sGroupCode := 'AMOUNT';
  open cGroupID(sGroupCode);
  fetch cGroupID into mGroupID;
  close cGroupID;

  if (mGroupID > 0) then
    -------- ������������
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'RADIAN', '������', '���',
           '������� ����', null, '�������� �������');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'STERADIAN', '���������', '��',
           '�������� ����', null, '�������� �������');
  
    -------- ���������
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'ARC_DEGREE', '������', '��.',
           null, '= 1/360 ����������', null);
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'ARC_MINUTE', '������� ������', '''',
           null, '= (1/60) ��.', '(������ ����)');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'ARC_SECOND', '������� �������',
           '''''',
           null, '= (1/60)'' = (1/3600) ��.', '(������� ����)');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'ARC_TURN', '������', '��',
           null, '= 360 ��.', null);

  end if;

  commit;

  ---------------------------------------- -- ����������
  mGroupID := 0;
  sGroupCode := 'INFORM';
  open cGroupID(sGroupCode);
  fetch cGroupID into mGroupID;
  close cGroupID;

  if (mGroupID > 0) then
    -------- ��������
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'BIT', '���', '�',
           '���������� ����������', null,
           '���� ������ � �������� ������� ���������');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'BYTE', '����', '�',
           null, '������ = 8 ���',
           '����� ������������ ��������������/������������ �����');

  end if;

  commit;

  ---------------------------------------- ������������ �������
  --mGroupID := 0;
  --sGroupCode := 'PHYSICAL';

  ---------------------------------------- ������������ �������
  --mGroupID := 0;
  --sGroupCode := 'MECHANIC';

  ---------------------------------------- -- �����
  mGroupID := 0;
  sGroupCode := 'LENGTH';
  open cGroupID(sGroupCode);
  fetch cGroupID into mGroupID;
  close cGroupID;

  if (mGroupID > 0) then
    -------- ���� � ��������
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'METER', '����', '�',
           '����� / ����������', null, '��: �������� �������');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'DECIMETER', '��������', '��',
           null, '= 1/10 �', null);
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'CENTIMETER', '���������', '��',
           null, '= 1/100 �', null);
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'MILLIMETER', '���������', '��',
           null, '= 1/1000 �', null);
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'KILOMETER', '��������', '��',
           null, '= 1000 �', null);
  
    -------- ��������
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'M^-1', '���� � (-1)-� �������', '1/�',
           null, '������� �������� = 1/�', '��');

  end if;

  commit;

  ---------------------------------------- -- �������
  mGroupID := 0;
  sGroupCode := 'SQUARE';
  open cGroupID(sGroupCode);
  fetch cGroupID into mGroupID;
  close cGroupID;

  if (mGroupID > 0) then
    -------- ���� � ��������
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'METER2', '���������� ����', '��.�',
           '�������', '= 1 �2', null);
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'DECIMETER2', '���������� ��������', '��.��',
           null, '= 1/100 ��.�', null);
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'CENTIMETER2', '���������� ���������', '��.��',
           null, '= 1/(10 000) ��.�', null);
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'MILLIMETER2', '���������� ���������', '��.��',
           null, '= 1/(1 000 000) ��.�', null);
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'KILOMETER2', '���������� ��������', '��.��',
           null, '= 1 000 000 ��.�', null);
  
    -------- ��
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'ARE', '��', '�', null, '= 100 ��.�', null);
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'HECTARE', '������', '��',
           null, '= 100 �� = 10 000 ��.�', null);
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'KILOHECTARE', '������ ��������', '1000 ��',
           null, '= 1000 �� = 100 000 �� = 10 ��.��', '(����������)');

  end if;

  commit;

  ---------------------------------------- -- �����
  mGroupID := 0;
  sGroupCode := 'VOLUME';
  open cGroupID(sGroupCode);
  fetch cGroupID into mGroupID;
  close cGroupID;

  if (mGroupID > 0) then
    -------- ���� � ����
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'METER3', '���������� ����', '���.�',
           '�����', '= 1 �3', '(��������)');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'DECIMETER3', '���������� ��������', '���.��',
           null, '= 1/1000 ���.�', null);
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'CENTIMETER3', '���������� ���������', '���.��',
           null, '= 1/(1 000 000) ���.�', null);
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'MILLIMETER3', '���������� ���������', '���.��',
           null, '= 1/(1 000 000 000) ���.�', null);
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'KILOMETER3', '���������� ��������', '���.��',
           null, '= 1 000 000 000 ���.�', null);
  
    -------- ����
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'LITER', '����', '�',
           '����� ���������', '= 1 ���.�� = 1/1000 ���.�', null);
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'MILLILITER', '���������', '��',
           null, '= 1/1000 � = 1 ���.��', null);
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'DEKALITER', '��������', '���',
           null, '= 10 �', null);

  end if;

  commit;

  ---------------------------------------- -- �����
  mGroupID := 0;
  sGroupCode := 'MASS';
  open cGroupID(sGroupCode);
  fetch cGroupID into mGroupID;
  close cGroupID;

  if (mGroupID > 0) then
    -------- �����
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'GRAM', '�����', '�', null, '= 1/1000 ��', null);
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'MILLIGRAM', '����������', '��',
           null, '= 1/1000 �', null);
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'KILOGRAM', '���������', '��',
           '�����', '= 1000 �', '��: �������� �������');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'CENTNER', '�������', '�',
           null, '= 100 �� = 1/10 �', '(���������)');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'TONNE', '�����', '�',
           null, '= 1000 ��', null);
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'KILOTONNE', '���������', '��',
           null, '= 1000 � = 1 000 000 ��', null);
  
    -------- ������
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'CARAT', '�����', '���',
           null, '= 200 �� = 0,0002 ��', null);
  
    --------
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'KG/M3', '��������� �� ���. ����', '��/�3',
           '���������', '= 1 ��/�3', '��');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'M3/KG', '���. ���� �� ���������', '�3/��',
           '�������� �����', '= 1 �3/��', '��');

  end if;

  commit;

  ---------------------------------------- -- �����
  mGroupID := 0;
  sGroupCode := 'TEMP';
  open cGroupID(sGroupCode);
  fetch cGroupID into mGroupID;
  close cGroupID;

  if (mGroupID > 0) then
    -------- ����
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'SECOND', '�������', '�',
           '�����', null, '��: �������� �������');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'MINUTE', '������', '���', null, '= 60 �', null);
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'HOUR', '���', '�', null, '= 60 ��� = 3600 �', null);
  
    -------- ���
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'NATURAL_DAY', '�����', '���',
           null, '= 24 �', '(nychthemeron)');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'DAY', '����', '��', '����', '= 24 �', null);
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'WEEK', '������', '���', null, '= 7 ���', null);
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'DECADE', '������', '���', null, '= 10 ���', null);
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'MONTH', '�����', '���',
           null, '= 1/12 � = 28-31 ���', null);
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'QUARTER', '�������', '�����',
           null, '= 1/4 � = 3 ���', null);
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'HALF_YEAR', '���������', '�������',
           null, '= 1/2 � = 6 ���', null);
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'YEAR', '���', '�', null, '= 12 ���', null);
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'YEARS_NUM', '����� ���', '���',
           '������ � �������', '= 1 �', null);
  
    -------- ����������
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'DECENNARY', '�����������', '������',
           null, '= 10 ���', null);
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'CENTURY', '���', '�',
           null, '= 100 ���', '(��������)');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'CENTENARY', '��������', '������',
           null, '= 100 ���', '(���)');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'MILLENARY', '�����������', '������',
           null, '= 1000 ���', '(���������)');
  
    -------- ���� �������
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'MILLISECOND', '������������', '��',
           null, '= 1/1000 �', null);
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'MICROSECOND', '������������', '���',
           null, '= 1/1000 �� = 1/(1 000 000) �', null);

  end if;

  commit;

  ---------------------------------------- -- ��������
  mGroupID := 0;
  sGroupCode := 'MOTION';
  open cGroupID(sGroupCode);
  fetch cGroupID into mGroupID;
  close cGroupID;

  if (mGroupID > 0) then
    -------- �������
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'M/SEC', '���� � �������', '�/�',
           '��������', '= 1 �/�', '��');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'M/SEC2', '���� �� ������� � ��������', '�/�2',
           '���������', '= 1 �/�2', '��');
  
    -------- ����
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'RAD/SEC', '������ � �������', '���/�',
           '������� ��������', '= 1 ���/�', '��');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'RAD/SEC2', '������ �� ������� � ��������', '���/�2',
           '������� ���������', '= 1 ���/�2', '��');
  
    -------- ������� � ������
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'KG*M/SEC',
           '���������-���� � �������', '��*�/�',
           '������� (���������� ��������)', '= 1 ��*�/�', '��');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'KG*M2',
           '���������-���� � ��������', '��*�2',
           '(������������) ������ �������', '= 1 ��*�2', '��');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'KG*M2/SEC',
           '���������-���� � �������� � �������', '��*�2/�',
           '������ ��������', '= 1 ��*�2/�', '��');
  
    -------- �������� � ���
/*
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'SEC^-1',
           '������� � (-1)-� �������', '1/�',
           '�������� ��������', '= 1/�', '��');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'KG/M4',
           '��������� �� ���� 4-� �������', '��/�4',
           '�������� ���������', '= 1 ��/�4', '��');
*/
/*
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'PASCAL*SEC', '�������-�������', '��*�',
           '������������ ��������', '= 1 ��*�', '��');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'M2/SEC', '��. ���� � �������', '�2/�',
           '������������ ��������, ����������� ��������', '= 1 �2/�', '��');
*/
  end if;

  commit;

  ---------------------------------------- -- ��������
  mGroupID := 0;
  sGroupCode := 'ACTION';
  open cGroupID(sGroupCode);
  fetch cGroupID into mGroupID;
  close cGroupID;

  if (mGroupID > 0) then
    -------- ����
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'NEWTON', '������', '�',
           '����', '= 1 ��*�/�2', '��');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'KG-FORCE', '���������-����', '���',
           '����', '= 1 �� * g �/�2 == 9,80665 �', '�����');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'JOULE', '������', '��',
           '�������, ������', '= 1 �*�', '��');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'WATT', '����', '��',
           '��������', '= 1 ��/�', '��');
  
    -------- �������
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'NEWTON*SEC', '������-�������', '�*�',
           '������� ����', '= 1 �*�', '��');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'NEWTON*M', '������-����', '�*�',
           '������ ����', '= 1 �*�', '��');
  
    -------- ������
/*
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'NEWTON/M3', '������ �� ���. ����', '�/�3',
           '�������� ���', '= 1 �/�3', '��');
*/
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'PASCAL', '�������', '��',
           '��������, (������������) ����������, ������ ���������',
           '= 1 �/�2', '��');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'ATMO_TEX', '��������� (�����������)', '��',
           '��������',
           '= 1 ��� / ��2 = 98 066,5 ��', null);
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'ATMO_STD', '��������� (�����������)', '���',
           '��������',
           '= 101 325 �� ~= 1 ���', null);
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'BAR', '���', '���',
           '��������',
           '= 100 000 �� ~= 1 ���', null);
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'MMHG', '��������� �������� ������', '�� ��.��.',
           '����������� ��������',
           '= 1/760 ��� = 101 325 / 760 �� ~= 133,322 ��', '(����)');

    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'NEWTON/M', '������ �� ����', '�/�',
           'Ƹ�������, ������������� ���������', '= 1 �/�', '��');
/*
    -------- �������������� ����
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'NEWTON/KG', '������ �� ���������', '�/��',
           '������������ ��������������� ����', '= 1 �/��', '��');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'J/KG', '������ �� ���������', '��/��',
           '��������� ��������������� ����', '= 1 ��/��', '��');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'J/KG*M', '������ �� ���������-����', '��/(��*�)',
           '�������� ���������� ��������������� ����', '= 1 ��/(��*�)', '��');
*/
  end if;

  commit;

  ---------------------------------------- -- �����
  mGroupID := 0;
  sGroupCode := 'WAVING';
  open cGroupID(sGroupCode);
  fetch cGroupID into mGroupID;
  close cGroupID;

  if (mGroupID > 0) then
    -------- �������
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'ONE/SEC', '������� � �������', '1/�',
           '�������, �������� �������', '= 1/�', '��');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'HERTZ', '����', '��',
           '������� �������������� ��������, ' ||
           '����������� ���������', '= 1/�', '��');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'NEWTON*SEC/M', '������-������� �� ����', '�*�/�',
           '����������� �������������', '= 1 �*�/�', '��');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'ONE/M', '������� �� ����', '1/�',
           '�������� �����', '= 1/�', '��');

  end if;

  commit;

  ---------------------------------------- ������������ �������
  --mGroupID := 0;
  --sGroupCode := 'PROBABLE';

  ---------------------------------------- -- ��������
  mGroupID := 0;
  sGroupCode := 'MATTER';
  open cGroupID(sGroupCode);
  fetch cGroupID into mGroupID;
  close cGroupID;

  if (mGroupID > 0) then
    -------- ����
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'MOLE', '����', '����',
           '���������� ��������', null, '��: �������� �������');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'ONE/M3', '������� �� ���. ����', '1/�3',
           '������������ �������', '= 1/�3', '��');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'KG/MOLE', '��������� �� ����', '��/����',
           '�������� �����', '= 1 ��/����', '��');

  end if;

  commit;

  ---------------------------------------- -- �������
  mGroupID := 0;
  sGroupCode := 'HEAT';
  open cGroupID(sGroupCode);
  fetch cGroupID into mGroupID;
  close cGroupID;

  if (mGroupID > 0) then
    -------- �����
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'H:JOULE', '������', '��',
           '�������', '= 1 �*�', '��');
/*
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'H:J/KG', '������ �� ���������', '��/��',
           '�������� ���������� �������', '= 1 ��/��', '��');
*/
    -------- �����������
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'H:J/KELVIN', '������ �� �������', '��/�',
           '����������� �������', '= 1 ��/�', '��');
/*
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'H:J/KG*KELVIN',
           '������ �� ���������-�������', '��/(��*�)',
           '�������� �����������', '= 1 ��/(��*�)', '��');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'H:J/MOLE*KELVIN',
           '������ �� ����-�������', '��/(����*�)',
           '�������� �����������', '= 1 ��/(����*�)', '��');
*/
    -------- �������� �����
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'H:WATT', '����', '��',
           '�������� �����/��������', '= 1 ��/�', '��');
/*
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'H:W/M2', '���� �� ��. ����', '��/�2',
           '��������� ��������� ������', '= 1 ��/�2', '��');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'H:W/M*KELVIN',
           '���� �� ����-�������', '��/(�*�)',
           '(�����������) ����������������', '= 1 ��/(�*�)', '��');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'H:W/M*KELVIN',
           '���� �� ��. ����-�������', '��/(�2*�)',
           '����������� �����������, �������������', '= 1 ��/(�2*�)', '��');
*/
    -------- ��������
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'Y:JOULE', '������', '��',
           '���������', '= 1 �*�', '��');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'Y:J/KELVIN', '������ �� �������', '��/�',
           '��������', '= 1 ��/�', '��');
/*
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'Y:J/KG*KELVIN',
           '������ �� ���������-�������', '��/(��*�)',
           '�������� ��������', '= 1 ��/(��*�)', '��');
*/
  end if;

  commit;

  ---------------------------------------- -- �����������
  mGroupID := 0;
  sGroupCode := 'TEMPER';
  open cGroupID(sGroupCode);
  fetch cGroupID into mGroupID;
  close cGroupID;

  if (mGroupID > 0) then
    -------- ������
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'KELVIN', '�������', '�',
           '����������������� �����������', null, '��: �������� �������');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'CELSIUS', '������ �������', '��.C',
           '����������� �������', null,
           '�������: tC = T - T0, T0 = 273,15 �');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'FAHRENHEIT', '������ ����������', '��.F',
           '����������� ����������', null,
           '�������: tF = 9/5*tC + 32; tC = 5/9*(tF - 32)');
  
    -------- �������������
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'KELVIN/M', '������� �� ����', '�/�',
           '�������� �����������', '= 1 �/�', '��');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'T:M2/SEC', '��. ���� � �������', '�2/�',
           '����������������������', '= 1 �2/�', '��');

  end if;

  commit;

  ---------------------------------------- ���������������� �������
  --mGroupID := 0;
  --sGroupCode := 'ELEMAGNO';

  ---------------------------------------- -- �������������
  mGroupID := 0;
  sGroupCode := 'ELECTRO';
  open cGroupID(sGroupCode);
  fetch cGroupID into mGroupID;
  close cGroupID;

  if (mGroupID > 0) then
    -------- ������������� �����
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'COULOMB', '�����', '��',
           '������������� ����� (���������� �������������)', '= 1 �*�', '��');
/*
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'COULOMB/M', '����� �� ����', '��/�',
           '�������� ��������� �������������� ������', '= 1 ��/�', '��');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'COULOMB/M2', '����� �� ��. ����', '��/�2',
           '������������� ��������� �������������� ������', '= 1 ��/�2', '��');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'COULOMB/M3', '����� �� ���. ����', '��/�3',
           '�������� ��������� �������������� ������', '= 1 ��/�3', '��');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'COULOMB*M', '�����-����', '��*�',
           '������������� ������ ������', '= 1 ��*�', '��');
*/
    -------- ������������� ���
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'AMPERE', '�����', '�',
           '���� (��������������) ����, �.�.�.', null, '��: �������� �������');
/*
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'A/M2', '����� �� ��. ����', '�/�2',
           '��������� �������������� ����', '= 1 �/�2', '��');
*/
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'VOLT', '�����', '�',
           '������������� ����������/���������, �.�.�.',
           '= 1 ��/� = 1 ��/��', '��');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'OHM', '��', '��',
           '������������� �������������', '= 1 �/�', '��');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'OHM*M', '��-����', '��*�',
           '�������� ������������� �������������', '= 1 ��*�', '��');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'SIEMENS', '������', '��',
           '������������� ������������', '= 1/�� = 1 �/�', '��');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'SIEMENS/M', '������ �� ����', '��/�',
           '�������� ������������� ������������', '= 1 ��/�= 1/(��*�)', '��');
  
    -------- ������������� ����
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'V/M', '����� �� ����', '�/�',
           '������������/�������� �������������� ����', '= 1 �/�� = 1 �/�', '��');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'V*M', '�����-����', '�*�',
           '����� (�������) ������������ �������������� ����', '= 1 �*�', '��');
  
    -------- �������������
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'FARAD', '������', '�',
           '������������� �������', '= 1 ��/�', '��');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'FARAD/M', '������ �� ����', '�/�',
           '������������� ����������', '= 1 ��/(�*�) = 1 �/�', '��');

  end if;

  commit;

  ---------------------------------------- -- ���������
  mGroupID := 0;
  sGroupCode := 'MAGNETO';
  open cGroupID(sGroupCode);
  fetch cGroupID into mGroupID;
  close cGroupID;

  if (mGroupID > 0) then
    -------- ��������� �����
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'J/A', '������ �� �����', '��/�',
           '��������� ����� (���������� ����������)', '= 1 ��/�', '��');
  
    -------- ��������� ��������� ����
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'A*M2', '�����-��. ����', '�*�2',
           '��������� ������ (��������������) ����', '= 1 �*�2', '��');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'TESLA', '�����', '�',
           '��������� ��������', '= 1 �/(�*�)', '��');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'HENRY', '�����', '�',
           '�������������', '= 1 ��/�', '��');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'A/WEBER', '����� �� �����', '�/��',
           '��������� �������������', '= 1 �/��', '��');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'WEBER/A', '����� �� �����', '��/�',
           '��������� ������������', '= 1 ��/�', '��');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'A/M', '����� �� ����', '�/�',
           '���������������', '= 1 �/�', '��');
  
    -- ��������� ����
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'WEBER', '�����', '��',
           '��������� �����', '= 1 �*�2 = 1 �*�', '��');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'HENRY/M', '����� �� ����', '�/�',
           '������������ ���������� ����, ��������� ����������', '= 1 �/�', '��');

  end if;

  commit;

  ---------------------------------------- -- ���������
  mGroupID := 0;
  sGroupCode := 'RADIATO';
  open cGroupID(sGroupCode);
  fetch cGroupID into mGroupID;
  close cGroupID;

  if (mGroupID > 0) then
  -------- ����
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'CANDELA', '�������', '��',
           '���� �����', null, '��: �������� �������');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'DIOPTER', '��������', '��',
           '���������� ���� �����', '= 1/�', '��');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'W/SR', '���� �� ���������', '��/��',
           '�������������� ���� ���������', '= 1 ��/��', '��');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'W/SR*M2',
           '���� �� ���������-��. ����', '��/(��*�2)',
           '�������������� �������/����������', '= 1 ��/(��*�2)', '��');
  
    -------- �������� �����
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'LUMEN', '�����', '��',
           '�������� �����', '= 1 ��*��', '��');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'LUMEN/W', '����� �� ����', '��/��',
           '������������ �������� �������������', '= 1 ��/��', '��');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'LUX', '����', '��',
           '������������/����������', '= 1 ��/�2', '��');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'CANDELA/M2', '������� �� ��. ����', '��/�2',
           '�������', '= 1 ��/�2', '��');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'LUMEN*SEC', '�����-�������', '��*�',
           '�������� �������', '= 1 ��*�', '��');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'LUX*SEC', '����-�������', '��*�',
           '�������� ����������', '= 1 ��*�', '��');

  end if;

  commit;

  ---------------------------------------- ������� �������
  --mGroupID := 0;
  --sGroupCode := 'NUCLEARO';

  ---------------------------------------- -- ����
  mGroupID := 0;
  sGroupCode := 'NUCLEO';
  open cGroupID(sGroupCode);
  fetch cGroupID into mGroupID;
  close cGroupID;

  if (mGroupID > 0) then
    -------- ����
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'BECQUEREL', '���������', '��',
           '���������� �������', '= 1 ������/�', '��');
/*
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'BECQUEREL/KG', '��������� �� ���������', '��/��',
           '�������� �������� ����������', '= 1 ��/��', '��');
*/
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'GRAY', '����', '��',
           '���� ���������', '= 1 ��/��', '��');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'HERTZ/TESLA', '���� �� �����', '��/�',
           '������������� ���������', '= 1 ��/�', '��');

  end if;

  commit;

  ---------------------------------------- ��������� �������
  --mGroupID := 0;
  --sGroupCode := 'NATURALE';

  ---------------------------------------- ������������ �������
  --mGroupID := 0;
  --sGroupCode := 'SOCIETAL';

  ---------------------------------------- ������������� �������
  --mGroupID := 0;
  --sGroupCode := 'ECONOMIC';

  ---------------------------------------- -- ����������
  mGroupID := 0;
  sGroupCode := 'NUMBER';
  open cGroupID(sGroupCode);
  fetch cGroupID into mGroupID;
  close cGroupID;

  if (mGroupID > 0) then
    -------- �����
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'ARTICLE', '�������', '���',
           null, null, '������������� �������');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'PIECE', '�����', '��',
           null, null, '��������� �������');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'EXEMPLAR', '���������', '���',
           null, null, '��������� ������������� ������������ ���������');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'NUMER', '�����', '���',
           null, null, '������������ ������������� ������������ ���������');
  
    -------- ����
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'PAIR', '����', '���', null, '= 2 ��', null);
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'DOZEN', '������', '�����', null, '= 12 ��', null);
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'GROSS', '�����', '�����',
           null, '= 12 ����� = 144 ��', '(������ �����)');
  
    -------- ������������ ��������
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'CELL', '�������', '����',
           '������������ ��������', null, '������������ ������������ ��������');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'PART', '�����', '�����',
           '������������ ��������', null, '������������ ������������ ��������');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'CHUNK', '�����', '���',
           '������������ ��������', null, '���������� ������������ ��������');
  
    -------- ���������� ��������
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'DOSE', '����', '���',
           '���������� ��������', null, null);
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'PORTION', '������', '������',
           '���������� ��������', null, null);
  
    -------- ������������ ���������
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'SET', '�����', '�����',
           '������������ ���������', null, '��������� ������������ ���������');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'PACKET', '�����', '�����',
           '������������ ���������', null, '������������� ������������ ���������');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'SUIT', '��������', '�����',
           '������������ ���������', null, '������������ ��������� ���������');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'PARTY', '������', '������',
           '������������ ���������', null, '������������� ������������ �����');
  
    -------- �������
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'PLACE', '�����', '����',
           null, null, '����� ������������');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'HUMAN', '�������', '���', null, null, null);
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'FAMILY', '�����', '�����', null, null, null);
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'HEAD', '������', '���', null, null, null);
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'WORKPLACE', '������� �����', '���.����',
           null, null, '����� ������������ ��� ������');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'SHIFT', '�����', '����', null, null, null);
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'HUMAN*HOUR', '��������-���', '���*���',
           '���� �������� �������', '= 1 ��� * 1 �', null);
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'HUMAN*DAY', '��������-����', '���*����',
           '���� �������� �������', '= 1 ��� * 1 ���.��', null);
  
    -------- ���������
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'PAX-SEAT',
           '������������ �����', '����.����',
           '����������� ������������� ��������', '= 1 ��������/��', null);
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'PAX_FLOW',
           '��������������', '����.�����',
           '����� ��������� ����������', '= 1 ��������*��.��.', null);
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'PAX*KM',
           '���������-��������', '�*��',
           '���������������', '= 1 ��������*��', null);
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'TONNE*KM',
           '�����-��������', '�*��',
           ' �����������', '= 1 �*��', null);
  
    -------- ���������
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'LEAF', '����', '�.', null, null, null);
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'ROLL', '�����', '���', null, null, null);
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'BRICK', '������', '����', null, null, null);
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'LINEAR_M', '�������� ����', '���.�',
           null, '����� ��� ��������� ������ = 1 �', null);

  end if;

  commit;

  ---------------------------------------- -- ��������
  mGroupID := 0;
  sGroupCode := 'BOXING';
  open cGroupID(sGroupCode);
  fetch cGroupID into mGroupID;
  close cGroupID;

  if (mGroupID > 0) then
    -------- �������
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'PACKAGE', '��������', '����', null, null, null);
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'BOX', '����', '��', null, null, null);
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'PARCEL', '�������', '�����', null, null, null);
  
    -------- ����������
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'JAR_CAN', '�����', '����', null, null, null);
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'BOTTLE', '�������', '���', null, null, null);
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'AMPULE', '������', '�����', null, null, null);
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'FLACON', '������', '����', null, null, null);

  end if;

  commit;

  ---------------------------------------- -- ������
  mGroupID := 0;
  sGroupCode := 'MONETA';
  open cGroupID(sGroupCode);
  fetch cGroupID into mGroupID;
  close cGroupID;

  if (mGroupID > 0) then
    -------- �����������
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'MONETARY_UNIT', '�������� �������', '�.�.',
           null, null, '����������� �������� �������');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'IMPUTED_UNIT', '�������� �������', '�.�.',
          null, null, '������� ���������/����������� �������� �������');
  
    -------- ����������
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'RUBLE', '�����', '�.', null, null, null);
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'DOLLAR', '������', '$', null, null, null);
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'EURO', '����', '���', null, null, null);

  end if;

  commit;

  ---------------------------------------- ����������� �������
  --mGroupID := 0;
  --sGroupCode := 'TEXNICAL';

  ---------------------------------------- -- ������������
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
    values(mID, mGroupID, 'BAUD', '���', '���',
           '���������� ��������', null, null);

  end if;

  commit;

  ---------------------------------------- -- ����������
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
    values(mID, mGroupID, 'V*A', '�����-�����', '�*�',
           '������ �������� �������������� ����', '= 1 �*�', null);
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'KW*HOUR', '��������-���', '���*�',
           '���������� ��������������',
           '= 1000 ��*� = 1000 �� * 3600 � = 3,6 ���', null);
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'CALORIE', '������� (�������������)', '���',
           '���������� �������� �������', '= 4,1868 ��', null);
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'W*HOUR', '����-���', '��*�',
           '������� �������������',
           '= 1 ��*� = 1 �� * 3600 � = 3600 ��', '���������� �������');
  
    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'A*HOUR', '�����-���', '�*�',
           '������� �������������',
           '= 1 �*� = 1 � * 3600 � = 3600 ��', '���������� �����');

  end if;

  commit;

  ---------------------------------------- -- ������������
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

  ---------------------------------------- -- ���������
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

  ---------------------------------------- -- ��������������
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

  ---------------------------------------- -- �������������
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

  ---------------------------------------- -- ���������
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
           '��������� ���� (�����������)', '�.�.',
           '�������� ���������', '= 75 ���*�/� == 735,49875 ��', null);

    mID := mID + 1;
    insert into list_measure_unit
          (id, group_id, strcod, name, symb, effect, relate, notice)
    values(mID, mGroupID, 'KM/HOUR',
           '�������� � ���', '��/�',
           '�������� ����������',
           '= 1000 � / 3600 � = 5/18 �/� ~= 0,27778 �/�', null);

  end if;

  commit;

  ---------------------------------------- ��������� �������
  --mGroupID := 0;
  --sGroupCode := 'SEPARATE';

  ---------------------------------------- -- ������
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
